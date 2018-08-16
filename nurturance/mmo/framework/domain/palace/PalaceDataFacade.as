package mmo.framework.domain.palace
{
	import flash.system.ApplicationDomain;

	public class PalaceDataFacade
	{
		private static var PalaceConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.PalaceData") as Class;
		
		public function PalaceDataFacade()
		{
		}
		
		public static function get LevelConfig():Array
		{
			return PalaceConfig["Levels"];
		}
		
		public static function get CrownConfig():Object
		{
			return PalaceConfig["Crowns"];
		}
		
		public static function get lastCrownId():int
		{
			var len:int = 0;
			for each(var info:PalaceCrown in CrownConfig)
			{
				len++;
			}
			return len;
		}
		
		public static function get CrownLevelConfig():Object
		{
			return PalaceConfig["CrownLevels"];
		}
		
		public static function getPalaceLevel(level:int):PalaceLevel
		{
			return LevelConfig[level-1];
		}
		
		public static function get maxPalaceLevel():int
		{
			return LevelConfig.length;
		}
		
		public static function getPalaceCrown(id:int):PalaceCrown
		{
			return CrownConfig[id];
		}
		
		public static function getPalaceCrownLevel(id:int, level:int):PalaceCrownLevel
		{
			var str:String = id.toString() + "_" + level.toString();
			return CrownLevelConfig[str];
		}
		
		public static function getMaxPalaceCrownLevel(id:int):int
		{
			var level:int = 1;
			for (; true; ++level)
			{
				if (getPalaceCrownLevel(id, level) == null)
				{
					break;
				}
			}
			return level-1;
		}
	}
}