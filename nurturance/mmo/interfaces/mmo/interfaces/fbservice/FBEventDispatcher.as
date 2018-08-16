package mmo.interfaces.fbservice
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class FBEventDispatcher extends EventDispatcher
	{
		private static var _instance:FBEventDispatcher;
		public function FBEventDispatcher()
		{
			super();
		}

		public static function get instance():FBEventDispatcher
		{
			if (_instance == null)
			{
				_instance = new FBEventDispatcher();
			}
			return _instance;
		}

	}
}