package mmo.framework.domain.skill.tailorskill
{
	import mmo.framework.domain.skill.base.RaceSkill;
	import mmo.framework.domain.skill.base.RaceSkillType;

	/**
	 * 裁缝技能定义
	 * @author LIYAWEI
	 * */
	
	public class TailorSkill extends RaceSkill
	{
		public function TailorSkill(id:int,name:String,type:String,descript:String,lv:int,learnNeedSkillLv:int,
									learnNeedLv:int,learnNeedScore:int,learnLimits:XML,stuffs:XML,product:XML
									)
		{
			super(id,RaceSkillType.Tailor,name,type,descript,lv,learnNeedSkillLv,learnNeedLv,
				learnNeedScore,learnLimits,stuffs,product);
		}
	}
}