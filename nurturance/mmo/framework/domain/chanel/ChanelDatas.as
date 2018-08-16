package mmo.framework.domain.chanel
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.MainModelLocator;

	public class ChanelDatas
	{
		private static var doc:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ChanelsData") as Class;
		
		private static const MaxLevel:int = 4;
		
		public static function getChanelLevel(level:int):ChanelLevel{
			var config:Object = doc["levelData"];
			if(!config.hasOwnProperty(level)){
				return ChanelLevel.EmptyLevel;
			}
			return config[level];
		}
		
		public static function getMyChanelLevel():ChanelLevel{
			var info:UserChanelInfo = MainModelLocator.instance.retrieveModel(UserChanelInfo);
			return getChanelLevel(info.level);
		}
		
		public static function getPerfume(itemId:int):Perfume{
			var config:Object = doc["perfumeData"];
			for each(var p:Perfume in config){
				if(p.gitemId == itemId){
					return p;
				}
			}
			return null;
		}
		
		public static function getAllPerfume():Array{
			var config:Object = doc["perfumeData"];
			var arr:Array = [];
			for each(var perfume:Perfume in config){
				arr.push(perfume);
			}
			arr.sortOn("id", Array.NUMERIC | Array.DESCENDING);
			return arr;
		}
		
		public static function getPerfumeById(perfumeId:int):Perfume{
			var config:Object = doc["perfumeData"];
			return config[perfumeId];
		}
		
		public static function isMaxlevel(level:int):Boolean{
			return level >= MaxLevel;
		}
		
		private function compile():void{
			ChanelLevel;
			Perfume;
			UserChanelInfo;
			ChanelMarketPages;
		}
		
	}
}