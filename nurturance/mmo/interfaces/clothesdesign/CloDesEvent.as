package mmo.interfaces.clothesdesign
{
	import flash.events.Event;
	
	public class CloDesEvent extends Event
	{
		
		public static const FINISH_TASK:String = "finishTask";
		
		public static const LEVEL_UP:String = "levelUp";
		
		public var params:Object;
		
		public function CloDesEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}