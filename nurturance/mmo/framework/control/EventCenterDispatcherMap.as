package mmo.framework.control
{
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.utils.Dictionary;

	public class EventCenterDispatcherMap
	{
		private var _dispatcher:IEventDispatcher;
		private var _typeMap:Dictionary;
		
		public function EventCenterDispatcherMap(target:IEventDispatcher){
			_dispatcher = target;
			_typeMap = new Dictionary();
		}
		
		public function get dispatcher():IEventDispatcher{
			return _dispatcher;
		}
		
		public function dispose():void{
			for each(var typeMap:EventCenterListenersMap in _typeMap){
				typeMap.dispose();
			}
			_typeMap = null;
			_dispatcher = null;
		}
		
		public function execute(type:String, event:Event):void{
			if(_typeMap.hasOwnProperty(type)){
				EventCenterListenersMap(_typeMap[type]).execute(event);
			}
		}
		
		public function addListener(type:String, listener:*):void{
			if(!_typeMap.hasOwnProperty(type)){
				_typeMap[type] = new EventCenterListenersMap(type);
			}
			EventCenterListenersMap(_typeMap[type]).addListener(listener);
		}
		
		public function removeListener(type:String, listener:*):void{
			if(!_typeMap.hasOwnProperty(type)){
				return;
			}
			EventCenterListenersMap(_typeMap[type]).removeListener(listener);
			if(EventCenterListenersMap(_typeMap[type]).length <= 0){
				delete _typeMap[type];
			}
		}
		
		public function get typeList():Array{
			var list:Array = [];
			for(var type:String in _typeMap){
				list.push(type);
			}
			return list;
		}
		
		public function get length():int{
			return typeList.length;
		}
		
	}
}