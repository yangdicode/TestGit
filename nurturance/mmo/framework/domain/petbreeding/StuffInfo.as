package mmo.framework.domain.petbreeding
{
	public class StuffInfo
	{
		public var type:int;
		public var id:int;
		public var num:int;
		
		public function StuffInfo(materialType:int, id:int, num:int)
		{
			this.type = materialType;
			this.id = id;
			this.num = num;
		}
	}
}