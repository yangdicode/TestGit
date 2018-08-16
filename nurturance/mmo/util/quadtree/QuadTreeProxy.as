package mmo.util.quadtree {
	
	public class QuadTreeProxy {
		
		public static const NULL_PROXY:int = 0xffff;
		
		public var id:int;
		public var shape:QuadTreeDisplayObject;
		public var overlapCount:int;
		
		public var nextInNode:QuadTreeProxy;
		public var prevInNode:QuadTreeProxy;
		
		public var nextInTree:QuadTreeProxy;
		public var prevInTree:QuadTreeProxy;
		
		public var node:QuadTreeNode;
		
		public var xl1:int, xl2:int;
		public var yl1:int, yl2:int;
		
		private var _next:int;
		
		public function remove():void {
			if(prevInNode != null) {
				prevInNode.nextInNode = nextInNode;
			}
			if(nextInNode != null) {
				nextInNode.prevInNode = prevInNode;
			}
			if(this == node.proxyList) {
				node.proxyList = nextInNode;
			}
			
			prevInNode = null;
			nextInNode = null;
			node = null;
		}
		
		public function setNext(i:int):void {
			_next = i;
		}
		
		public function getNext():int {
			return _next;	
		}
		
		public function reset():void {
			nextInNode = null;
			prevInNode = null;
			nextInTree = null;
			prevInTree = null;
			
			node = null;
			
			xl1 = int.MIN_VALUE;
			yl1 = int.MIN_VALUE;	
			xl2 = int.MIN_VALUE;
			yl2 = int.MIN_VALUE;
			
			overlapCount = 0;
			shape = null;
		}
	}
}