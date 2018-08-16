package mmo.framework.domain.skill.buildskill
{
	import mmo.framework.domain.skill.base.RaceSkill;
	import mmo.framework.domain.skill.base.RaceSkillType;

	public class BuildSkill extends RaceSkill
	{
		public function BuildSkill(id:int,name:String,type:String,descript:String,lv:int,learnNeedSkillLv:int,
								  learnNeedLv:int,learnNeedScore:int,learnLimits:XML,stuffs:XML,product:XML
		)
		{
			super(id,RaceSkillType.Build,name,type,descript,lv,learnNeedSkillLv,learnNeedLv,
				learnNeedScore,learnLimits,stuffs,product);
		}
	}
}