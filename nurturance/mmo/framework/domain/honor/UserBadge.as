package mmo.framework.domain.honor
{
	/**
	 * 个人称号
	 * @author liyawei
	 */	
	
	public class UserBadge
	{
		public var badgeId:int;
		public var finDate:Date;
		
		public function UserBadge(badgeId:int,finDate:Date)
		{
			this.badgeId = badgeId;
			this.finDate = finDate;
		}
		
		public function get dateNum():Number
		{
			return finDate.getTime();
		}
	}
}