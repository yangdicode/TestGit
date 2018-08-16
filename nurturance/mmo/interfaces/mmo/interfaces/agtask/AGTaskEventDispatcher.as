package mmo.interfaces.agtask
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class AGTaskEventDispatcher extends EventDispatcher
	{
		private static var _instance:AGTaskEventDispatcher;
		
		public function AGTaskEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function get instance():AGTaskEventDispatcher
		{
			if(_instance == null)
			{
				_instance = new AGTaskEventDispatcher();
			}
			return _instance;
		}
	}
}