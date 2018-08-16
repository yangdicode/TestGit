package mmo.nurturance.nodehandle.npc 
{
	import flash.system.ApplicationDomain;

	/**
	 *Npc对应的ID和名字
	 */
	public class NurNpcName {
		
		private static const Config:Class = ApplicationDomain.currentDomain.getDefinition("mmo.nurturance.gamemanager.config.NurNpcName") as Class;
		
		public static function checkNpcNameIsExist(name:String):Boolean
		{
			return Config["checkNpcNameIsExist"](name);
		}
		
		/**
		 * 获取Npc名字
		 * @param npcId
		 */		
		public static function getNpcName(npcId:int):String {
			return Config["getNpcName"](npcId);
		}
		
		/**
		 * 获取Npc信息
		 * @param npcId
		 */		
		public static function getNpcIntro(npcId:int):String {
			return Config["getNpcIntro"](npcId);
		}
		
		public static function needTalkSignNpc(npcId:int):Boolean{
			return Config["needTalkSignNpc"](npcId); 
		}
		
		public static function checkIsCustomNpc(id:int):int
		{
			return Config["checkIsCustomNpc"](id); 
		}
	}
}


