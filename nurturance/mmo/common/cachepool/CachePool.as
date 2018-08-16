package mmo.common.cachepool {
	
	import flash.utils.Dictionary;
	
	/**
	 * 缓存池
	 * 缓存常用对象
	 * 当池满时，删除较少使用的对象
	 */
	public class CachePool {
		
		//~ fields ------------------------------------------------------------
		
		/** 缓存池大小 */
		private var _size:int;
		
		/** 缓存对象键值的序列 */
		private var _keyArr:Array;
		
		/** 缓存对象的Hash */
		private var _cacheMap:Dictionary;
		
		/** 用于Clock算法的“使用位”信息 */
		private var _usageArr:Array;
		
		/** Clock算法的指针 */
		private var _pointer:int;
		
		//~ public methods ----------------------------------------------------
		
		public function CachePool(size:int) {
			this._size = size;
			
			this._keyArr = new Array(size);
			this._usageArr = new Array(size);
			for(var i:int = 0; i < size; i++) {
				this._keyArr[i] = null;
				this._usageArr[i] = 0;
			}
			
			this._cacheMap = new Dictionary();
			
			this._pointer = 0;
		}
		
		/**
		 * 从缓存池中读取对象
		 * 若缓存池中有该对象，则返回该对象的引用
		 * 否则返回null
		 * 
		 * @param key	键值
		 */
		public function getObject(key:String):* {
			// 若有缓存，则直接返回缓存的数据
			// 否则返回null
			if(!this._cacheMap.hasOwnProperty(key)) {
				return null;
			}
			
			var cacheIndex:int = this._keyArr.indexOf(key);
			if(cacheIndex < 0) {
				return null;
			}
			
			// 重置Clock算法的使用位信息
			this._usageArr[cacheIndex] = 1;
				
			// 返回缓存的数据
			return this._cacheMap[key];
		}
		
		/**
		 * 向缓存池中添加对象
		 * 
		 * @param key		键值
		 * @param content	对象
		 */
		public function addObject(key:String, content:*):void {
			// 计算缓存数组中可用的位置，完成后_pointer指向可用的位置
			// 该位置可能是原本空的位置，也可能是换出一个元素后清空的位置
			calcAvailableIndex();
			
			// 修改缓存队列
			this._keyArr[this._pointer] = key;
			
			// 重置使用位
			this._usageArr[this._pointer] = 1;
			
			// 保存对象
			this._cacheMap[key] = content;
		}
		
		//~ private methods ---------------------------------------------------
		
		/**
		 * 计算缓存数组中可用的位置，完成后_pointer指向可用的位置
		 */
		private function calcAvailableIndex():void {
			// 若_poiner指向的位置的“使用位”不为0，则不可用，寻找下一个可用的位置
			while(this._usageArr[this._pointer] != 0) {
				this._usageArr[this._pointer] = 0;
				
				this._pointer++;
				if(this._pointer >= this._size) {
					this._pointer = 0;
				}
			}
			
			// 若该位置已被使用，则需要释放该位置中已缓存的资源
			if(this._keyArr[this._pointer] != null) {
				var key:String = this._keyArr[this._pointer] as String;
				delete this._cacheMap[key];
				
				this._keyArr[this._pointer] = null;
			}
		}
		
	}
}