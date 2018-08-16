package mmo.framework.domain.palace
{
	import flash.events.EventDispatcher;
	
	public class PalaceEventDispatcher extends EventDispatcher
	{
		private static var _instance:PalaceEventDispatcher;
		
		public function PalaceEventDispatcher()
		{
			super();
		}
		
		public static function get instance():PalaceEventDispatcher
		{
			if (_instance == null)
			{
				_instance = new PalaceEventDispatcher();
			}
			return _instance;
		}
	}
}