package mmo.interfaces.garden.event
{
	import flash.events.Event;

	public class GardenInteractEvent extends Event
	{
		public static const onDataInited:String = "onDataInited";
		public static const onAllInteractInited:String = "onAllInteractInited";
		
		public var params:Object;
		
		public function GardenInteractEvent(type:String, params:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
	}
}