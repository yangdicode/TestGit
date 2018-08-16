package mmo.framework.domain.skill.buildskill
{
	import mmo.framework.domain.skill.base.RacePhase;

	public class BuildSkillPhase extends RacePhase
	{
		public function BuildSkillPhase(id:int,needLv:int,needGLv:int,dItems:XML,dScore:int)
		{
			super(id,needLv,needGLv,dItems,dScore);
		}
	}
}