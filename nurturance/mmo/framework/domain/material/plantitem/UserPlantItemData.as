package mmo.framework.domain.material.plantitem
{
	import mmo.framework.domain.material.UserMaterialData;
	
	public class UserPlantItemData
	{
		private var _userMaterialData:UserMaterialData;
		
		public function UserPlantItemData()
		{
			this._userMaterialData = new UserMaterialData();
		}
		
		public function getAllUserPlantItems():Object
		{
			return this._userMaterialData.getAllUserMaterial();
		}
		
		public function getUserPlantItemById(itemId:int):UserPlantItem
		{
			return this._userMaterialData.getUserMaterial(itemId) as UserPlantItem;
		}	
		
		public function addUserPlantItem(userPlantItem:UserPlantItem):void
		{
			this._userMaterialData.addUserMaterial(userPlantItem);
		}	
		
		public function hasUserPlantItem(itemId:int):Boolean
		{
			return this._userMaterialData.hasMaterial(itemId);
		}
	}
}