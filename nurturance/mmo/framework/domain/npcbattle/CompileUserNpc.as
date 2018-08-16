package mmo.framework.domain.npcbattle
{

	public class CompileUserNpc
	{
		public function CompileUserNpc()
		{
		}
		
		public static function compileMe():void
		{
			var npc:NpcBattleDefine;
			var npcLv:NpcBattleLvDefine;
			var npcs:NpcBattles;
			var userNpc:UserNpc;
			var npcBattleClient:NpcBattleClient;
			var npcBattleEvent:NpcBattleEvent;
			var npcBattleEventDispatcher:NpcBattleEventDispatcher;
			var npcFavorDefine:NpcFavorDefine;
			var npcFavorDefines:NpcFavorDefines;
			var npcFavorItemDefine:NpcFavorItemDefine;
			var npcFavorItemDefines:NpcFavorItemDefines;
			var favorBuff:NpcBuffDefine;
		}
	}
}