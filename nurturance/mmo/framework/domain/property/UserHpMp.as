package mmo.framework.domain.property
{
	public class UserHpMp
	{
		public var hp:int;
		public var maxHp:int;
		
		public function UserHpMp(hpMpStr:String)
		{
			var userHpMpArray:Array = hpMpStr.split(",");
			this.hp = int(userHpMpArray[0]);
			this.maxHp = int(userHpMpArray[1]);
		}
	}
}