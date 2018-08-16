package mmo.framework.domain.material.visitor
{
	import mmo.framework.domain.battleitem.BattleItem;
	import mmo.framework.domain.card.CardBase;
	import mmo.framework.domain.material.clothes.Clothes;
	import mmo.framework.domain.material.furniture.Furniture;
	import mmo.framework.domain.material.gitem.GItem;
	import mmo.framework.domain.material.petitem.PetItem;
	import mmo.framework.domain.material.plantitem.PlantItem;
	import mmo.framework.domain.material.supermarket.SupermarketItem;

	public class MaterialVisitor
	{
		public function MaterialVisitor()
		{
			var mstv:MaterialSubTypeVisitor;
		}
		
		public function visitorClothes(clothes:Clothes):*
		{
			
		}
		
		public function visitorFurniture(furniture:Furniture):*
		{
			
		}	
		
		public function visitorGItem(gItem:GItem):*
		{
			
		}	
		
		public function visitorBattleItem(battleItem:BattleItem):*
		{
			
		}	
		
		public function visitorCardItem(card:CardBase):*
		{
			
		}	
		
		public function visitorPetItem(petItem:PetItem):*
		{
			
		}	
		
		public function visitorPlantItem(plantItem:PlantItem):*
		{
			
		}
		
		public function visitorSupermarketItem(supermarketItem:SupermarketItem):*
		{
			
		}
	}
}