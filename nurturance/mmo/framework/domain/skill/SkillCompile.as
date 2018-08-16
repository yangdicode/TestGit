package mmo.framework.domain.skill
{
	import mmo.framework.domain.skill.base.RacePhase;
	import mmo.framework.domain.skill.base.RaceSkill;
	import mmo.framework.domain.skill.base.RaceSkillType;
	import mmo.framework.domain.skill.base.SkillPhaseName;
	import mmo.framework.domain.skill.base.UserRaceSkillData;
	import mmo.framework.domain.skill.buildskill.BuildSkill;
	import mmo.framework.domain.skill.buildskill.BuildSkillPhase;
	import mmo.framework.domain.skill.buildskill.UserBuildSkillData;
	import mmo.framework.domain.skill.feedskill.FeedSkill;
	import mmo.framework.domain.skill.feedskill.FeedSkillPhase;
	import mmo.framework.domain.skill.feedskill.UserFeedSkillData;
	import mmo.framework.domain.skill.stuff.StuffMap;
	import mmo.framework.domain.skill.stuff.StuffMapType;
	import mmo.framework.domain.skill.stuff.StuffMaps;
	import mmo.framework.domain.skill.tailorskill.TailorSkill;
	import mmo.framework.domain.skill.tailorskill.TailorSkillPhase;
	import mmo.framework.domain.skill.tailorskill.UserTailorSkillData;

	public class SkillCompile
	{
		public function SkillCompile()
		{
		}
		
		private static function compileMe():void
		{
			var rs:RaceSkill;
			var rst:RaceSkillType;
			var ursd:UserRaceSkillData;
			var rp:RacePhase;
			
			var ts:TailorSkill;
			var uts:UserTailorSkillData;
			var tsp:TailorSkillPhase;
			
			var bs:BuildSkill;
			var ubsd:UserBuildSkillData;
			var bsp:BuildSkillPhase;
			
			var fs:FeedSkill;
			var ufsd:UserFeedSkillData;
			var fsp:FeedSkillPhase;
			
			var spn:SkillPhaseName;
			
			var stuffmap:StuffMap;
			var stuffmaps:StuffMaps;
			var stuffMapType:StuffMapType;
		}
	}
}