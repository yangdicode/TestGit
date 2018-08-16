package mmo.framework.domain.cardmap
{
	import flash.system.ApplicationDomain;
	
	/**
	 * 获取卡片图鉴BUFF和特性数据
	 * @author liyawei
	 */
	
	public class CardMapOtherDatas
	{
		private static var cardMapBuffsData:Object;
		private static var cardMapBuffsArray:Array;
		
		private static var cardMapPropertyData:Object;
		private static var cardMapPropertyArray:Array;
		
		private static var cardMapGiftData:Array;
		
		public function CardMapOtherDatas()
		{
		}
		
		public static function getAllCardMapBuffs():Array
		{
			initCardMapsOtherData();
			return cardMapBuffsArray;
		}
		
		public static function getCardMapBuff(buffNo:int):CardMapBuff
		{
			initCardMapsOtherData();
			return cardMapBuffsData[buffNo];
		}
		
		public static function getAllCardMapPropertys():Array
		{
			initCardMapsOtherData();
			return cardMapPropertyArray;
		}
		
		public static function getCardMapProperty(propertyNo:int):CardMapProperty
		{
			initCardMapsOtherData();
			return cardMapPropertyData[propertyNo];
		}
		
		public static function getCardMapGiftDatas():Array
		{
			initCardMapsOtherData();
			return cardMapGiftData;
		}
		
		private static function initCardMapsOtherData():void
		{
			if(cardMapBuffsData != null && cardMapPropertyData != null)
			{
				return;
			}
			cardMapBuffsData = new Object();
			cardMapBuffsArray = new Array();
			cardMapPropertyData = new Object();
			cardMapPropertyArray = new Array();
			cardMapGiftData = new Array();
			
			var cardMapsDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CardMapBuffData") as Class;
			
			for each(var buff:CardMapBuff in cardMapsDataClass["buffData"])
			{
				cardMapBuffsData[buff.buffNo] = buff;
				cardMapBuffsArray.push(buff);
			}
			
			for each(var property:CardMapProperty in cardMapsDataClass["propertyData"])
			{
				cardMapPropertyData[property.no] = property;
				cardMapPropertyArray.push(property);
			}
			
			cardMapBuffsArray.sortOn(["buffNo"],Array.NUMERIC);
			cardMapPropertyArray.sortOn(["no"],Array.NUMERIC);
			
			setCardMapGiftDatas(cardMapsDataClass["cardMapGiftData"]);
		}
		
		private static function setCardMapGiftDatas(giftXml:XML):void
		{
			var giftItems:XMLList = giftXml.item;
			for each(var itemXml:XML in giftItems)
			{
				var giftId:int = itemXml.@id;
				var cardIdStr:String =XML(XMLList(itemXml.cards)[0]).@value;
				var bonusItemStr:String = XML(XMLList(itemXml.b)[0]).@items;
				
				var cardMapGift:CardMapGift = new CardMapGift(giftId,cardIdStr,bonusItemStr);
				cardMapGiftData.push(cardMapGift)
			}
			cardMapGiftData.sortOn(["giftId"],Array.NUMERIC);
		}
	}
}