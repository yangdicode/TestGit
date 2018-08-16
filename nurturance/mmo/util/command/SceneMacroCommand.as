package mmo.util.command {
	
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.getDefinitionByName;
	
	/**
	 * 
	 */
	public class SceneMacroCommand implements ISceneCommand, IEventDispatcher {
		
		//~ fields ------------------------------------------------------------
		
		//~ fields ------------------------------------------------------------
		
		/** 事件处理器 */
		private var _eventDispatcher:EventDispatcher;
		
		/** 
		 * 子事件队列
		 * 该事件队列中的时间，会按initializeMacroCommand方法中Push的顺序执行
		 * 且必须等待上一条命令执行完毕后，才会执行下一条命令
		 */
		private var _subCommands:Array;
		
		private var _executeCommands:Array;
		
		/**
		 * 参数
		 */
		private var _content:Object;
		
		/**
		 * 当前执行中的命令计数信号量
		 */
		private var _semaphore:int;
		
		/**
		 * 当前执行中的命令的实例
		 */
		private var _executingList:Array;
	
		//~ public methods ----------------------------------------------------
	
		public function SceneMacroCommand() {
			this._eventDispatcher = new EventDispatcher();
			
			this._semaphore = 0;
			
			this._subCommands = [];
			initializeMacroCommand();			
		}

		final public function execute(content:Object):void {
			if(this._semaphore > 0) {
				return;
			}
			
//			trace("execute:" + this._subCommands.length);
			this._executeCommands = this._subCommands.concat();
			executeNextCommand(content);
		}
		
		final public function cancel():void {
			for each(var command:ISceneCommand in this._executingList) {
				command.cancel();
			}
			this._semaphore = 0;
			
			this.dispatchEvent(new SceneCommandEvent(SceneCommandEvent.CANCELED, this));
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void {
			this._eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void {
			this._eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean {
			return this._eventDispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean {
			return this._eventDispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean {
			return this._eventDispatcher.willTrigger(type);
		}
		
		//~ protected methods -------------------------------------------------
		
		protected function initializeMacroCommand():void {
		}
		
		/**
		 * 添加子命令
		 * 
		 * @param commandClassRef	子命令
		 */
		protected function addSubCommand(commandDefine:*):void {
			addParallelSubCommand([commandDefine]);
		}
		
		protected function addParallelSubCommand(commandClassRefs:Array):void {
			this._subCommands.push(commandClassRefs);
		}
		
		//~ private methods ---------------------------------------------------
		
		private function executeNextCommand(content:Object):void {
			if(this._executeCommands.length > 0) {
				var list:Array = this._executeCommands.shift();

				this._executingList = [];
				this._semaphore = list.length;
				
				this._content = {};
				for(var key:String in content) {
					this._content[key] = content[key];
				}
				
				for each(var commandDefine:* in list) {
					var commandInstance:ISceneCommand = this.getCommandInstance(commandDefine);
					
					this._executingList.push(commandInstance);
					
					commandInstance.addEventListener(SceneCommandEvent.SUCCEED, onCommandSucc);
					commandInstance.addEventListener(SceneCommandEvent.FAILED, onCommandFail);
					
					commandInstance.execute(content);
				}
			}
			else {
				this._semaphore = 0;
				succeed(content);
			}
		}
		
		private function getCommandInstance(commandDefine:*):ISceneCommand{
			if(commandDefine is Class){
				return new commandDefine();
			}
			if((typeof commandDefine) == "string"){
				var cls:Class = getDefinitionByName(commandDefine) as Class;
				return new cls();
			}
			return commandDefine;
		}
		
		private function onCommandSucc(e:SceneCommandEvent):void {
			var commandInstance:ISceneCommand = e.command;

			var index:int = this._executingList.indexOf(commandInstance);
			this._executingList.splice(index, 1);
			
			commandInstance.removeEventListener(SceneCommandEvent.FAILED, onCommandFail);
			commandInstance.removeEventListener(SceneCommandEvent.SUCCEED, onCommandSucc);
			
			for(var key:String in e.params) {
				this._content[key] = e.params[key];
			}

			checkSemaphore();
		};
		
		private function onCommandFail(e:SceneCommandEvent):void {
			var commandInstance:ISceneCommand = e.command;
			
			var index:int = this._executingList.indexOf(commandInstance);
			this._executingList.splice(index, 1);
			
			commandInstance.removeEventListener(SceneCommandEvent.FAILED, onCommandFail);
			commandInstance.removeEventListener(SceneCommandEvent.SUCCEED, onCommandSucc);
					
			for(var key:String in e.params) {
				this._content[key] = e.params[key];
			}
			
			// 同一批执行的命令中，若一个失败，则取消其余命令
			for each(var command:ISceneCommand in this._executingList) {
				command.cancel();
			}
			
			fail(this._content);
		}
		
		private function checkSemaphore():void {
			--this._semaphore;
			if(this._semaphore == 0) {
				executeNextCommand(this._content);
			}
		}
		
		private function succeed(content:Object):void {
			trace(this + "succeed ");
			this._semaphore = 0;
			this.dispatchEvent(new SceneCommandEvent(SceneCommandEvent.SUCCEED, this, content));
		}
		
		private function fail(content:Object):void {
			this._semaphore = 0;
			this.dispatchEvent(new SceneCommandEvent(SceneCommandEvent.FAILED, this, content));
		}
								
	}
}