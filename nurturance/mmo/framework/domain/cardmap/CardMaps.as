package mmo.framework.domain.cardmap
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.card.Cards;

	/**
	 * 获取卡片图鉴定义的数据
	 * @author liyawei
	 */
	
	public class CardMaps
	{
		private static var cardMapsData:Object;
		private static var cardMapArray:Array;
		
		private static var cardIdToNo:Object;
		
		public function CardMaps()
		{
		}
		
		public static function getAllCardMaps():Array
		{
			initCardMapsData();
			return cardMapArray;
		}
		
		//proId,选取某个职业某类型下可用的的cardMap
		public static function getCardMapByType(type:int,proId:int = 0):Array
		{
			initCardMapsData();
			if(type == CardMapType.allCards){
				return getProCardMap(getAllCardMaps(),proId);
			}
			
			var typeCardMap:Array = new Array();
			var length:int = cardMapArray.length
			for(var i:int = 0; i < length; i++)
			{
				var cardMap:CardMap = cardMapArray[i];
				if(cardMap.cardMapType == type){
					typeCardMap.push(cardMap);
				}
			}
			
			return getProCardMap(typeCardMap,proId);
		}
		
		
		private static function getProCardMap(cardMapArray:Array,proId:int):Array
		{
			if(proId == 0){
				return cardMapArray;
			}
			var proCardMap:Array = new Array();
			for(var i:int = 0; i < cardMapArray.length; i++)
			{
				var cardMap:CardMap = cardMapArray[i];
				if(cardMap.cardMapType == CardMapType.professionCard){
					if(-cardMap.cardId == proId){
						proCardMap.push(cardMap);
					}
				}
				else if(Cards.professionFilter(cardMap.cardId,proId))
				{
					proCardMap.push(cardMap);
				}
			}
			return proCardMap;
		}
		
		public static function getCardMap(cardMapNo:String):CardMap
		{
			initCardMapsData();
			return cardMapsData[cardMapNo];
		}
		
		public static function getCardMapById(cardId:int):CardMap
		{
			return 	getCardMap(cardIdToNo[cardId]);
		}
		
		private static function initCardMapsData():void
		{
			if(cardMapsData != null)
			{
				return;
			}
			cardMapsData = new Object();
			cardMapArray = new Array();
			cardIdToNo = new Object();
			
			var cardMapsDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CardMapData") as Class;
			
			for each (var cardMapInfo:CardMap in cardMapsDataClass["data"])
			{
				cardMapsData[cardMapInfo.cardNo] = cardMapInfo;
				cardMapArray.push(cardMapInfo);
				
				cardIdToNo[cardMapInfo.cardId] = cardMapInfo.cardNo;
			}
			
			cardMapArray.sortOn(["cardNo"]);
		}
	}
}