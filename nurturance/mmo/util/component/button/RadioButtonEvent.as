package mmo.util.component.button
{
	import flash.events.Event;
	
	public class RadioButtonEvent extends Event
	{
		public static const ON_SELECT_BUTTON:String = "onSelectButton";
		
		public var params:Object;
		
		public function RadioButtonEvent(type:String, params:Object = null, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
		
		override public function clone():Event{
			return new RadioButtonEvent(type, params);
		}
		
	}
}