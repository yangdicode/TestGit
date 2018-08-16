package mmo.framework.domain.material.plantitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;
	
	public class PlantItem extends Material
	{
		private var _type:int;
		private var _extData:Object;
		
		public function PlantItem(id:int, name:String, description:String, type:int, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, canTrade:int, isOutOfPrint:int, extData:Object=null)
		{
			super(id, MaterialTypes.PLANTITEM, name, maxOwnNum, value, sellPrice, isBind, isVip, description, canTrade, isOutOfPrint);
		
			this._type = type;
			this._extData = extData;
		}
		
		/**
		 * 只读属性，种植物品类型（PlantItemTypes）
		 */
		public function get plantItemType():int
		{
			return this._type;
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
			return materialVisitor.visitorPlantItem(this);
		}
	}
}