package mmo.common.objectpool  {
	
	public class ObjectPool {
		
		// 生成对象的工厂
		private var _factory:IObjectPoolFactory;
		
		// 对象池初始大小
		private var _initSize:int;
		// 对象池大小
		private var _currSize:int;
		// 已使用的对象的数目
		private var _usageCount:int;
		
		// 是否根据对象数目自动增大对象池
		private var _grow:Boolean = true;
		
		// 对象链表头指针
		private var _head:ObjectNode;
		// 对象链表尾指针
		private var _tail:ObjectNode;
		
		// 链表中未用结点的头指针
		private var _emptyNode:ObjectNode;
		// 链表中已使用的结点的头指针
		private var _allocNode:ObjectNode;
		
		/**
		 * 新建对象池
		 * 	@params	grow 	true=自己根据对象数目调整对象池大小
		 * 					false=对象池大小固定
		 */
		public function ObjectPool(grow:Boolean = false) {
			this._grow = grow;
		}

		/**
		 * 释放所有资源
		 */
		public function deconstruct():void {
			var node:ObjectNode = this._head;
			var t:ObjectNode;
			while(node) {
				t = node.next;
				node.next = null;
				node.data = null;
				node = t;
			}
			
			this._head = null; 
			this._tail = null;
			this._emptyNode = null;
			this._allocNode = null;
		}
		
		public function dispose():void{
			deconstruct();
			_factory.dispose();
			_factory = null;
		}
		
		/**
		 * 取得对象池的大小
		 */
		public function get size():int {
			return this._currSize;
		}
		
		/**
		 * 取得对象池中已使用的对象的数目
		 */
		public function get usageCount():int {
			return this._usageCount;
		}
		
		/**
		 * 对象池中多余结点的数目，可使用purge()回收
		 */
		public function get wasteCount():int {
			return this._currSize - this._usageCount;	
		}
		
		/**
		 * 从对象池中取出一个对象
		 * 若对象池已满，则抛出异常"Object Pool Full"
		 * 	@return obj
		 */
		public function get object():* {
			// 若对象池已满
			if(this._usageCount == this._currSize) {
				// 若对象池允许自增大
				if(this._grow) {
					this._currSize += this._initSize;
					
					var n:ObjectNode = this._tail;
					var t:ObjectNode = this._tail;
					
					var node:ObjectNode;
					for(var i:int = 0; i < this._initSize; i++) {
						node = new ObjectNode();
						node.data = this._factory.create();
						
						t.next = node;
						t = node; 
					}
					
					this._tail = t;
					
					this._tail.next = this._emptyNode = this._head;
					this._allocNode = n.next;
					return object;
				}
				// 否则抛出空
 				else {
					return null;
				}
			}
			// 对象池未满，分配对象
			else {
				var o:* = this._allocNode.data;
				this._allocNode.data = null;
				this._allocNode = this._allocNode.next;
				this._usageCount++;
				return o;
			}
		}
		
		/**
		 * 往对象池中释放一个结点
		 * 	@params	obj
		 */
		public function set object(o:*):void {
			if(this._usageCount > 0) {
				this._usageCount--;
				this._emptyNode.data = o;
				this._emptyNode = this._emptyNode.next;
			}
		}
		
		/**
		 * 设置对象池的对象工厂
		 */
		public function set factory(factory:IObjectPoolFactory):void {
			this._factory = factory;
		}

		/**
		 * 释放对象池中所有对象，重新分配新对象
		 * 	@param size 	创建对象的数目
		 * 	@param C    	新对象的Class，若不为null，将覆盖已设置的工厂
		 */
		public function allocate(size:int, C:Class = null):void {
			// 释放对象
			deconstruct();
			
			// 若C != null，则覆盖已有的Factory
			if(C != null) {
				this._factory = new SimpleFactory(C);
			}
			else {
				// 若未设置工厂，抛出异常"Nothing to Constrct in Object Pool"
				if(!this._factory)
					throw new Error("Nothing to Constrct in Object Poo");
			}	
			
			// 设置对象池初始大小
			this._initSize = this._currSize = size;
			
			// 头指针
			this._head = new ObjectNode();
			this._head.data = this._factory.create();
			
			// 尾指针
			this._tail = this._head;
			
			var n:ObjectNode;
			for(var i:int = 1; i < this._initSize; i++) {
				n = new ObjectNode();
				n.data = this._factory.create();
				n.next = this._head;
				this._head = n;
			}
			
			this._emptyNode = this._head;
			this._allocNode = this._head;
			this._tail.next = this._head;	// 循环链表
		}
		
		/**
		 * 设置回调函数，在所有对象上调用
		 *	@param func 	函数名
		 * 	@param args 	参数
		 */
		public function callback(func:String, args:Array):void {
			var node:ObjectNode = this._head;
			while(node != null) {
				node.data[func].apply(node.data, args);
				if(node == this._tail) {
					break;
				}
				node = node.next;	
			}
		}
		
		/**
		 * 删除对象池中所有未使用的对象
		 * 如果剩余对象数目小于对象池初始大小，则分配新对象使对象池恢复初始大小
		 */
		public function purge():void {
			var i:int = 0;
			var node:ObjectNode = null;
			
			// 若所有对象都未使用，则恢复对象池大小
			if(this._usageCount == 0) {
				if(this._currSize == this._initSize)
					return;
					
				if(this._currSize > this._initSize) {
					i = 0; 
					node = this._head;
					while(++i < this._initSize)
						node = node.next;	
					
					this._tail = node;
					this._allocNode = this._emptyNode = _head;
					
					this._currSize = this._initSize;
					return;	
				}
			}
			else {
				var a:Array = [];
				node = this._head;
				while(node) {
					// 若node.data == null，则node已被使用
					if(!node.data) {
						a[int(i++)] = node;
					}
					if(node == this._tail) {
						break;
					}
					node = node.next;	
				}

				this._currSize = a.length;
				this._usageCount = this._currSize;
				
				this._head = this._tail = a[0];
				for(i = 1; i < this._currSize; i++) {
					node = a[i];
					node.next = this._head;
					this._head = node;
				}
				
				this._emptyNode = this._allocNode = this._head;
				this._tail.next = this._head;
				
				if(this._usageCount < this._initSize) {
					this._currSize = this._initSize;
					
					var n:ObjectNode = this._tail;
					var t:ObjectNode = this._tail;
					var k:int = this._initSize - this._usageCount;
					for(i = 0; i < k; i++) {
						node = new ObjectNode();
						node.data = this._factory.create();
						
						t.next = node;
						t = node; 
					}
					
					this._tail = t;
					
					this._tail.next = this._emptyNode = this._head;
					this._allocNode = n.next;
					
				}
			}
		}
	}
}
