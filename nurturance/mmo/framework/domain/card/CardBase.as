package mmo.framework.domain.card
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.visitor.MaterialVisitor;
	
	public class CardBase extends Material
	{
		private var _cardType:int;
		public function CardBase(id:int, 
								 name:String, 
								 description:String,
								cardType:int)
		{
			super(id, MaterialTypes.CARDITEM, name, 300, 0, 0, 0, 0, description, 0, 0);
			_cardType = cardType;
		}
		
		/**
		 *	卡片新旧类型 
		 * @return 0-旧卡；1-新卡
		 * 
		 */		
		public function getCardType():int
		{
			return _cardType;
		}
		
		override public function accept(materialVisitor:MaterialVisitor):*
		{
			return materialVisitor.visitorCardItem(this);
		}
		
	}
}