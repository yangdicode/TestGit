package mmo.framework.domain.material.furniture
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;

	/**
	 * 家具属性
	 */
	public class Furniture extends Material
	{
		public function Furniture(id:int, name:String, des:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, canTrade:int , isOutOfPrint:int, luxury:int)
		{
			super(id, MaterialTypes.FURNITURE, name, maxOwnNum, value, sellPrice, isBind, isVip, des, canTrade, isOutOfPrint);
			_luxury = luxury;
		}

		private var _type:int;
		private var _displayType:int;
		private var _luxury:int;

		//家具的小屋存储类型
		public function get type():int
		{
			return _type;
		}

		public function set type(type:int):void
		{
			_type = type;
		}

		public function get displayType():int
		{
			return _displayType;
		}

		public function set displayType(displayType:int):void
		{
			_displayType = displayType;
		}
		
		public function get luxury():int
		{
			return _luxury;
		}

		override public function accept(materialVisitor:MaterialVisitor):*
		{
			return materialVisitor.visitorFurniture(this);
		}


	}
}