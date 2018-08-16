package mmo.framework.domain.fairy
{
	import flash.system.ApplicationDomain;

	public class FairyMonsters
	{
		private static var config:Object;
		
		public function FairyMonsters()
		{
			
		}
		
		private static function initConfig():void
		{
			if (config != null)
			{
				return;
			}
			var dataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.fairy.FairyMonsterData") as Class;
			config = dataClass["data"];
		}
		
		public static function getFairyMonster(id:int):FairyMonster
		{
			initConfig();
			return config[id];
		}
	}
}