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
	
	public class MaterialDefineVisitor extends MaterialFacadeVisitor
	{
		public function MaterialDefineVisitor()
		{
			super();
		}
		
		override public function visitorClothes(clothesFacade:ClothesFacade):*
		{
			return  clothesFacade.getClothesArr();
		
		}	
		
		override public function visitorFurniture(furnitureFacade:FurnitureFacade):*
		{
			return furnitureFacade.getFurnituresArr();
		}	
		
		override public function visitorGItem(gItemFacade:GItemFacade):*
		{
			return gItemFacade.getGItemsArr();
		}	
		
		override public function visitorBattleItem(battleItemFacade:BattleItemFacade):*
		{
			return battleItemFacade.getBattleItemArr();
		}	
		
		override public function visitorCardItem(cardItemFacade:CardItemFacade):*
		{
			return cardItemFacade.getCardItemsArr();
		}	
		
		override public function visitorPetItem(petItemFacade:PetItemFacade):*
		{
			return petItemFacade.getPetItemArr();
		}	
		
		override public function visitorEquipCardItem(equipCardItemFacade:EquipCardItemFacade):*
		{
			return equipCardItemFacade.getEquipCardItemArr();
		}
		
		override public function visitorPlantItem(plantItemFacade:PlantItemFacade):*
		{
			return plantItemFacade.getUserPlantItemArr();
		}
		
		override public function visitorSupermarketItem(supermarketFacade:SupermarketItemFacade):*
		{
			return supermarketFacade.getUserSupermarketItemArr();
		}
	}
}