package mmo.play.material
{
	import mmo.play.avatar.AvatarFacade;
	import mmo.play.material.changehelper.MaterialChangeHelper;
	import mmo.play.material.clothes.ClothesConflictStrategy;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.clothes.ClothesViewCreator;
	import mmo.play.material.display.MaterialDisplayConfig;
	import mmo.play.material.display.MaterialDisplayEvent;
	import mmo.play.material.display.MaterialDisplayPanel;
	import mmo.play.material.display.MaterialDisplayer;
	import mmo.play.material.filter.UserMaterialFilter;
	import mmo.play.material.furniture.FurnitureFacade;
	import mmo.play.material.gitem.GItemFacade;
	import mmo.play.material.groupbutton.ComboItemGroupButton;
	import mmo.play.material.groupbutton.GroupButtonEvent;
	import mmo.play.material.groupbutton.IGroupButton;
	import mmo.play.material.groupbutton.ItemGroupButton;
	import mmo.play.material.panel.MaterialGetPanel;
	import mmo.play.material.petitem.PetItemClient;
	import mmo.play.material.petitem.PetItemDataIniter;
	import mmo.play.material.petitem.PetItemFacade;
	import mmo.play.material.petitem.PetItemViewCreater;
	import mmo.play.material.plantitem.PlantItemFacade;
	import mmo.play.material.plantitem.PlantItemViewCreator;
	import mmo.play.material.plantitem.UserPlantItemDataIniter;
	import mmo.play.material.supermarketitem.SupermarketClient;
	import mmo.play.material.supermarketitem.SupermarketItemFacade;
	import mmo.play.material.supermarketitem.SupermarketItemViewCreator;
	import mmo.play.material.supermarketitem.UserSupermarketItemDataIniter;
	import mmo.play.plant.UserFarmInfoDataIniter;

	public class MaterialCompile
	{
		public function MaterialCompile()
		{
		}
		
		public static function compileMe():void
		{
			var clothesFacade:ClothesFacade;
			var avatarFacade:AvatarFacade; 
			
			var itemFacade:GItemFacade;
			
			var furFacade:FurnitureFacade;
			
			var mf:MaterialFacade;
			
			var mch:MaterialChangeHelper;
			
			var mgp:MaterialGetPanel;
			
			var imaterialViewCreator:IMaterialViewCreator;
			var mvce:MaterialViewCreatorEvent;
			var cfc:ClothesFurnitureClient;
			var ucaf:UserClothesAndFurIniter;
			var clothesViewCreator:ClothesViewCreator;
//			//测试用
//			var tc:TestClient;
			var ccs:ClothesConflictStrategy;
			
			var umFilter:UserMaterialFilter;
			var mdc:MaterialDisplayConfig;
			var md:MaterialDisplayer;
			var mde:MaterialDisplayEvent;
			var mdp:MaterialDisplayPanel;
			
			var interfacegb:IGroupButton;
			var gbe:GroupButtonEvent;
			var itemgb:ItemGroupButton;
			var cigb:ComboItemGroupButton;
			
			var petItemClient:PetItemClient;
			var petItemDataIniter:PetItemDataIniter;
			var petItemFacade:PetItemFacade;
			var petItemViewCreater:PetItemViewCreater;
			
			var plantItemDataIniter:UserPlantItemDataIniter;
			var plantItemFacade:PlantItemFacade;
			var plantItemViewCreater:PlantItemViewCreator;
			var userFarmDataIniter:UserFarmInfoDataIniter;
			
			var supermarketClient:SupermarketClient;
			var supermarketItemFacade:SupermarketItemFacade;
			var supermarketItemView:SupermarketItemViewCreator;
			var useraSupermarketItemData:UserSupermarketItemDataIniter;
		}
	}
}