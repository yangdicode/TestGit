package mmo.framework.domain.player
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.halos.Halo;
	import mmo.framework.domain.player.PlayerLightData;

	public class PlayerLights{
		private static const DATA_CLASS:String = "mmo.materialdata.PlayerLightsData";
		private static var _lightData:Object;
		private static var _clothesLightData:Object;
		
		public function PlayerLights()
		{
		}
		
		public static function getLightById(id:int):PlayerLightData{
			initLightData();
			return _lightData[id];
		}
		
		public static function getClothesLightDataById(id:int):ClothesLightData{
			initCloghesLightData();
			return _clothesLightData[id];
		}
		
		public static function getAllClothesData():Object{
			initCloghesLightData();
			var copy:Object = {};
			for(var key:String in _clothesLightData){
				copy[key] = _clothesLightData[key];
			}
			return copy;
		}
		
		public static function getHaloById(id:int):Halo{
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.HalosData") as Class;
			var config:Object = cls["haloConfig"];
			return config[id];
		}
		
		private static function initLightData():void{
			if(_lightData != null){
				return;
			}
			var cls:Class = ApplicationDomain.currentDomain.getDefinition(DATA_CLASS) as Class;
			_lightData = cls["data"];
		}
		
		private static function initCloghesLightData():void{
			if(_clothesLightData!= null){
				return;
			}
			var cls:Class = ApplicationDomain.currentDomain.getDefinition(DATA_CLASS) as Class;
			_clothesLightData = cls["clothesLight"];
		}
		
	}
}