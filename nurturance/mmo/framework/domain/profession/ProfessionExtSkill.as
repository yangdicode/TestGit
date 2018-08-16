package mmo.framework.domain.profession
{
	import flash.system.ApplicationDomain;

	public class ProfessionExtSkill
	{
		private static const data:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ProfessionExtSkillData")["data"];
		
		public function ProfessionExtSkill()
		{
		}
		
		/**
		 * 通过职业id获取额外职业技能卡id（数组） 
		 * @param proId 职业id
		 * @return 额外职业技能卡id（数组）
		 * 
		 */		
		public static function getSkillsByProId(proId:int):Array
		{
			if(!data[proId])
			{
				throw new Error("找不到职业id为" + proId + "的对应的额外职业卡");
				return [];
			}
		
			return data[proId] as Array;
		}
	}
}