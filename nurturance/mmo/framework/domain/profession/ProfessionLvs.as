package mmo.framework.domain.profession
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.card.CardType;
	import mmo.framework.domain.card.Cards;
	import mmo.framework.domain.npcbattle.NpcBattles;

	public class ProfessionLvs
	{
		private static var data:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ProfessionLvData")["data"];
		
		private static var proMaxLv:Object;
		
		public function ProfessionLvs()
		{
		}
		
		public static function getProfessionLv(proId:int,level:int):ProfessionLv
		{
			var key:String = proId.toString() + "_" + level.toString();
			return data[key];
		}
		
		/**
		 * 获取职业的最大等级数，不同职业不同
		 */		
		public static function getProMaxLv(proId:int, isNpc:Boolean = false):int
		{
			if(isNpc){
				return NpcBattles.getMaxLv(proId);
			}
			initProMaxLv();
			return proMaxLv[proId];
		}
		
		/**
		 * 获取下一级需要的奥雅之光
		 */		
		public static function getNextProNeedSGold(proId:int,level:int, isNpc:Boolean = false):int
		{
			if(isNpc){
				return NpcBattles.getLvUpNeedSG(proId, level);
			}
			if(level == getProMaxLv(proId)){
				return 0;
			}
			return getProfessionLv(proId,level+1).needLightGold;
		}
		
		/**
		 * 获取下一级的需要的升级物品
		 */		
		public static function getNextProNeedItems(proId:int,level:int, isNpc:Boolean = false):Array
		{
			if(isNpc){
				return [];
			}
			if(level == getProMaxLv(proId)){
				return new Array();
			}
			return getProfessionLv(proId,level+1).needItems;
		}
		
		/**
		 * 获得某张卡片需要的职业等级，没有这张卡的返回-1
		 */		
		public static function getCardNeedProLevel(proId:int,cardId:int):int
		{
			for(var level:int = 1; level <= getProMaxLv(proId); level++)
			{
				var proLv:ProfessionLv = getProfessionLv(proId,level);
				if(proLv.defaultCard.indexOf(cardId.toString()) >= 0){
					return level;
				}
			}
			return -1;
		}
		
		/**
		 * 当前等级可以获得的新卡
		 */		
		public static function getNewProLvCards(proId:int, curLv:int, proLv:int):Array
		{
			var nowProLv:ProfessionLv = getProfessionLv(proId,proLv);
			if(proLv == 1){
				return nowProLv.defaultCard;
			}
			var preProLv:ProfessionLv = getProfessionLv(proId, curLv);
			var newLvsCard:Array = new Array();
			for each(var cardId:int in nowProLv.defaultCard){
				if(preProLv.defaultCard.indexOf(cardId.toString()) < 0)
				{
					newLvsCard.push(cardId);
				}
			}
			return newLvsCard;
		}
		
		/**
		 * 获取当前职业级别默认技能卡种类，并排序返回(技能卡优先)
		 */		
		public static function getProLvCards(proId:int,level:int):Array
		{
			var proLv:ProfessionLv = getProfessionLv(proId,level);
			if(proLv == null){
				return null;
			}
			var defaultCards:Array = proLv.defaultCard;
			var speCards:Array = new Array();
			for(var i:int = 0; i < defaultCards.length; i++){
				var cardId:int = int(defaultCards[i]);
				if(speCards.indexOf(cardId) < 0){
					speCards.push(cardId);
				}
			}
			return speCards;
		}
		
		/**
		 * 初始化职业最大等级数 
		 */		
		private static function initProMaxLv():void
		{
			if(proMaxLv != null){
				return;
			}
			proMaxLv = new Object();
			
			for each(var proLv:ProfessionLv in data)
			{
				if(proMaxLv[proLv.professionId] == null){
					proMaxLv[proLv.professionId] = 1;
				}
				else{
					proMaxLv[proLv.professionId] ++;
				}
			}
		}
		
		/**
		 * 卡片排序，(技能卡优先,魔法卡其次)
		 */		
		private static function sortCardByType(cardId1:int,cardId2:int):int
		{
			var card1IsSkillCard:Boolean = CardType.isSkillCard(cardId1);
			var card2IsSkillCard:Boolean = CardType.isSkillCard(cardId2);
			
			var card1IsMagicCard:Boolean = CardType.isMagicalCard(cardId1);
			var card2IsMagicCard:Boolean = CardType.isMagicalCard(cardId2);
			
			if(card1IsSkillCard == card2IsSkillCard){
				return getSortInt(card1IsMagicCard,card2IsMagicCard);
			}
			
			return getSortInt(card1IsSkillCard,card2IsSkillCard);
		}
		
		private static function getSortInt(isTypeCard1:Boolean,isTypeCard2:Boolean):int
		{
			if(isTypeCard1 == isTypeCard2){
				return 0;
			}
			if(isTypeCard1){
				return -1;
			}
			if(isTypeCard2){
				return 1;
			}
			return 0;
		}
	}
}