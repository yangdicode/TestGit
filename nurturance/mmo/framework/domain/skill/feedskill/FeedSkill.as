package mmo.framework.domain.skill.feedskill
{
	import mmo.framework.domain.skill.base.RaceSkill;
	import mmo.framework.domain.skill.base.RaceSkillType;

	public class FeedSkill extends RaceSkill
	{
		public function FeedSkill(id:int,name:String,type:String,descript:String,lv:int,learnNeedSkillLv:int,
									learnNeedLv:int,learnNeedScore:int,learnLimits:XML,stuffs:XML,product:XML
		)
		{
			super(id,RaceSkillType.Feed,name,type,descript,lv,learnNeedSkillLv,learnNeedLv,
				learnNeedScore,learnLimits,stuffs,product);
		}
	}
}