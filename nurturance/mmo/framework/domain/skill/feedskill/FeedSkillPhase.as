package mmo.framework.domain.skill.feedskill
{
	import mmo.framework.domain.skill.base.RacePhase;
	
	public class FeedSkillPhase extends RacePhase
	{
		public function FeedSkillPhase(id:int, needLv:int, needGLv:int, dItems:XML, dScore:int)
		{
			super(id, needLv, needGLv, dItems, dScore);
		}
	}
}