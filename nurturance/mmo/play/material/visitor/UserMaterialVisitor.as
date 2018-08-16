package mmo.play.material.visitor
{
	import mmo.play.battleitem.BattleItemFacade;
	import mmo.play.card.CardItemFacade;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.furniture.FurnitureFacade;
	import mmo.play.material.gitem.GItemFacade;
	import mmo.play.material.petitem.PetItemFacade;
	import mmo.play.material.plantitem.PlantItemFacade;
	import mmo.play.material.supermarketitem.SupermarketItemFacade;
	
	public class UserMaterialVisitor extends MaterialFacadeVisitor
	{
		public function UserMaterialVisitor()
		{
			super();
		}
		
		override public function visitorClothes(clothesFacade:ClothesFacade):*
		{
			return  clothesFacade.getUserClothesArr();
			
		}	
		
		override public function visitorFurniture(furnitureFacade:FurnitureFacade):*
		{
			return furnitureFacade.getUserFurnitures();
		}	
		
		override public function visitorGItem(gItemFacade:GItemFacade):*
		{
			return gItemFacade.getUserGitemsArr();
		}	
		
		override public function visitorBattleItem(battleItemFacade:BattleItemFacade):*
		{
			return battleItemFacade.getUserBattleItemArr();
		}	
		
		override public function visitorCardItem(cardItemFacade:CardItemFacade):*
		{
			return cardItemFacade.getAllUserCardItemsArr();
		}	
		
		override public function visitorPetItem(petItemFacade:PetItemFacade):*
		{
			return petItemFacade.getUserPetItemArr();
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