package mmo.framework.domain.card
{
	public class CardEquipLimit
	{
		private var _cardId:int;
		private var _lv:int;
		private var _pLimit:Array;
		private var _strength:int;
		private var _intelligence:int;
		private var _agility:int;
		private var _moral:int;
		private var _stamina:int;
		private var _isVip:int;
		
		public function CardEquipLimit(cardId:int,
										 lv:int,
										 pLimit:String,
										 strength:int,
										 intelligence:int,
										 agility:int,
										 moral:int,
										 stamina:int,
										 isVip:int)
		{
			_cardId = cardId;
			_lv = lv;
			
			if (pLimit == "")
			{
				_pLimit = new Array();
			}
			else
			{
				_pLimit = pLimit.split(",");
			}
			
			_strength = strength;
			_intelligence = intelligence;
			_agility = agility;
			_moral = moral;
			_stamina = stamina;
			_isVip = isVip;
		}
		/**
		 * 卡片Id
		 */
		public function get cardId():int
		{
			return _cardId;
		}
		
		/**
		 * 由于某些历史原因，这个其实是职业等级，谢谢！
		 */
		public function get lv():int
		{
			return _lv;
		}
		
		/**
		 * 职业限制
		 */
		public function get pLimit():Array
		{
			return _pLimit;
		}
		
		/**
		 * 力量限制
		 */
		public function get strength():int
		{
			return _strength;
		}
		
		/**
		 * 智力限制
		 */
		public function get intelligence():int
		{
			return _intelligence;
		}
		
		/**
		 * 灵敏限制
		 */
		public function get agility():int
		{
			return _agility;
		}
		
		/**
		 * 道德限制
		 */
		public function get moral():int
		{
			return _moral;
		}
		
		/**
		 * 体力限制
		 */
		public function get stamina():int
		{
			return _stamina;
		}
		
		/**
		 * vip限制
		 * */
		public function get isVip():Boolean
		{
			return Boolean(_isVip);
		}
	}
}