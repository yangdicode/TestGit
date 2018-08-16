package mmo.interfaces.fairybattle
{
	import flash.events.Event;
	
	public class FairyBattleEvent extends Event
	{
		/**
		 * 
		 * params格式{"isWin":战斗赢输, "fbId":大副本名, "subFbId":小副本名, "allied":盟友名字（没有或NPC为""）};
		 * 
		 */		
		public static const FAIRY_BATTLE_END:String = "FairyBattleEvent_0";
		
		private var _params:Object;
		
		public function FairyBattleEvent(type:String, params:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_params = params;
			super(type, bubbles, cancelable);
		}
		
		public function get params():Object
		{
			return _params;
		}
	}
}