package mmo.framework.domain.card
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.UserMaterial;
	
	public class UserCardItem extends UserMaterial
	{
		public function UserCardItem(material:Material, materialType:int, quantity:int, usedUp:int)
		{
			super(material, materialType, quantity, usedUp);
		}
	}
}