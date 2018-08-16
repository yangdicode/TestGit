package mmo.framework.domain.plant
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.material.plantitem.PlantItem;

	public class Plants
	{
		private static var PlantConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.PlantsData") as Class;
		private static var PlantItemConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.PlantItemsData") as Class;
		private static var CrystalCardConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CrystalCardsData") as Class;
		
		public function Plants()
		{
		}
		
		public static function get plantItems():Object
		{
			return PlantItemConfig["data"];
		}
		
		public static function getPlantItemById(id:int):PlantItem
		{
			return plantItems[id];
		}
		
		public static function getSeedDefine(id:int):Seed
		{
			return PlantConfig["data"][id] as Seed;
		}
		
		public static function getFlowerpotDefine(potNum:int):Flowerpot
		{
			return PlantConfig["flowerpot"][potNum] as Flowerpot;
		}
		
		public static function getFarmLevelDefine(level:int):FarmLevel
		{
			var index:int = level - 1;
			return PlantConfig["farmlevel"][index] as FarmLevel;
		}
		public static function getFarmStarLevelDefine(level:int):FarmStarLevel
		{
			var index:int = level - 1;
			return PlantConfig["farmstarlevel"][index];
		}
		
		public static function getFarmLevelFromExp(exp:int):FarmLevel {
			var values:Array = PlantConfig["farmlevel"];
			for (var i:int=values.length-1; i>=0; i--) 
			{
				var levelInfo:FarmLevel = values[i];
				if (exp >= levelInfo.needExp) 
				{
					return levelInfo;
				}
			}
			return null;
		}
		
		public static function getFarmStarLevelFromExp(exp:int):FarmStarLevel {
			var values:Array = PlantConfig["farmstarlevel"];
			for (var i:int=values.length-1; i>=0; i--) 
			{
				var levelInfo:FarmStarLevel = values[i];
				if (exp >= levelInfo.needExp) 
				{
					return levelInfo;
				}
			}
			return null;
		}
		
		public static function getMaxFarmLevel():int
		{
			var values:Array = PlantConfig["farmlevel"];
			return values.length;
		}
		public static function getMaxFarmStarLevel():int
		{
			var values:Array = PlantConfig["farmstarlevel"];
			return values.length;
		}
		
		public static function getCrystalCardById(id:int):CrystalCard
		{
			return crystalCards[id] as CrystalCard; 
		}
		
		public static function get crystalCards():Object
		{
			return CrystalCardConfig["data"];
		}
	}
}