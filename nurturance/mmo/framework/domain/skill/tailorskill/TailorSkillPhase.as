package mmo.framework.domain.skill.tailorskill
{
	import mmo.framework.domain.skill.base.RacePhase;
	
	public class TailorSkillPhase extends RacePhase
	{
		public function TailorSkillPhase(id:int, needLv:int, needGLv:int, dItems:XML, dScore:int)
		{
			super(id, needLv, needGLv, dItems, dScore);
		}
	}
}