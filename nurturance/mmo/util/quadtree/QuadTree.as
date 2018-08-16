package mmo.util.quadtree {
	
	import flash.geom.Rectangle;
	import flash.system.System;
	
	import mmo.util.quadtree.QuadTreeNode;
	import mmo.util.quadtree.QuadTreeProxy;
	import mmo.util.quadtree.pair.IPairHandler;
	import mmo.util.quadtree.pair.QuadTreePairManager;

	public class QuadTree {
		
		private var _nodes:Vector.<QuadTreeNode>;
		private var _offsets:Vector.<int>;

		private var _depth:int;

		private var _xScale:Number;
		private var _yScale:Number;
		
		private var _xmin:Number, _xmax:Number;
		private var _ymin:Number, _ymax:Number;
		
		private var _xOffset:Number;
		private var _yOffset:Number;
		
		private var _proxyList:QuadTreeProxy;
		private var _proxyPool:Vector.<QuadTreeProxy>;
		private var _freeProxy:int;

		private var _pairManager:QuadTreePairManager;
		private var _proxyCount:int;
		
		public function QuadTree(depth:int) {
			_depth = depth;
		}
		
		public function deconstruct():void {
			var p0:QuadTreeProxy; 
			var p1:QuadTreeProxy;
			
			var k:int = _nodes.length;
			for (var i:int = 0; i < k; i++) {
				var node:QuadTreeNode = _nodes[i];
				node.parent = null;
				p1 = node.proxyList;
				while (p1 != null) {
					p0 = p1;
					p1 = p1.nextInNode;
					p0.prevInNode = null;
					p0.nextInNode = null;
				}
			}
			
			p1 = _proxyList;
			while (p1 != null) {
				p0 = p1;
				p1 = p1.nextInTree;
				p0.nextInTree = null;
				p0.prevInTree = null;
				p0.shape = null;
			}
			
			_proxyList = null;
			_proxyPool = null;
			_pairManager = null;
		}
		
		public function init(rect:Rectangle):void {
			_xmin = rect.x; 
			_ymin = rect.y;
			_xmax = rect.x + rect.width; 
			_ymax = rect.y + rect.height;
			
			var w:int = _xmax - _xmin;
			var h:int = _ymax - _ymin;
				
			_xOffset = _xmin < 0 ? -_xmin : 0;
			_yOffset = _ymin < 0 ? -_ymin : 0;
				
			initialize(w, h);
		}

		public function setPairHandler(pairHandler:IPairHandler):void {
			this._pairManager = new QuadTreePairManager(pairHandler, this);
		}
		
		/**
		 * 为显示对象创建Proxy，并绑定到对应结点中
		 * 
		 * @param shape		显示对象
		 * 
		 * @return	Proxy的Id
		 */
		public function createProxy(shape:QuadTreeDisplayObject):int {
			var proxyId:int = _freeProxy;
			var proxy:QuadTreeProxy = _proxyPool[proxyId];
			_freeProxy = proxy.getNext();
			proxy.shape = shape;
			
			proxy.nextInTree = _proxyList;
			if (_proxyList) _proxyList.prevInTree = proxy;
			_proxyList = proxy;
			
			proxy.xl1 = int.MIN_VALUE;
			proxy.yl1 = int.MIN_VALUE;
			proxy.xl2 = int.MIN_VALUE;
			proxy.yl2 = int.MIN_VALUE;
			proxy.shape = shape;
			
			getNodeContaining(proxy.id).insert(proxy);
			
			_proxyCount++;
			
			return proxyId;
		}
		
		/**
		 * 删除Proxy
		 * 
		 * @param proxyId	Proxy的Id
		 */
		public function destroyProxy(proxyId:int):void {
			if (proxyId == QuadTreeProxy.NULL_PROXY) return;
			
			var p1:QuadTreeProxy = _proxyPool[proxyId];
			var p2:QuadTreeProxy;
			
			var s1:QuadTreeDisplayObject = p1.shape;
			var s2:QuadTreeDisplayObject;
			
			var xmin:Number = s1.xmin, xmax:Number = s1.xmax;
			var ymin:Number = s1.ymin, ymax:Number = s1.ymax;
			
			p2 = _proxyList;
			while(p2 != null) {
				if(p1 == p2) {
					p2 = p2.nextInTree;
					continue;
				}
				
				s2 = p2.shape;
				if(xmin > s2.xmax || xmax < s2.xmin || ymin > s2.ymax || ymax < s2.ymin) {
					p2 = p2.nextInTree;
					continue;
				}
				
				if(_pairManager.removePair(p1.id, p2.id)) {
					--p2.overlapCount;
				}
				
				p2 = p2.nextInTree;
			}
			
			//unlink from node
			p1.remove();
			
			//unlink from list
			if(p1.prevInTree) {
				p1.prevInTree.nextInTree = p1.nextInTree;
			}
			if(p1.nextInTree) {
				p1.nextInTree.prevInTree = p1.prevInTree;
			}
			if(p1 == _proxyList) {
				_proxyList = p1.nextInTree;
			}
			
			//recycle & reset
			p1.setNext(_freeProxy);
			_freeProxy = proxyId;
			p1.reset();
			
			_proxyCount--;
		}

		public function moveProxy(proxyId:int):void {
			var proxy:QuadTreeProxy = _proxyPool[proxyId];
			var s:QuadTreeDisplayObject = proxy.shape;
			
			//early out by comparing integer positions
			var x1:int = s.xmin;
			var y1:int = s.ymin;
			
			if (proxy.xl1 == x1 && proxy.yl1 == y1)
				return;
			
			proxy.xl1 = x1;
			proxy.yl1 = y1;
			
			var xl:int = (s.xmin + _xOffset) * _xScale;
			var yt:int = (s.ymin + _yOffset) * _yScale;
			
			//compute new quad tree position
			var xr:int = xl ^ int((s.xmax + _xOffset) * _xScale);
			var yr:int = yt ^ int((s.ymax + _yOffset) * _yScale);
			
			var level:int = _depth;
			while (xr + yr != 0) {
				xr >>= 1;
				yr >>= 1;
				level--;
			}

			var shift:int = _depth - level;
			xl >>= shift;
			yt >>= shift;
			
			//early out by comparing node position
			if (xl == proxy.xl2 && yt == proxy.yl2)
				return;
			
			proxy.xl2 = xl;
			proxy.yl2 = yt;

			proxy.remove();
			
			var node:QuadTreeNode = proxy.node = _nodes[int(_offsets[level] + (yt << (level - 1)) + xl)];
			node.insert(proxy);
		}
		
		public function findParisByProxyId(proxyId:int):void {
			var proxy:QuadTreeProxy = getProxy(proxyId);
			findParisForCustomProxy(proxy);
		}
		
		public function findPairs():void {
			var proxy:QuadTreeProxy = _proxyList;
			
			while(proxy != null) {
				findParisForCustomProxy(proxy);
				
				proxy = proxy.nextInTree;
			}
		}
		
		public function getNodeLevel(proxy:QuadTreeProxy):int {
			var s:QuadTreeDisplayObject = proxy.shape;

			//XOR together the start and end positions on each axis
			var xr:int = int(s.xmin * _xScale + _xOffset) ^ int(s.xmax * _xScale + _xOffset);
			var yr:int = int(s.ymin * _yScale + _yOffset) ^ int(s.ymax * _yScale + _yOffset);
			
			//Each bit in the result indicates that the range volume crosses
			//a point at the corresponding power of 2. The bit position of the
			//highest 1 bit indicates how many levels above the bottom of the
			//quadtree the range can first be properly placed.
			var level:int = _depth;
		
			//count highest bit position
			//to get number of tree levels - bit position */
			while (xr + yr != 0) {
				xr >>= 1;
				yr >>= 1;
				level--;
			}
			
			return level;
		}
		
		public function getNodeContaining(proxyId:int):QuadTreeNode {
			var proxy:QuadTreeProxy = _proxyPool[proxyId];
			var s:QuadTreeDisplayObject = proxy.shape;
			
			var x0:int = (s.xmin + _xOffset) * _xScale;
			var y0:int = (s.ymin + _yOffset) * _yScale;
			var x1:int = (s.xmax + _xOffset) * _xScale;
			var y1:int = (s.ymax + _yOffset) * _yScale;
			
			var xr:int = x0 ^ x1;
			var yr:int = y0 ^ y1;
			
			var level:int = _depth;
			while (xr > 0 || yr > 0) {
				xr >>= 1;
				yr >>= 1;
				level--;
			}

			//lookup node pointer in a 2D vector stored linearly,
			//scale coordinates for quadtree level
			var shift:int = _depth - level;
			x0 >>= shift;
			y0 >>= shift;
			return _nodes[int(_offsets[level] + (y0 << (level - 1)) + x0)];
		}
		
		public function getProxy(proxyId:int):QuadTreeProxy {
			return _proxyPool[proxyId];
		}
		
		public function getProxyList():Vector.<QuadTreeProxy> {
			var list:Vector.<QuadTreeProxy> = new Vector.<QuadTreeProxy>(_proxyCount, true);
			var i:int;
			var p:QuadTreeProxy = _proxyList;
			while (p != null) {
				list[i++] = p;
				p = p.nextInTree;
			}
			
			return list;
		}
		
		private function initialize(width:int, height:int):void {
			var memory:uint = System.totalMemory;
			
			var i:int, x:int, y:int;
			var xsize:int, ysize:int, treeSize:int, levelEdgeSize:int;
			var offset:int;
			var parentOffset:int;
			var node:QuadTreeNode;

			treeSize = 1 << (_depth - 1);
			_xScale = treeSize / width;
			_yScale = treeSize / height;

			for (i = 0, offset = -1; i < _depth; i++) offset += (1 << (i << 1));
			i = offset + 1;
			_nodes = new Vector.<QuadTreeNode>(i, true);
			_offsets = new Vector.<int>(_depth + 1, true);
			_offsets[0] = -1;

			//create nodes, lowest -> highest resolution
			offset = -1;
			for(i = 0; i < _depth; i++) {
				levelEdgeSize = 1 << i;
				_offsets[int(i + 1)] = offset + 1;

				xsize = ysize = treeSize >> i;
				xsize *= width  / treeSize;
				ysize *= height / treeSize;

				for(y = 0; y < levelEdgeSize; y++) {
					for(x = 0; x < levelEdgeSize; x++) {
						node = new QuadTreeNode();
						node.xmin = x * xsize + _xmin; 
						node.ymin = y * ysize + _ymin;
						node.xmax = node.xmin + xsize;
						node.ymax = node.ymin + ysize;

						_nodes[int((offset + 1) + (y * levelEdgeSize + x))] = node;
					}
				}

				offset += (1 << (i << 1));
			}
			
			//setup parent pointer, go from highest -> lowest resolution
			for (i = _depth; i > 1; i--) {
				levelEdgeSize = 1 << (i - 1);
				offset        = _offsets[i];
				parentOffset  = _offsets[int(i - 1)];

				for (y = 0; y < levelEdgeSize; y++)
					for (x = 0; x < levelEdgeSize; x++)
						_nodes[int(offset + y * levelEdgeSize + x)].parent =
						_nodes[int(parentOffset + (y >> 1) * (levelEdgeSize >> 1) + (x >> 1))];
			}
			
			//initialize proxy pool
			var maxProxies:int = QuadTreeConstants.MAX_PROXIES;
			var proxy:QuadTreeProxy;
			_proxyPool = new Vector.<QuadTreeProxy>(maxProxies, true);
			for (i = 0; i < maxProxies - 1; i++) {
				proxy = new QuadTreeProxy();
				proxy.id = i;
				proxy.setNext(i + 1);
				_proxyPool[i] = proxy;
			}
			
			proxy = new QuadTreeProxy();
			proxy.setNext(QuadTreeProxy.NULL_PROXY);
			proxy.id = maxProxies - 1;
			_proxyPool[maxProxies - 1] = proxy;
			
			_freeProxy = 0;
			
			trace("/*////////////////////////////////////////////////////////*");
			trace(" * QUADTREE STATISTICS");
			trace(" * depth = " + (_depth + 1));
			trace(" * unscaled tree size = " + treeSize + "px");
			trace(" * quad node x-scale  = " + _xScale.toFixed(3));
			trace(" * quad node y-scale  = " + _yScale.toFixed(3));
			trace(" * root node size = " + width + "x" + height + "px");
			trace(" * leaf node size = " + (1 / _xScale).toFixed(3) + "x" + (1 / _yScale).toFixed(3) + "px");
			trace(" * max proxies = " + maxProxies);
			trace(" * memory = " + ((System.totalMemory - memory) >> 10) + " KiB");
			trace(" ////////////////////////////////////////////////////////*/");
			trace("");
		}
		
		private function findParisForCustomProxy(proxy:QuadTreeProxy):void {
			var node:QuadTreeNode;
			
			var p1:QuadTreeProxy = proxy;
			var p2:QuadTreeProxy;
			
			var s1:QuadTreeDisplayObject;
			var s2:QuadTreeDisplayObject;
			
			s1 = p1.shape;
			
			//search contained node; brute-force
			p2 = p1.nextInNode;
			while (p2 != null) {
				s2 = p2.shape;
				
				//separated?
				if (s1.xmin > s2.xmax || s1.xmax < s2.xmin 
					|| s1.ymin > s2.ymax || s1.ymax < s2.ymin) {
					//remove pairs if the AABB's cease to overlap
					if ((p1.overlapCount | p2.overlapCount) > 0) {
						if (_pairManager.removePair(p1.id, p2.id)) {
							--p1.overlapCount;
							--p2.overlapCount;	
						}
					}
				}
				else {
					//create pairs if the AABB's start to overlap
					if (_pairManager.addPair(p1.id, p2.id)) {
						++p1.overlapCount;
						++p2.overlapCount;
					}
				}
				
				p2 = p2.nextInNode;
			}
			
			//bubble up
			node = p1.node.parent;
			while (node != null) {
				p2 = node.proxyList;
				while (p2 != null) {
					s2 = p2.shape;
					
					//separated?
					if (s1.xmin > s2.xmax || s1.xmax < s2.xmin || s1.ymin > s2.ymax || s1.ymax < s2.ymin) {
						//remove pairs if the AABB's cease to overlap
						if ((p1.overlapCount | p2.overlapCount) > 0) {
							if (_pairManager.removePair(p1.id, p2.id)) {
								--p1.overlapCount;
								--p2.overlapCount;	
							}
						}
					}
					else {
						//create pairs if the AABB's start to overlap
						if (_pairManager.addPair(p1.id, p2.id)) {
							++p1.overlapCount;
							++p2.overlapCount;
						}
					}
					
					p2 = p2.nextInNode;
				}
				
				node = node.parent;
			}
		}
	}
}