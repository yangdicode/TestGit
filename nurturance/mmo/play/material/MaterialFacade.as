package mmo.play.material
{
	import flash.system.ApplicationDomain;
	
	import mmo.framework.domain.battleitem.UserBattleItem;
	import mmo.framework.domain.card.UserCardItem;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.framework.domain.material.clothes.UserClothes;
	import mmo.framework.domain.material.furniture.UserFurniture;
	import mmo.framework.domain.material.gitem.UserGItem;
	import mmo.framework.domain.material.petitem.UserPetItem;
	import mmo.play.battleitem.BattleItemFacade;
	import mmo.play.card.CardItemFacade;
	import mmo.play.material.clothes.ClothesFacade;
	import mmo.play.material.furniture.FurnitureFacade;
	import mmo.play.material.gitem.GItemFacade;
	import mmo.play.material.petitem.PetItemFacade;

	public class MaterialFacade
	{
		private static var _itemType_facade:Object = Class(ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.MaterialTypeConfig"))["itemType_facade"];
		public function MaterialFacade()
		{
		}
				
		public static function getFacade(mType:int):IMaterialFacade
		{
			var facadeClassName:String = _itemType_facade[mType];
			var facadeClass:Class = ApplicationDomain.currentDomain.getDefinition(facadeClassName) as Class;
			return facadeClass["instance"] as IMaterialFacade;
		}
		
		public static function getMaterialTypes():Array
		{
			var arr:Array = [];
			for (var type:String in _itemType_facade)
			{
				arr.push(int(type));
			}	
			return arr;
		}	
	}
}