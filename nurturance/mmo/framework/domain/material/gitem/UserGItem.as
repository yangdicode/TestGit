package mmo.framework.domain.material.gitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;

	public class UserGItem extends UserMaterial
	{
		public function UserGItem(material:Material, quantity:int, usedUp:int)
		{
			super(material, MaterialTypes.GITEM, quantity, usedUp);
		}
		
		public function get gItem():GItem
		{
			return material as GItem;
		}	
		
		public function get gItemType():int
		{
			return gItem.type;
		}	
		
		public function get gItemUseType():int
		{
			return gItem.useType;
		}	
	}
}