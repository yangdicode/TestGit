package mmo.framework.domain.card
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserCardItemsData
	{
		private var _userMaterialData:UserMaterialData;
		public function UserCardItemsData()
		{
			_userMaterialData = new UserMaterialData();
		}
		
		public function addUserCardItem(uci:UserCardItem):void
		{
			_userMaterialData.addUserMaterial(uci);
		}
		
		public function getUserCardItemById(id:int):UserCardItem
		{
			return _userMaterialData.getUserMaterial(id) as UserCardItem;
		}
		
		public function getAllUserCardItems():Object
		{
			return _userMaterialData.getAllUserMaterial();
		}
		
		public function hasUserCardItem(id:int):Boolean
		{
			return _userMaterialData.hasMaterial(id);
		}
	}
}