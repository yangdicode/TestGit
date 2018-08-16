package mmo.framework.domain.npcbattle
{
	import flash.events.Event;
	
	public class NpcBattleEvent extends Event
	{
		public static const ADD_USER_NPC:String = "onAddUserNpc";		
		public static const ON_NPC_LV_UP:String = "onNpcLvUp";
		
		public static const ADD_USER_NPC_FAVOR:String = "onAddUserNpcFavor";	
		public static const ON_NPC_TASK_STATE_CHANGED:String = "onNpcTaskStateChanged";
		
		public static const NPC_LEVEL_UP_EVENT:String = "onNpcLevelUpEvent";
		
		private var _params:Object;
		public function NpcBattleEvent(type:String,params:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
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