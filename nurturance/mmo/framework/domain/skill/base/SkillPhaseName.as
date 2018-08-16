package mmo.framework.domain.skill.base
{
	/**
	 * 种族技能阶段名
	 * @author liyawei
	 */	
	public class SkillPhaseName
	{
		public function SkillPhaseName()
		{
		}
		
		public static function getPhaseName(phase:int):String
		{
			return phaseName[phase - 1];
		}
		
		public static var phaseName:Array = 
		[
			"入门级",
			"初级",
			"中级",
			"高级",
			"殿堂级"
		]
	}
}