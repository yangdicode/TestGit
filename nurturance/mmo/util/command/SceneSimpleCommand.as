package mmo.util.command {
		
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;

	public class SceneSimpleCommand implements ISceneCommand, IEventDispatcher {
		
		//~ fields ------------------------------------------------------------
		
		/** 事件处理器 */
		private var _eventDispatcher:EventDispatcher;
		
		//~ public methods ----------------------------------------------------
		
		public function SceneSimpleCommand() {
			super();
			this._eventDispatcher = new EventDispatcher();
		}
		
		public function execute(content:Object):void {
		}
		
		public function cancel():void {
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
		
		//~ protected function ------------------------------------------------
		
		final protected function succeed(content:Object):void {
			this.dispatchEvent(new SceneCommandEvent(SceneCommandEvent.SUCCEED, this, content));
		}
		
		final protected function fail(content:Object):void {
			this.dispatchEvent(new SceneCommandEvent(SceneCommandEvent.FAILED, this, content));
		}
		
	}
}