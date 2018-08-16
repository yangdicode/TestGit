package mmo.framework.domain.house
{
	import flash.events.Event;
	
	public class HouseInfoEvent extends Event
	{
		public static const HOUSERESET:String = "houseReset";
		public static const ONSETHOUSENAME:String = "onSetHouseName";
		public function HouseInfoEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		private var _houseName:String;

		public function get houseName():String
		{
			return _houseName;
		}

		public function set houseName(value:String):void
		{
			_houseName = value;
		}

	}
}