package mmo.interfaces.fairybattle
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class FairyBattleEventDispatcher extends EventDispatcher
	{
		private static var _instance:FairyBattleEventDispatcher;
		
		public function FairyBattleEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
		
		public static function get instance():FairyBattleEventDispatcher
		{
			if(_instance == null)
			{
				_instance = new FairyBattleEventDispatcher();
			}
			return _instance;
		}
		
		public function endGame(isWin:Boolean, fdId:int, subFdId:int):void
		{
			this.dispatchEvent(new FairyBattleEvent(FairyBattleEvent.FAIRY_BATTLE_END, {"isWin":isWin, "fdId":fdId, "subFdId":subFdId}));
		}
	}
}