package mmo.framework.domain.cardmap
{
	/**
	 * 晶卡图鉴兑换类型
	 * @author liyawei
	 */	
	
	public class CardMapGift
	{
		private var _giftId:int;
		private var _cardIds:Array;
		private var _bonusItem:Object;
		
		public function CardMapGift(giftId:int,cardIdStr:String,bonusItemStr:String)
		{
			this._giftId = giftId;
			this._cardIds = this.setCardIds(cardIdStr);
			this._bonusItem = this.setBonusItem(bonusItemStr);
		}

		public function get giftId():int
		{
			return _giftId;
		}

		public function get cardIds():Array
		{
			return _cardIds;
		}

		/**
		 * bonusItem[type,id,num]
		 * @return 
		 */		
		public function get bonusItem():Object
		{
			return _bonusItem;
		}
		
		private function setCardIds(cardIdStr:String):Array
		{
			return cardIdStr.split(",");
		}
		
		private function setBonusItem(bonusItemStr:String):Object
		{
			var itemObject:Object = new Object();
			var itemArray:Array = bonusItemStr.split("-");
			itemObject["type"] = itemArray[0];
			itemObject["id"] = itemArray[1];
			itemObject["num"] = itemArray[2];
			return itemObject;
		}
	}
}