package mmo.framework.domain.material.furniture
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;

	public class UserFurniture extends UserMaterial
	{
		
		public function UserFurniture(material:Material, quantity:int, usedUp:int)
		{
			super(material, MaterialTypes.FURNITURE, quantity, usedUp);
		}
	}
}