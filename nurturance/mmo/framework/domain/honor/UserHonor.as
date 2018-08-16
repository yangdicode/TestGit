package mmo.framework.domain.honor
{
	/**
	 * 个人荣誉记录
	 * @author liyawei
	 */	
	
	public class UserHonor
	{
		public var honorId:int;
		public var value:int;
		
		public function UserHonor(honorId:int,value:int)
		{
			this.honorId = honorId;
			this.value = value;
		}
	}
}