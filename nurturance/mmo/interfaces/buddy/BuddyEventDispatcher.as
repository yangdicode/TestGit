package mmo.interfaces.buddy
{
	import flash.events.EventDispatcher;

	public class BuddyEventDispatcher extends EventDispatcher
	{
		private static var _instance:BuddyEventDispatcher;
		
		public static function get instance():BuddyEventDispatcher
		{
			if(_instance == null){
				_instance = new BuddyEventDispatcher();
			}
			return _instance;
		}
		
		public function BuddyEventDispatcher()
		{
		}
	}
}