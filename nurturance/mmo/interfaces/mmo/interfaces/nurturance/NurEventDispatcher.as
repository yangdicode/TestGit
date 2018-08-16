package mmo.interfaces.nurturance
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class NurEventDispatcher extends EventDispatcher
	{
		private static var _instance:NurEventDispatcher;
		public function NurEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function get instance():NurEventDispatcher
		{
			if(_instance == null)
				_instance = new NurEventDispatcher();
			return _instance;
		}
		
	}
}