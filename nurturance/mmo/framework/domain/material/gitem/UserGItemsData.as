package mmo.framework.domain.material.gitem
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserGItemsData
	{
		private var userMaterialData:UserMaterialData;
		public function UserGItemsData()
		{
			userMaterialData = new UserMaterialData();
		}
		
		public function getAllUserItems():Object
		{
			return userMaterialData.getAllUserMaterial();
		}
		
		public function getUserItemById(itemId:int):UserGItem
		{
			return userMaterialData.getUserMaterial(itemId) as UserGItem;
		}	
		
		public function addUserItem(userItem:UserGItem):void
		{
			userMaterialData.addUserMaterial(userItem);
		}	
		
		public function hasItem(itemId:int):Boolean
		{
			return userMaterialData.hasMaterial(itemId);
		}	
	}
}