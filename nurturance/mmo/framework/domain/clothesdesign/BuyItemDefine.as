package mmo.framework.domain.clothesdesign
{
	
	public class BuyItemDefine extends ExchangeItemDefine
	{
		private var _goodsId:int;
		
		private var _discount:Number;
		
		public function BuyItemDefine(id:int, des:String, demandsStr:String, bonusStr:String, needLevel:int, goodsId:int, discount:Number)
		{
			super(id, des, demandsStr, bonusStr, needLevel);
			_goodsId = goodsId;
			_discount = discount;
		}
		
		public function get goodsId():int{
			return _goodsId;
		}
		
		public function get discount():Number{
			return _discount;
		}
		
	}
}