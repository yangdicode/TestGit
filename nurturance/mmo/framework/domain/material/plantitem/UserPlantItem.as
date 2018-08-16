package mmo.framework.domain.material.plantitem
{
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.material.UserMaterial;
	
	public class UserPlantItem extends UserMaterial
	{
		public function UserPlantItem(material:Material, quantity:int, usedUp:int)
		{
			super(material, MaterialTypes.PLANTITEM, quantity, usedUp);
		}
		
		public function get plantItem():PlantItem
		{
			return this._material as PlantItem;
		}
		
		public function get userPlantItemType():int
		{
			return this.plantItem.plantItemType;
		}
	}
}