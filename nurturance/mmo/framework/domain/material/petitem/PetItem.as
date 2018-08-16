package mmo.framework.domain.material.petitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;

	public class PetItem extends Material
	{
		private var _type:int;
		private var _extData:Object;

		public function PetItem(id:int, type:int, name:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, description:String, canTrade:int, isOutOfPrint:int, extData:Object)
		{
			super(id, MaterialTypes.PETITEM, name, maxOwnNum, value, sellPrice, isBind, isVip, description, canTrade, isOutOfPrint);
			this._type = type;
			this._extData = extData;
		}

		/**
		 * 只读属性，宠物物品类型（PetItemTypes）
		 */
		public function get petItemType():int
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
			return materialVisitor.visitorPetItem(this);
		}	
	}
}