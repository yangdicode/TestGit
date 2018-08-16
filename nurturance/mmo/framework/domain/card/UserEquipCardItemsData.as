package mmo.framework.domain.card
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserEquipCardItemsData
	{
		private var _userMaterialData:UserMaterialData;
		public function UserEquipCardItemsData()
		{
			_userMaterialData = new UserMaterialData();
		}
		
		public function addUserEquipCardItem(uci:UserEquipCardItem):void
		{
			_userMaterialData.addUserMaterial(uci);
		}
		
		public function getUserEquipCardItemById(id:int):UserEquipCardItem
		{
			return _userMaterialData.getUserMaterial(id) as UserEquipCardItem;
		}
		
		public function getAllUserEquipCardItems():Object
		{
			return _userMaterialData.getAllUserMaterial();
		}
		
		public function hasUserEquipCardItem(id:int):Boolean
		{
			return _userMaterialData.hasMaterial(id);
		}
	}
}