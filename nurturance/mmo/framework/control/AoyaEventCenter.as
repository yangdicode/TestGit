package mmo.framework.control
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.control.EventCenter;
	import mmo.framework.control.house.HouseEditEvent;
	
	public class AoyaEventCenter extends EventCenter
	{
		public function AoyaEventCenter(dispatcher:EventDispatcher)
		{
			super(dispatcher, true);
			var hee:HouseEditEvent;
		}
		
		private static var _instance:AoyaEventCenter;
		public static function get instance():AoyaEventCenter
		{
			if(_instance == null)
			{
				_instance = new AoyaEventCenter(new AoyaEventDispatcher);
			}	
			return _instance;
		}	
	}
}