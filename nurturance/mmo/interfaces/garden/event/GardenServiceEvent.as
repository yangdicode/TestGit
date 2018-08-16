package mmo.interfaces.garden.event
{
	import flash.events.Event;
	
	public class GardenServiceEvent extends Event
	{
		/**
		 * 使用种植道具或工具的事件
		 */
		public static const onGardenUseProp:String = "onGardenUseProp";
		
		/**
		 * 打开用户口袋的种子栏
		 */
		public static const onOpenSeedBag:String = "onOpenSeedBag";
		
		/**
		 * 一键收获
		 */
		public static const onGainAllFlowers:String = "onGainAllFlowers";
		
		public var params:Object;
		
		public function GardenServiceEvent(type:String, params:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
	}
}