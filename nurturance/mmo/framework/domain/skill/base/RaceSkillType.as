package mmo.framework.domain.skill.base
{
	/**
	 * 种族技能类型
	 * @author liyawei
	 */	
	public class RaceSkillType
	{
		/**裁缝技能**/
		public static const Tailor:int = 1;
		
		/**建筑技能**/
		public static const Build:int = 2;
		
		/**宠物技能**/	
		public static const Feed:int = 3;
		
		/**裁缝技能具体分类**/
		public static const tailorSkillTypes:Array = ["制衣","材料合成"];
		
		/**建筑技能具体分类**/
		public static const buildSkillTypes:Array = ["工匠","材料合成"];
		
		/**宠物技能具体分类**/
		public static const feedSkillTypes:Array = ["炼宠","材料合成"];
	}
}