package mmo.framework.control
{
	import flash.events.Event;
	import flash.utils.Dictionary;

	public class EventCenterListenersMap
	{
		private var _map:Dictionary;
		private var _type:String;
		
		public function EventCenterListenersMap(type:String){
			_type = type;
			_map = new Dictionary();
		}
		
		public function dispose():void{
			_map = null;
		}
		
		public function addListener(listener:*):void{
			_map[listener] = listener;
		}
		
		public function removeListener(listener:*):void{
			delete _map[listener];
		}
		
		public function getAllListeners():Dictionary{
			return _map;
		}
		
		public function execute(event:Event):void{
			for each(var listener:* in _map){
				_execute(listener, event);
			}
		}

		public function get length():int{
			var num:int = 0;
			for each(var listener:* in _map){
				num ++;
			}
			return num;
		}
		
		private function _execute(listener:*, event:Event):void{
			if(listener is Function){
				(listener as Function).apply(null, [event]);
			}
			else if(listener is ICommand){
				ICommand(listener).execute(event);
			}
			else if(listener is Class){
				(new listener)["execute"](event);
			}
			else if(listener is Observer){
				Observer(listener).invoke(event);
			}
			else if(Object(listener).hasOwnProperty("execute")){
				Object(listener)["execute"](event);
			}
			else if(Object(listener).hasOwnProperty(event.type)){
				Object(listener)[event.type](event);
			}
			else{
				throw new Error("No Support listener type: " + listener);
			}
		}

	}
}