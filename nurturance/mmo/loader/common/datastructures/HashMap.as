package mmo.loader.common.datastructures {
	
	import flash.utils.Dictionary;

	public class HashMap extends Object implements ICollection {
		
		//~ fields ------------------------------------------------------------
		
		private var _length:int;
		private var _weakKeys:Boolean;
		private var _content:Dictionary;

		//~ public methods ----------------------------------------------------

		public function HashMap(weakKeys:Boolean = false) {
			this._weakKeys = _weakKeys;
			this._length = 0;
			this._content = new Dictionary(weakKeys);
		}

		public function get length():int {
			return this._length;
		}
		
		/**
		 * 添加新元素，返回被覆盖的元素
		 * 
		 * @param	key		键值
		 * @param	value	元素
		 * 
		 * @return	被覆盖的元素
		 */
		public function add(key:*, value:*):* {
			var _loc_3:*=undefined;
			if(key == null) {
				throw new ArgumentError("cannot put a value with undefined or null key!");
			}
			if(value == null) {
				return remove(key);
			}
			if(!containsKey(key)) {
				this._length = this._length + 1;
			}
			var ret:* = getValue(key);
			_content[key] = value;
			return ret;
		}

		/**
		 * 删除一个键值，并返回被删除的元素
		 * 
		 * @param	key		键值
		 * 
		 * @return	被删除的元素
		 */
		public function remove(key:*):* {
			if (!containsKey(key))
			{
				return null;
			}
			var ret:* = _content[key];
			delete this._content[key];
			this._length--;
			return ret;
		}

		/**
		 * 判断是否为空
		 * 
		 * @return	true=空
		 */
		public function isEmpty():Boolean {
			return this._length == 0;
		}

		/**
		 * 清空Hashmap
		 */
		public function clear():void {
			this._length=0;
			this._content = new Dictionary(_weakKeys);
		}
		
		/**
		 * 判断是否包含键值
		 * 
		 * @param	key		键值
		 * 
		 * @return	true=包含，false=不包含
		 */
		public function containsKey(key:*):Boolean {
			if(this._content[key] != undefined && this._content[key] != null) {
				return true;
			}
			return false;
		}
		
		/**
		 * 判断是否包含元素
		 * 
		 * @param	value	元素
		 * 
		 * @return	true=包含，false=不包含
		 */
		public function containsValue(value:*):Boolean {
			for each(var val:* in this._content) {
				if(val === value) {
					return true;
				}
			}
			return false;
		}
		
		/**
		 * 获得元素对应的键值
		 * 
		 * @param	value	元素
		 * 
		 * @return	键值
		 */
		public function getKey(value:*):* {
			for(var key:* in _content) {
				if(_content[key] == value) {
					return key;
				}
			}
			return null;
		}

		/**
		 * 获得Hashmap中所有键值
		 * 
		 * @return	所有键值组成的数组
		 */
		public function getKeys():Array {
			var arr:Array = new Array(this._length);
			var index:int=0;
			for(var key:* in _content) {
				arr[index++] = key;
			}
			return arr;
		}
		
		/**
		 * 获得键值的对应元素
		 * 
		 * @param	key		键值
		 * @return	元素
		 */
		public function getValue(key:*) {
			var value:* = _content[key];
			return value != undefined ? (value) : (null);
		}

		/**
		 * 获得Hashmap中所有元素
		 * 
		 * @return	所有元素组成的数组
		 */
		public function getValues():Array {
			var arr:Array = new Array(_length);
			var index:int=0;
			for each(var obj:* in _content) {	
				arr[index++]=obj;
			}
			return arr;
		}

		/**
		 * 对每个键值执行函数
		 * 
		 * @param	func	函数
		 */
		public function eachKey(func:Function):void {
			for(var key:* in _content) {
				func(key);
			}
		}

		/**
		 * 对每个元素执行函数
		 * 
		 * @param	func	函数
		 */
		public function eachValue(func:Function):void {
			for each(var value:* in _content) {
				func(value);
			}
		}

		/**
		 * 对每个键值执行函数
		 * 
		 * @param	func	函数
		 */
		public function each2(func:Function):void {
			for(var key:* in _content) {
				func(key, _content[key]);
			}
			return;
		}

		/**
		 * 获得Hashmap的副本
		 */
		public function clone():HashMap {
			var hash:HashMap = new HashMap(this._weakKeys);
			for (var key:* in _content) {
				hash.add(key, _content[key]);
			}
			return hash;
		}

		/**
		 * 序列化
		 * 
		 * @return	序列化的字符串
		 */
		public function toString():String {
			var keys:Array = getKeys();
			var values:Array = getValues();
			var str:String="";
			for(var i:int = 0; i < this._length; i++) {
				str = str + (keys[i] + " -> " + values[i] + "\n");
			}
			return str;
		}
	}
}
