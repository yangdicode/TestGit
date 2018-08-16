package mmo.framework.domain.material.supermarket
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserSupermarketItemData
	{
		private var _userMaterialData:UserMaterialData;
		
		public function UserSupermarketItemData()
		{
			this._userMaterialData = new UserMaterialData();
		}
		
		public function getAllUserSupermarketItems():Object
		{
			return this._userMaterialData.getAllUserMaterial();
		}
		
		public function getUserSupermarketItemById(itemId:int):UserSupermarketItem
		{
			return this._userMaterialData.getUserMaterial(itemId) as UserSupermarketItem;
		}	
		
		public function addUserSupermarketItem(userSupermarketItem:UserSupermarketItem):void
		{
			this._userMaterialData.addUserMaterial(userSupermarketItem);
		}	
		
		public function hasUserSupermarketItem(itemId:int):Boolean
		{
			return this._userMaterialData.hasMaterial(itemId);
		}
	}
}