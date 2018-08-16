package mmo.framework.domain.battleitem
{
	import mmo.framework.domain.material.UserMaterialData;

	public class UserBattleItemsData
	{
		private var _userMaterialData:UserMaterialData;
		public function UserBattleItemsData()
		{
			_userMaterialData = new UserMaterialData();
		}
		
		public function addUserBattleItem(ubi:UserBattleItem):void
		{
			_userMaterialData.addUserMaterial(ubi);
		}	
		
		public function getUserBattleItemById(id:int):UserBattleItem
		{
			return _userMaterialData.getUserMaterial(id) as UserBattleItem;
		}	
		
		public function getAllUserBattleItems():Object
		{
			return _userMaterialData.getAllUserMaterial();
		}	
		
		public function hasUserBattleItem(id:int):Boolean
		{
			return _userMaterialData.hasMaterial(id);
		}	
	}
}