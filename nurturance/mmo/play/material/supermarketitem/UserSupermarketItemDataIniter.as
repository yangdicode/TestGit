package mmo.play.material.supermarketitem
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.supermarket.UserSupermarketItem;
	import mmo.framework.domain.material.supermarket.UserSupermarketItemData;
	import mmo.play.DataIniter;
	
	public class UserSupermarketItemDataIniter extends DataIniter
	{
		public function UserSupermarketItemDataIniter()
		{
			super();
		}
		
		public override function getData():void
		{
			SocketClient.instance.addEventListener(SupermarketClient.CMD_GET_MY_SUPERMARKET_ITEMS, onGetMySupermarketItems);
			SupermarketClient.instance.getMySupermarketItemInfos();
		}
		
		private function onGetMySupermarketItems(evt:SocketClientEvent):void
		{
			SocketClient.instance.removeEventListener(SupermarketClient.CMD_GET_MY_SUPERMARKET_ITEMS, onGetMySupermarketItems);
			var itemDatas:Array = evt.params.items;
			
			var usid:UserSupermarketItemData = new UserSupermarketItemData();
			
			for each(var data:Object in itemDatas)
			{
				var id:int = data.id;
				var quantity:int = data.num;
				//可能不需要
				var useUp:int = 0;
				
				var material:Material = SupermarketItemFacade.instance.getMaterialById(id);
				if (material == null)
				{
					throw new Error("没有物品Id "+ id);
				}
				var userItem:UserSupermarketItem = new UserSupermarketItem(material, quantity, useUp);
				usid.addUserSupermarketItem(userItem);
			}
			MainModelLocator.instance.addModel(UserSupermarketItemData, usid);
			SupermarketItemFacade.instance.initMySupermarketItems(usid);
			
			this.onGetData(null);
		}
	}
}