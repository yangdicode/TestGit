package mmo.framework.domain.battlepet
{
	import flash.system.ApplicationDomain;
	
	public class BattlePetSkillDefines
	{
		private static var _defineConfig:Object;
		private static var _effectConfig:Object;

		public static function getPetSkillDefine(id:int):BattlePetSkillDefine
		{
			if (_defineConfig == null)
			{
				initDefineDataConfig();
			}
			return _defineConfig[id];
		}

		public static function getPetSkillEffect(id:int):BattlePetSkillEffect
		{
			if (_effectConfig == null)
			{
				initEffectDataConfig();
			}
			return _effectConfig[id];
		}

		private static function initDefineDataConfig():void
		{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.BattlePetSkillDefineData") as Class;
			_defineConfig = cls["defineData"];
		}

		private static function initEffectDataConfig():void
		{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.BattlePetSkillDefineData") as Class;
			_effectConfig = cls["effectData"];
		}
	}
}