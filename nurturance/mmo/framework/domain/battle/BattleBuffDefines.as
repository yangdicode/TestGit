package mmo.framework.domain.battle
{
	import flash.system.ApplicationDomain;

	public class BattleBuffDefines
	{
		private static var _buffDefineCls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.BattleBuffDefineData") as Class;

		public static function getBuffDefine(buffId:int):BuffDefine
		{
			var defines:Object = _buffDefineCls["data"];
			return defines[buffId];
		}
		
		public static function isBGBuff(buffId:int):Boolean{
			var list:Array = _buffDefineCls["bgBuffs"];
			return list.indexOf(buffId) >= 0;
		}

	}
}