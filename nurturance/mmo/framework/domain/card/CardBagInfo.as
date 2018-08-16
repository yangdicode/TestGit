package mmo.framework.domain.card
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;

	public class CardBagInfo extends EventDispatcher
	{
		private var _physicWeaponCards:Array;
		private var _magicalWeaponCards:Array;
		private var _skillCards:Array;
		private var _almightCards:Array;
		public function CardBagInfo()
		{
		}
		
		public function setCardBag(equipCards:String):void
		{
			clearCards();
			if (equipCards == null || equipCards.length == 0)
			{
				return;
			}
			var cards:Array = equipCards.split(";");
			for each(var slot:String in cards)
			{
				var slotInfos:Array = slot.split(":");
				var slotType:String = slotInfos[0];
				var slotArr:Array = String(slotInfos[1]).split(",");
				slotArr.sort(Array.NUMERIC);
				setArray(slotType, slotArr);
			}
		}
		
		public function clearCards():void
		{
			_physicWeaponCards = new Array();
			_magicalWeaponCards = new Array();
			_skillCards = new Array();
			_almightCards = new Array();
		}
		
		/**
		 * 获取武器卡槽中的卡片 
		 */		
		public function get physicWeaponCards():Array
		{
			return _physicWeaponCards;
		}

		/**
		 * 获取魔法卡槽中的卡片 
		 */		
		public function get magicalWeaponCards():Array
		{
			return _magicalWeaponCards;
		}

		/**
		 * 获取技能卡槽中的卡片 
		 */		
		public function get skillCards():Array
		{
			return _skillCards;
		}

		/**
		 * 获取全能卡槽中的卡片 
		 */		
		public function get almightCards():Array
		{
			return _almightCards;
		}
		
		/**
		 * 获取所有装备中的卡 
		 */		
		public function get allEquipedCard():Array
		{
			return _physicWeaponCards.concat(_magicalWeaponCards).concat(_skillCards).concat(_almightCards);
		}
		
		private function setArray(type:String, cards:Array):void
		{
			if (type == "w")
			{
				_physicWeaponCards = cards;
			}
			else if (type == "sp")
			{
				_magicalWeaponCards = cards;
			}
			else if (type == "sk")
			{
				_skillCards = cards;
			}
			else
			{
				_almightCards = cards;
			}
		}
	}
}