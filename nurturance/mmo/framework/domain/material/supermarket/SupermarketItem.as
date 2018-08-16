package mmo.framework.domain.material.supermarket
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;
	
	public class SupermarketItem extends Material
	{
		private var _type:int;
		private var _goodsId:int;
		private var _extData:Object;
		
		public function SupermarketItem(id:int, goodsId:int, type:int, name:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, description:String, canTrade:int, isOutOfPrint:*, extData:Object=null)
		{
			super(id, MaterialTypes.SUPERMARKET, name, maxOwnNum, value, sellPrice, isBind, isVip, description, canTrade, isOutOfPrint);
			
			this._type = type;
			this._goodsId = goodsId;
			this._extData = extData;
		}
		
		/**
		 * 只读属性，超市物品类型（SupermarketTypes）
		 */
		public function get itemType():int
		{
			return this._type;
		}
		
		/**
		 * 只读属性，商品表的商品id（GoodsData）
		 */
		public function get goodsId():int
		{
			return this._goodsId;
		}
		
		/**
		 * 只读属性，额外数据，保留字段
		 */
		public function get extData():Object
		{
			return this._extData;
		}
		
		override public function accept(materialVisitor:MaterialVisitor):*
		{
			return materialVisitor.visitorSupermarketItem(this);
		}
	}
}