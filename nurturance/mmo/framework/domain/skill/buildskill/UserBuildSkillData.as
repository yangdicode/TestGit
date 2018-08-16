package mmo.framework.domain.skill.buildskill
{
	import mmo.framework.domain.skill.base.UserRaceSkillData;

	/** 
	 *  用户的建筑技能信息
	 *  @author LIYAWEI
	 **/
	public class UserBuildSkillData extends UserRaceSkillData
	{
		public function UserBuildSkillData(exp:int,level:int,phase:int,skillStr:String)
		{
			super(exp,level,phase,skillStr);
		}
	}
}