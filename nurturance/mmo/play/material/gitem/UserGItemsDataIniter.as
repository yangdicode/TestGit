package mmo.play.material.gitem
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.gitem.UserGItem;
	import mmo.framework.domain.material.gitem.UserGItemsData;
	import mmo.play.DataIniter;
	
	public class UserGItemsDataIniter extends DataIniter
	{
		public function UserGItemsDataIniter()
		{
			
		}
		
		override public function getData():void
		{
			//初始化物品配置数据
			GItemFacade.instance;
			//初始化用户物品数据
			SocketClient.instance.addEventListener(GItemClient.cmdGetMyItems, onGetMyItems);
			GItemClient.instance.getMyItems();
		}	
		
		private function onGetMyItems(evt:SocketClientEvent):void {			
			
			SocketClient.instance.removeEventListener(GItemClient.cmdGetMyItems, onGetMyItems);
			var itemDatas:Array = evt.params.ugs;
			
			var uid:UserGItemsData = new UserGItemsData();
			
			for each(var data:Object in itemDatas)
			{
				var id:int = data.id;
				var quantity:int = data.num;
				
				//可能不需要
				var useUp:int = 0;
				
				var material:Material = GItemFacade.instance.getItemById(id) ;
				if(material == null){
					throw new Error("没有物品Id "+ id);
				}
				var userItem:UserGItem = new UserGItem(material, quantity, useUp);
				uid.addUserItem(userItem);
			}
			MainModelLocator.instance.addModel(UserGItemsData, uid);
			GItemFacade.instance.initMyItems();
			
			this.onGetData(null);
		}
	}
}