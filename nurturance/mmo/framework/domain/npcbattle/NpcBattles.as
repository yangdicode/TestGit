package mmo.framework.domain.npcbattle
{
	import flash.system.ApplicationDomain;

	public class NpcBattles
	{		
		private static const UserNpcConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.npcbattle.config.NpcBattleData") as Class;
		private static const UserNpcLvConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.npcbattle.config.NpcBattleLvData") as Class;
		
		private static var maxLvData:Object;
		private static var monster2NpcMap:Object;
		
		public static function getNpcDefineById(id:int):NpcBattleDefine
		{
			var data:Object = UserNpcConfig["npcDefines"];
			if (!data.hasOwnProperty(id))
			{
				throw new Error("没有此npc：" + id);
			}
			return data[id];
		}
		
		public static function getAllNpcIds():Array{
			var data:Object = UserNpcConfig["npcDefines"];
			var npcIds:Array = [];
			for(var npcId:String in data){
				npcIds.push(int(npcId));
			}
			return npcIds;
		}
		
		public static function getHotNpcIds():Array{
			var data:Array = UserNpcConfig["HotNpcIds"];
			return data;
		}
		
		public static function getNpcByMonsterId(monsterId:int, monsterLv:int):NpcBattleDefine{
			initMonster2Npc();
			return monster2NpcMap[monsterId + "_" + monsterLv];
		}
		
		private static function initMonster2Npc():void{
			if(monster2NpcMap != null){
				return;
			}
			monster2NpcMap = {};
			var data:Object = UserNpcConfig["npcDefines"];
			for each(var npcDef:NpcBattleDefine in data){
				monster2NpcMap[npcDef.monsterId + "_" + npcDef.magAttLv] = npcDef;
			}
		}
		
		public static function getNpcLvDefine(id:int, lv:int):NpcBattleLvDefine{
			var data:Object = UserNpcLvConfig["lvDefines"];
			var key:String = id + "_" + lv;
			if (!data.hasOwnProperty(key))
			{
				throw new Error("没有此npc：" + id + "_" + lv);
			}
			return data[key];
		}
		
		public static function getLvUpNeedSG(id:int, lv:int):int{
			if(lv == getMaxLv(id)){
				return 0;
			}
			return getNpcLvDefine(id, lv).needLightGold;
		}
		
		public static function getMaxLv(id:int):int{
			initMaxLv();
			return maxLvData[id];
		}
		
		private static function initMaxLv():void{
			if(maxLvData != null){
				return;
			}
			maxLvData = {};
			var lvData:Object = UserNpcLvConfig["lvDefines"];
			for each(var lvDef:NpcBattleLvDefine in lvData){
				if(maxLvData.hasOwnProperty(lvDef.professionId)){
					maxLvData[lvDef.professionId] = Math.max(maxLvData[lvDef.professionId], lvDef.level);
				}else{
					maxLvData[lvDef.professionId] = lvDef.level;
				}
			}
		}
		
	}
}