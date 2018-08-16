package  mmo.framework.domain.exchange
{
	/**
		* 物品兑换类型
		* @author liyawei
	*/	
	
	public class ExchangeGift
	{
		private var _giftId:int;
		private var _giftNum:int;
		private var _bonusItem:Object;
		
		public function ExchangeGift(giftId:int,giftNumStr:String,bonusItemStr:String)
		{
			this._giftId = giftId;
			this._giftNum = int(giftNumStr);
			this._bonusItem = this.setBonusItem(bonusItemStr);
		}
		
		public function get giftId():int
		{
			return _giftId;
		}
		
		public function get giftNum():int
		{
			return _giftNum;
		}
		
		/**
		 * bonusItem[type,id,num]
		 * @return 
		 */		
		public function get bonusItem():Object
		{
			return _bonusItem;
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