package mmo.framework.domain.material.furniture
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserFurnitureData
	{
		private var userMaterialData:UserMaterialData;
		
		public function UserFurnitureData()
		{
			userMaterialData = new UserMaterialData();
		}
		
		public function getAllUserFurniture():Object
		{
			return userMaterialData.getAllUserMaterial();
		}
		
		public function getUserFurnitureById(fId:int):UserFurniture
		{
			return userMaterialData.getUserMaterial(fId) as UserFurniture;
		}	
		
		public function addUserFurniture(userFurniture:UserFurniture):void
		{
			userMaterialData.addUserMaterial(userFurniture);
		}	
		
		public function hasFurniture(fId:int):Boolean
		{
			return userMaterialData.hasMaterial(fId);
		}	
	}
}