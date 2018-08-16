package mmo.framework.domain.honor
{
	/**
	 * 个人成就
	 * @author liyawei
	 */	
	
	public class UserEffort
	{
		public var effortId:int;
		public var finDate:Date;
		
		public function UserEffort(effortId:int,finDate:Date)
		{
			this.effortId = effortId;
			this.finDate = finDate;
		}
		
		public function get dateNum():Number
		{
			return finDate.getTime();
		}
	}
}