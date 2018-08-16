package mmo.framework.domain.battleitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;

	public class BattleItem extends Material
	{
		private var _type:String;
		private var _params:XML;
		private var _useType:String;

		public function BattleItem(id:int, name:String, maxOwnNum:int, value:int, sellPrice:int, isBind:int, isVip:int, desc:String, type:String, useType:String, params:XML, canTrade:int = 0, isOutOfPrint:int = 0)
		{
			super(id, MaterialTypes.BATTLEITEM, name, maxOwnNum, value, sellPrice, isBind, isVip, desc, canTrade, isOutOfPrint);
			_type = type;
			_params = params;
			_useType = useType;
		}

		public function get type():String
		{
			return _type;
		}
		
		public function get params():XML
		{
			return _params;
		}
		
		public function get useType():String
		{
			return _useType;
		}
			

		override public function accept(materialVisitor:MaterialVisitor):*
		{
			return materialVisitor.visitorBattleItem(this);
		}
	}
}