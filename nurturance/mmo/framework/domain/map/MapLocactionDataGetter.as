package mmo.framework.domain.map
{
	import flash.system.ApplicationDomain;
	
	public class MapLocactionDataGetter
	{
		public function MapLocactionDataGetter()
		{
		}
		
		/**
		 * 获取sceneName中的一级场景名
		 */		
		public static function getSceneTipsData(sceneName:String):String
		{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.MapLocactionData") as Class;
			return cls["mapLocactionData"][sceneName];
		}
		
		/***
		 * 获取townName中的二级场景
		 * */
		public static function getTownSceneData():Object
		{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.MapLocactionData") as Class;
			return  cls["mapTownToSceneData"];			
		}
		
	}
}