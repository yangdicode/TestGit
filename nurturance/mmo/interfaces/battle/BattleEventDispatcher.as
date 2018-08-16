package mmo.interfaces.battle
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.text.StaticText;
	
	public class BattleEventDispatcher extends EventDispatcher
	{
		private static var _instance:BattleEventDispatcher;
		
		public function BattleEventDispatcher()
		{
			super();
		}
		
		public static function get instance():BattleEventDispatcher
		{
			if (_instance == null)
			{
				_instance = new BattleEventDispatcher();
			}
			return _instance;
		}
	}
}