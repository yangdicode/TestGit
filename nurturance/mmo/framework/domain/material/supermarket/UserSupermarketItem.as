package mmo.framework.domain.material.supermarket
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	
	public class UserSupermarketItem extends UserMaterial
	{
		public function UserSupermarketItem(material:Material, quantity:int, usedUp:int)
		{
			super(material, MaterialTypes.SUPERMARKET, quantity, usedUp);
		}
		
		public function get item():SupermarketItem
		{
			return this._material as SupermarketItem;
		}
		
		public function get itemType():int
		{
			return this.item.itemType;
		}
	}
}