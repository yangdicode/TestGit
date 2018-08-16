package mmo.framework.domain.material.clothes
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserClothesData
	{
		private var userMaterialData:UserMaterialData;
		public function UserClothesData()
		{
			userMaterialData = new UserMaterialData();
		}
		
		public function getUserClothesById(clothesId:int):UserClothes
		{
			return userMaterialData.getUserMaterial(clothesId) as UserClothes;
		}	
		
		public function getAllUserClothes():Object
		{
			return userMaterialData.getAllUserMaterial();	
		}	
		
		public function addUserClothes(userClothes:UserClothes):void
		{
			userMaterialData.addUserMaterial(userClothes);
		}	
		
		public function hasClothes(clothesId:int):Boolean
		{
			return userMaterialData.hasMaterial(clothesId);
		}	
	}
}