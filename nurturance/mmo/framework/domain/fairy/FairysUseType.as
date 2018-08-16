package mmo.framework.domain.fairy
{
	public class FairysUseType
	{
		private static const TypeNames:Object =
			{
				"精英":1,
				"平衡":2,
				"回复":3,
				"体力":4,
				"攻击":5,
				"进化材料":6,
				"强化合成":7,
				"神":8
			};
		
		public static const Elite:int = 1;
		public static const Balance:int = 2;
		public static const Recover:int = 3;
		public static const PhysicalPower:int = 4;
		public static const Attack:int = 5;
		public static const EvolveStuff:int = 6;
		public static const ComposeStuff:int = 7;
		public static const God:int = 8;
		
		public function FairysUseType()
		{
		}
		
		public static function getFairyUseTypeByUseTypeName(typeName:String):int
		{
			if (!TypeNames.hasOwnProperty(typeName))
			{
				return 0;
			}
			return TypeNames[typeName];
		}
	}
}