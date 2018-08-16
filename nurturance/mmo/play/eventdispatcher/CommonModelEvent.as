package mmo.play.eventdispatcher
{
	import flash.events.Event;
	
	/**
	 * 活动通用event
	 */
	public class CommonModelEvent extends Event
	{
		public static const ON_INIT:String = "on_init";
		
		public static const UPDATE:String = "update";
		
		public function CommonModelEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}