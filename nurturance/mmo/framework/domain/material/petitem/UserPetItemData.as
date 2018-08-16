package mmo.framework.domain.material.petitem
{
	import mmo.framework.domain.material.UserMaterialData;
	
	public class UserPetItemData extends UserMaterialData
	{
		private var userMaterialData:UserMaterialData;
		
		public function UserPetItemData()
		{
			super();
			this.userMaterialData = new UserMaterialData();
		}
		
		public function getAllUserPetItems():Object
		{
			return userMaterialData.getAllUserMaterial();
		}
		
		public function getUserPetItemById(itemId:int):UserPetItem
		{
			return userMaterialData.getUserMaterial(itemId) as UserPetItem;
		}	
		
		public function addUserPetItem(userItem:UserPetItem):void
		{
			userMaterialData.addUserMaterial(userItem);
		}	
		
		public function hasUserPetItem(itemId:int):Boolean
		{
			return userMaterialData.hasMaterial(itemId);
		}	
	}
}