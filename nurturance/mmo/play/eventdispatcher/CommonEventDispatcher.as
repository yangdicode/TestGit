package mmo.play.eventdispatcher
{
	import flash.events.EventDispatcher;
	
	public class CommonEventDispatcher extends EventDispatcher
	{
		private static var _instance:CommonEventDispatcher;
		
		public static function get instance():CommonEventDispatcher
		{
			if(_instance == null)
			{
				_instance = new CommonEventDispatcher();
			}
			
			return _instance;
		}
		
		public function CommonEventDispatcher()
		{
		}

	}
}