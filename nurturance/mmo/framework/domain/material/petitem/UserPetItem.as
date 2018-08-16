package mmo.framework.domain.material.petitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.UserMaterial;
	
	public class UserPetItem extends UserMaterial
	{
		public function UserPetItem(material:Material, materialType:int, quantity:int, usedUp:int)
		{
			super(material, materialType, quantity, usedUp);
		}
		
		public function get petItem():PetItem
		{
			return this._material as PetItem;
		}
		
		public function get userPetItemType():int
		{
			return this.petItem.petItemType;
		}
	}
}