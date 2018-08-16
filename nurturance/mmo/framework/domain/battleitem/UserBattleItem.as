package mmo.framework.domain.battleitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.UserMaterial;
	
	public class UserBattleItem extends UserMaterial
	{
		public function UserBattleItem(material:Material, materialType:int, quantity:int, usedUp:int)
		{
			super(material, materialType, quantity, usedUp);
		}		
	}
}