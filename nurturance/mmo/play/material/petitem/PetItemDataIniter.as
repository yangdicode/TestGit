package mmo.play.material.petitem
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.petitem.PetItem;
	import mmo.framework.domain.material.petitem.UserPetItem;
	import mmo.framework.domain.material.petitem.UserPetItemData;
	import mmo.play.DataIniter;
	import mmo.play.petbreeding.PetBreedingClient;
	
	public class PetItemDataIniter extends DataIniter
	{
		public function PetItemDataIniter()
		{
			super();
		}
		
		public override function getData():void
		{
			SocketClient.instance.addEventListener(PetBreedingClient.GET_PETITEMS, onGetMyPetItem);
			PetItemClient.instance.getMyPetItem();
		}
		
		private function onGetMyPetItem(evt:SocketClientEvent):void
		{
			SocketClient.instance.removeEventListener(PetBreedingClient.GET_PETITEMS, onGetMyPetItem);
			var userPetItemData:UserPetItemData = new UserPetItemData();
			PetItemFacade.instance.initMyPetItem(userPetItemData);
			var data:String = evt.params.petarticles;
			var petHouseDecorate:String = evt.params.phd;
			if(data == null || data == "")
			{
				onGetData(null);
				return;
			}
			var petHouseFurIds:Array = parsePetHouseDecorate(petHouseDecorate);
			var items:Array = data.split(",");
			for(var i:int = 0; i < items.length; i++)
			{
				var itemData:Array = String(items[i]).split("-");
				var id:int = int(itemData[0]);
				var num:int = int(itemData[1]);
				var PetItemDefine:PetItem = PetItemFacade.instance.getMaterialById(id) as PetItem;
				var userPetItem:UserPetItem = new UserPetItem(PetItemDefine, MaterialTypes.PETITEM, num, 0);
				var usedNum:int = getPetFurnitureUsedNum(petHouseFurIds, userPetItem.materialId);
				userPetItem.usedUp += usedNum;
				userPetItemData.addUserPetItem(userPetItem);
			}
			MainModelLocator.instance.addModel(UserPetItemData, userPetItemData);
			onGetData(null);
		}
		
		private function parsePetHouseDecorate(petHouseDecorate:String):Array
		{
			var arr:Array = [];
			var furs:Array = petHouseDecorate.split(";");
			for each(var fur:String in furs)
			{
				var furInfos:Array = fur.split(",");
				var furId:int = int(furInfos[1]);
				arr.push(furId);
			}
			return arr;
		}	
		
		private function getPetFurnitureUsedNum(petHouseFurIds:Array, petFurId:int):int
		{
			var usedUp:int = 0;
			for each(var houseFurId:int in petHouseFurIds)
			{
				if(houseFurId == petFurId)
				{
					usedUp++;
				}	
			}
			return usedUp;
		}	
	}
}