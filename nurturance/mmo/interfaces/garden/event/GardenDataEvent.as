package mmo.interfaces.garden.event
{
	import flash.events.Event;
	
	public class GardenDataEvent extends Event
	{
		public static const onDataInited:String = "onDataInited";
		public static const onRefreshAllCrop:String = "onRefreshAllCrop";
		public static const onFarmUpdate:String = "onFarmUpdate";
		public static const onFarmStarUpdate:String = "onFarmStarUpdate";
		public static const onSaveGardenBackground:String = "onSaveGardenBackground";
		
		public var params:Object;
		
		public function GardenDataEvent(type:String, params:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
	}
}