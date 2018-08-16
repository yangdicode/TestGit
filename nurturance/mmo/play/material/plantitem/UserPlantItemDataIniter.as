package mmo.play.material.plantitem
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.plantitem.UserPlantItem;
	import mmo.framework.domain.material.plantitem.UserPlantItemData;
	import mmo.framework.domain.plant.PlantClient;
	import mmo.play.DataIniter;
	
	public class UserPlantItemDataIniter extends DataIniter
	{
		public function UserPlantItemDataIniter()
		{
			super();
		}
		
		public override function getData():void
		{
			SocketClient.instance.addEventListener(PlantClient.CMD_GET_MY_GARDENITEM, onGetMyPlantItems);
			PlantClient.instance.getMyPlantItems();
		}
		
		private function onGetMyPlantItems(evt:SocketClientEvent):void
		{
			SocketClient.instance.removeEventListener(PlantClient.CMD_GET_MY_GARDENITEM, onGetMyPlantItems);
			var itemDatas:Array = evt.params.ugs;
			
			var upid:UserPlantItemData = new UserPlantItemData();
			
			for each(var data:Object in itemDatas)
			{
				var id:int = data.id;
				var quantity:int = data.num;
				//可能不需要
				var useUp:int = 0;
				
				var material:Material = PlantItemFacade.instance.getMaterialById(id);
				if (material == null)
				{
					throw new Error("没有物品Id "+ id);
				}
				var userPlantItem:UserPlantItem = new UserPlantItem(material, quantity, useUp);
				upid.addUserPlantItem(userPlantItem);
			}
			MainModelLocator.instance.addModel(UserPlantItemData, upid);
			PlantItemFacade.instance.initMyPlantItems(upid);
			
			this.onGetData(null);
		}
	}
}