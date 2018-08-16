package mmo.framework.domain.npcbattle
{
	import flash.events.EventDispatcher;
	
	public class NpcBattleEventDispatcher extends EventDispatcher
	{
		private static var _instance:NpcBattleEventDispatcher;
		public function NpcBattleEventDispatcher()
		{
		}
		
		public static function get instance():NpcBattleEventDispatcher
		{
			return _instance ||= new NpcBattleEventDispatcher();
		}
		
	}
}