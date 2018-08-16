package mmo.framework.domain.skill.stuff
{
	import flash.system.ApplicationDomain;
	
	/**
	 * 获取材料途径定义的数据
	 * @author liyawei
	 */
	
	public class StuffMaps
	{
		private static var stuffMapsData:Object;
		private static var stuffMapArray:Array;
		
		public function stuffMaps()
		{
		}
		
		public static function getAllstuffMaps():Array
		{
			initstuffMapsData();
			return stuffMapArray;
		}
		
		public static function getstuffMapByName(stuffName:String):Array
		{
			initstuffMapsData();
			if(stuffName == ""){
				return getAllstuffMaps();
			}
			
			var typestuffMap:Array = new Array();
			var length:int = stuffMapArray.length
			for(var i:int = 0; i < length; i++)
			{
				var stuffMap:StuffMap = stuffMapArray[i];
				if(stuffMap.stuffName.indexOf(stuffName) >= 0){
					typestuffMap.push(stuffMap);
				}
			}
			
			return typestuffMap;
		}
		
		public static function getstuffMapByRaceAndLevel(raceLimit:String,levelLimit:String):Array
		{
			initstuffMapsData();
			
			var typestuffMap:Array = new Array();
			var length:int = stuffMapArray.length
			for(var i:int = 0; i < length; i++)
			{
				var stuffMap:StuffMap = stuffMapArray[i];
				if(raceLimit == StuffMapType.alltype || raceLimit == stuffMap.stuffRace)
				{
					if(checkLevelLimit(levelLimit,stuffMap))
					{
						typestuffMap.push(stuffMap);
					}
				}
			}
			return typestuffMap;
		}
		
		private static function checkLevelLimit(levelLimit:String,stuffMap:StuffMap):Boolean
		{
			if(levelLimit == StuffMapType.alltype)
			{
				return true;
			}
			var levels:Array = levelLimit.split("-");
			return stuffMap.stuffLevel >= int(levels[0]) && stuffMap.stuffLevel <= int(levels[1]);
		}
		
		private static function initstuffMapsData():void
		{
			if(stuffMapsData != null)
			{
				return;
			}
			stuffMapsData = new Object();
			stuffMapArray = new Array();
			
			var stuffMapsDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.StuffMapData") as Class;
			
			for each (var stuffMapInfo:StuffMap in stuffMapsDataClass["data"])
			{
				stuffMapsData[stuffMapInfo.stuffMapId] = stuffMapInfo;
				stuffMapArray.push(stuffMapInfo);
			}
			
			stuffMapArray.sortOn(["stuffMapId"]);
		}
	}
}