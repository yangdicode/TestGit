package mmo.framework.domain.skill.tailorskill
{
	import mmo.framework.domain.skill.base.UserRaceSkillData;

	/** 
	 *  用户的裁缝技能信息
	 *  @author LIYAWEI
	 **/
	
	public class UserTailorSkillData extends UserRaceSkillData
	{
		public function UserTailorSkillData(exp:int,level:int,phase:int,skillStr:String)
		{
			super(exp,level,phase,skillStr);
		}
	}
}