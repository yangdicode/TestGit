package mmo.framework.domain.skill.feedskill
{
	import mmo.framework.domain.skill.base.UserRaceSkillData;
	
	/** 
	 *  用户的炼宠技能信息
	 *  @author LIYAWEI
	 **/
	public class UserFeedSkillData extends UserRaceSkillData
	{
		public function UserFeedSkillData(exp:int,level:int,phase:int,skillStr:String)
		{
			super(exp,level,phase,skillStr);
		}
	}
}