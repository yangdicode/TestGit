package mmo.framework.domain.petbreeding
{
	public class PetHouseOwnerInfo
	{
		public var name:String;
		public var curExp:int;
		public var breedingLevel:int;
		public var nextExp:int;
		
		public function PetHouseOwnerInfo(name:String, exp:int, nextExp:int, lvl:int)
		{
			this.name = name;
			this.curExp = exp;
			this.nextExp = nextExp;
			this.breedingLevel = lvl;
		}
	}
}