package mmo.framework.domain.material.visitor
{
	import mmo.framework.domain.battleitem.BattleItem;
	import mmo.framework.domain.card.CardBase;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.framework.domain.material.furniture.Furniture;
	import mmo.framework.domain.material.gitem.GItem;
	import mmo.framework.domain.material.petitem.PetItem;
	import mmo.framework.domain.material.plantitem.PlantItem;
	
	public class MaterialSubTypeVisitor extends MaterialVisitor
	{
		public function MaterialSubTypeVisitor()
		{
			super();
		}
		
		override public function visitorClothes(clothes:Clothes):*
		{
			return clothes.parts[0]["clothesPos"];
		}
		
		override public function visitorFurniture(furniture:Furniture):*
		{
			return furniture.type;
		}	
		
		override public function visitorGItem(gItem:GItem):*
		{
			return gItem.type;
		}	
		
		override public function visitorBattleItem(battleItem:BattleItem):*
		{
			return battleItem.type;
		}	
		
		override public function visitorCardItem(card:CardBase):*
		{
			//错误的 再说
			return card.value;
		}	
		
		override public function visitorPetItem(petItem:PetItem):*
		{
			return petItem.petItemType;
		}	
		
		override public function visitorPlantItem(plantItem:PlantItem):*
		{
			return plantItem.plantItemType;
		}
	}
}