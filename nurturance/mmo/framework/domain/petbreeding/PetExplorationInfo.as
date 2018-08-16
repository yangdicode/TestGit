package mmo.framework.domain.petbreeding
{
	public class PetExplorationInfo
	{
		public var id:int;
		public var name:String
		public var dec:String;
		
		public function PetExplorationInfo(id:int, name:String, dec:String = "")
		{
			this.id = id;
			this.name = name;
			this.dec = dec;
		}
	}
}