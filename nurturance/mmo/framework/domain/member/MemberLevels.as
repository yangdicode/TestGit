package mmo.framework.domain.member
{
	import flash.system.ApplicationDomain;

	public class MemberLevels
	{
		public static const MAX_LEVEL:int = 10;
		private static var levels:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.MemberLevelDatas")["data"];
		public function MemberLevels()
		{
		}
		
		public static function getMinExpByLevel(level:int):int
		{
			trace(level);
			var memberLevel:MemberLevel = levels[level] as MemberLevel;
			return memberLevel.minExp;
		}	
		
		public static function getLevelTitle(level:int):String
		{
			var memberLevel:MemberLevel = levels[level] as MemberLevel;
			return memberLevel.desc;
		}	
		
		public static function getLevelByExp(exp:int):int
		{
			if(exp == 0)
			{
				return 1;
			}	
						
			for (var level:int = MAX_LEVEL; level >=1 ; level--)
			{
				var ml:MemberLevel = levels[level] as MemberLevel;
				if(exp >= ml.minExp)
				{
					return level;
				}	
			}	
			
			return 1;
		}	
	}
}