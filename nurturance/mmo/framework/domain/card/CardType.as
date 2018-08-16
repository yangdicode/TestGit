package mmo.framework.domain.card
{
	public class CardType
	{
		public static const SKILL_CARD:CardType = new CardType("主卡");
		public static const ASSIST_CARD:CardType = new CardType("辅助");
		public static const EQUIP_CARD:CardType = new CardType("装备");
		
		public static const ERROR_CARD:CardType = new CardType("不存在的卡片类型");

		private var _desc:String;

		public function CardType(desc:String)
		{
			_desc = desc;
		}

		public function get desc():String
		{
			return _desc;
		}

		public static function getCardTypeByDesc(desc:String):CardType
		{
			if (desc == "主卡")
			{
				return SKILL_CARD;
			}
			else if (desc == "辅助")
			{
				return ASSIST_CARD;
			}
			else if (desc == "装备")
			{
				return EQUIP_CARD;
			}
			return ERROR_CARD;
		}




		//废弃接口
		/**
		 * 是否物理武器卡
		 */
		public static function isPhysicCard(id:int):Boolean
		{
			return (Cards.getOldCardDefine(id).slot == "武器");
		}

		/**
		 * 是否魔法武器卡
		 */
		public static function isMagicalCard(id:int):Boolean
		{
			return (Cards.getOldCardDefine(id).slot == "魔法");
		}

		/**
		 * 是否武器卡
		 */
		public static function isWeaponCard(id:int):Boolean
		{
			return !isSkillCard(id);
		}

		/**
		 * 是否技能卡
		 */
		public static function isSkillCard(id:int):Boolean
		{
			return (Cards.getOldCardDefine(id).slot == "技能");
		}

		/**
		 * 是否搭配卡
		 */
		public static function isCombineCard(id:int):Boolean
		{
			return (Cards.getOldCardDefine(id).subFunc == "搭配");
		}
	}
}