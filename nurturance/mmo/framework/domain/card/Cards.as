package mmo.framework.domain.card
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.profession.Professions;

	public class Cards
	{
		private static var cardsData:Object;
		private static var cardOldData:Object;

		public function Cards()
		{
		}
		
		/** 获取新卡 **/
		public static function getCard(id:int):Card
		{
			if (cardsData == null)
			{
				initCardsData();
			}

			return cardsData[id];
		}
		
		/** 获取旧卡 **/
		public static function getOldCardDefine(id:int):CardOldDefine
		{
			if( cardOldData == null )
			{
				initOldCardsData();
			}
			return cardOldData[id];
		}
		
		/**
		 * 检测该卡片是否可以被当前职业使用
		 */		
		public static function professionFilter(cardId:int,proId:int):Boolean
		{
			var cardInfo:Card = Cards.getCard(cardId);
			
			//var limit:CardEquipLimit = CardEquipLimits.getCardEquipLimit(cardId);
			return proFilter(cardInfo.proLimit, proId);
		}
		
		/**
		 * 检测该卡片是否是vip专属卡
		 * */
		public static function isVipCard(cardId:int):Boolean
		{
			var cardLimit:CardEquipLimit = CardEquipLimits.getCardEquipLimit(cardId);
			return cardLimit.isVip;
		}
		
		private static function initCardsData():void
		{
			cardsData = new Object();
			var cardsDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CardsData") as Class;

			for each (var cardInfo:Card in cardsDataClass["data"])
			{
				cardsData[cardInfo.id] = cardInfo;
			}
		}
		
		private static function initOldCardsData():void
		{
			cardOldData = {};
			var cardsDataClass:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.CardsDataOld") as Class;
			
			for each (var cardInfo:CardOldDefine in cardsDataClass["data"])
			{
				cardOldData[cardInfo.id] = cardInfo;
			}
		}
		
		private static function proFilter(pLimit:Array, pId:int):Boolean
		{
			if (pLimit.length == 0)
			{
				return true;
			}
			return (pLimit.indexOf(pId.toString()) > -1);
		}
	}
}