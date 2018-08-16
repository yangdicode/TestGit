package mmo.framework.domain.material
{
	import mmo.framework.model.changeable.ChangeableDispatcher;

	public class UserMaterialData
	{
		private var userMaterialMap:Object = {};
		public function UserMaterialData()
		{
		}
		
		public function addUserMaterial(userMaterial:UserMaterial):void
		{
			var materialId:int = userMaterial.materialId;
			if(hasMaterial(materialId))
			{
				throw new Error("add : user material: " + materialId + "Already Exist!");	
			}	
			userMaterialMap[materialId] = userMaterial;
		}
		
		public function getAllUserMaterial():Object
		{
			return userMaterialMap;
		}
		
		public function getUserMaterial(materialId:int):UserMaterial
		{
			return userMaterialMap[materialId] as UserMaterial;
		}	
		
		public function hasMaterial(materialId:int):Boolean
		{
			var um:UserMaterial = userMaterialMap[materialId] as UserMaterial;
			if(um == null || um.quantity == 0)
			{
				return false;
			}	
			return true;
		}	
	}
}