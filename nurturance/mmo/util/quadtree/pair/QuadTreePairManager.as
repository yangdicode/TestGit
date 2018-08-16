package mmo.util.quadtree.pair {
	
	import flash.utils.Dictionary;
	
	import mmo.util.quadtree.QuadTree;
	import mmo.util.quadtree.QuadTreeConstants;
	import mmo.util.quadtree.QuadTreeDisplayObject;

	public class QuadTreePairManager {
		
		//~ fields ------------------------------------------------------------
		
		private var _callback:IPairHandler;
		private var _quadTree:QuadTree;

		private var _pairTable:Dictionary;
		private var _pairCount:int;
			
		private var _pairPool:Vector.<QuadTreePair>;
		private var _poolMask:int, _readIndex:int, _writeIndex:int;
		
		//~ public methods ----------------------------------------------------
		
		public function QuadTreePairManager(callback:IPairHandler, quadTree:QuadTree) {
			this._callback = callback;
			this._quadTree = quadTree;
			
			this._pairTable = new Dictionary();
						
			var maxPairs:int = QuadTreeConstants.MAX_PAIRS;
			
			this._pairPool = new Vector.<QuadTreePair>(maxPairs, true);
			for(var i:int = 0; i < maxPairs; i++) {
				_pairPool[i] = new QuadTreePair();
			}
			this._poolMask = maxPairs - 1;
		}
		
		public function addPair(proxyId1:int, proxyId2:int):Boolean {
			var key:int = getKey(proxyId1, proxyId2);
			
			if (_pairTable[key]) return false;
			
			var pair:QuadTreePair = _pairPool[_readIndex];
			_readIndex = (_readIndex + 1) & _poolMask;
			
			pair.proxyId1 = proxyId1;
			pair.proxyId2 = proxyId2;
			
			this._callback.handle(proxyId1, proxyId2);
						
			_pairCount++;
			_pairTable[key] = pair;
			
			return true;
		}
		
		public function removePair(proxyId1:int, proxyId2:int):Boolean {
			var key:int = getKey(proxyId1, proxyId2);
			
			var pair:QuadTreePair = _pairTable[key];
			if(pair == null) {
				return false;
			}
			
			this._callback.remove(proxyId1, proxyId2);
			
			_pairPool[_writeIndex] = pair;
			_writeIndex = (_writeIndex + 1) & _poolMask;
			
			_pairCount--;
			delete _pairTable[key];
			
			return true;
		}
		
		private function getKey(proxyId1:int, proxyId2:int):int {
			if(proxyId1 > proxyId2) {
				return (proxyId2 << 16) | proxyId1;
			}
			return (proxyId1 << 16) | proxyId2;
		}
	}
}