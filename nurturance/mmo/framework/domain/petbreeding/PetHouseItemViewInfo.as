package mmo.framework.domain.petbreeding
{	
	public class PetHouseItemViewInfo
	{
		public var x:int;
		public var y:int;
		public var order:int;
		public var id:int;
		/**
		 * PetItemTypes， -1是宠物
		 */
		public var type:int;
		
		public function PetHouseItemViewInfo(type:int, id:int, order:int, x:int, y:int)
		{
			this.type = type;
			this.id = id;
			this.order = order;
			this.x = x;
			this.y = y;
		}
	}
}