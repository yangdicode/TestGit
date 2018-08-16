package mmo.framework.domain.map
{
	import flash.system.ApplicationDomain;

	public class MapTipsDataGetter
	{
		public function MapTipsDataGetter()
		{
		}
		
		/**
		 * 获取mapName中场景名为sceneName的Tips内容 
		 */		
		public static function getSceneTipsData(sceneName:String):MapSceneTips
		{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.MapTipsData") as Class;
			return cls["sceneTipsData"][sceneName];
		}
		
		/**
		 * 获取mapName中场景名为sceneName的父亲名称 
		 */	
		public static function getSceneFatherName(sceneName:String):String
		{
			var mapSceneTips:MapSceneTips = getSceneTipsData(sceneName);
			if( mapSceneTips )
				return mapSceneTips.fartherName;
			
			return "";
		}
		
	}
}