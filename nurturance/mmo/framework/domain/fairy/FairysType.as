package mmo.framework.domain.fairy
{		
	public class FairysType
	{
		private static const TypeNames:Object =
			{
				"水":1,
				"火":2,
				"木":3,
				"光":4,
				"暗":5
			};
		
		public static const Water:int = 1;
		public static const Fire:int = 2;
		public static const Wood:int = 3;
		public static const Light:int = 4;
		public static const Dark:int = 5;
		
		public function FairysType()
		{
		}
		
		public static function getFairyTypeByTypeName(typeName:String):int
		{
			if (!TypeNames.hasOwnProperty(typeName))
			{
				return 0;
			}
			return TypeNames[typeName];
		}
	}
}