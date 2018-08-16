package mmo.play.material.visitor
{
	import mmo.play.battleitem.BattleItemFacade;
	import mmo.play.card.CardItemFacade;
	import mmo.play.card.equipcard.EquipCardItemFacade;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.furniture.FurnitureFacade;
	import mmo.play.material.gitem.GItemFacade;
	import mmo.play.material.petitem.PetItemFacade;
	import mmo.play.material.plantitem.PlantItemFacade;
	import mmo.play.material.supermarketitem.SupermarketItemFacade;

	public class MaterialFacadeVisitor
	{
		public function MaterialFacadeVisitor()
		{
			var defineVisitor:MaterialDefineVisitor;
			var userMaterialVisitor:UserMaterialVisitor;
		}
		
		public function visitorClothes(clothesFacade:ClothesFacade):*
		{
			
		}
		
		public function visitorFurniture(furnitureFacade:FurnitureFacade):*
		{
			
		}	
		
		public function visitorGItem(gItemFacade:GItemFacade):*
		{
			
		}	
		
		public function visitorBattleItem(battleItemFacade:BattleItemFacade):*
		{
			
		}	
		
		public function visitorCardItem(cardItemFacade:CardItemFacade):*
		{
			
		}	
		
		public function visitorPetItem(petItemFacade:PetItemFacade):*
		{
			
		}	
		
		public function visitorEquipCardItem(equipCardItemFacade:EquipCardItemFacade):*
		{
			
		}
		
		public function visitorPlantItem(plantItemFacade:PlantItemFacade):*
		{
			
		}
		
		public function visitorSupermarketItem(supermarketFacade:SupermarketItemFacade):*
		{
		}
	}
}