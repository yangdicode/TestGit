package mmo.framework.control
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;
	
	public class EventCenter
	{
		private var _dispatcher:EventDispatcher;
		private var _dispatcher_listeners:Dictionary;
		private var _register:Boolean;
		/**
		 * 注册去管理中心
		 * 使其可以广播或者监听到其他已注册center的事件
		 * */
		public function EventCenter(defaultDispatcher:EventDispatcher = null, register:Boolean = false)
		{
			_dispatcher = defaultDispatcher == null ? new EventDispatcher() : defaultDispatcher;
			_dispatcher_listeners = new Dictionary();
			_register = register;
			if(_register)
			{
				EventCenterManagement.instance.register(this);
			}	
		}
		
		public function dispose():void{
			if(_register){
				EventCenterManagement.instance.unregister(this);
			}
			var typeList:Array;
			for each(var dispatcherMap:EventCenterDispatcherMap in _dispatcher_listeners){
				typeList = dispatcherMap.typeList;
				for each(var type:String in typeList){
					dispatcherMap.dispatcher.removeEventListener(type, notifyListener);
				}
				dispatcherMap.dispose();
			}
			_dispatcher_listeners = null;
		}
		
		public function get hasRegister():Boolean{
			return _register;
		}	
		
		public function addEventListener(type:String, listener:*, dispatcher:IEventDispatcher = null):void{
			if(dispatcher == null){
				dispatcher = _dispatcher;
			}
			dispatcher.addEventListener(type, notifyListener);
			
			if(_dispatcher_listeners[dispatcher] == undefined){
				_dispatcher_listeners[dispatcher] = new EventCenterDispatcherMap(dispatcher);
			}
			EventCenterDispatcherMap(_dispatcher_listeners[dispatcher]).addListener(type, listener);
		}	
		
		public function removeEventListener(type:String, listener:*, dispatcher:IEventDispatcher = null):void{
			if(dispatcher == null){
				dispatcher = _dispatcher;
			}
			if(_dispatcher_listeners[dispatcher] == undefined){
				return;
			}
			var dispatcherMap:EventCenterDispatcherMap = _dispatcher_listeners[dispatcher];
			dispatcherMap.removeListener(type, listener);
			if(dispatcherMap.length <= 0){
				dispatcher.removeEventListener(type, notifyListener);
				delete _dispatcher_listeners[dispatcher];
			}
		}	
		
		/**
		 * broadcast:是否在所有eventcenter中广播
		 * 
		 * */
		public function dispatch(event:Event, broadcast:Boolean = false):void{
			_dispatcher.dispatchEvent(event);
			if(broadcast){
				broadcastEvent(event);
			}	
		}
		
		private function broadcastEvent(event:Event):void{
			if(hasRegister){
				var centers:Array = EventCenterManagement.instance.centers;
				for each(var center:EventCenter in centers){
					if(center.hasRegister && center != this){
						center.dispatch(event);
					}	
				}
			}	
		}	
		
		protected function notifyListener(evt:Event):void{
			var type:String = evt.type;
			var dispatcher:IEventDispatcher = evt.currentTarget as IEventDispatcher;
			if(_dispatcher_listeners[dispatcher] != undefined){
				EventCenterDispatcherMap(_dispatcher_listeners[dispatcher]).execute(type, evt);
			}
		}	
	}
}