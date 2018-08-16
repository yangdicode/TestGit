package mmo.framework.domain.profession
{
	public class ProfessionType
	{
		//初心者线路
		public static const ChuXin:int = 0;
		
		//艺人线路
		public static const YiRen:int = 1;
		
		//剑士线路
		public static const JianShi:int = 2;
		
		//法师线路
		public static const FaShi:int = 3;
		
		private static const ProTypeNames:Object = 
		{
			0:"初心者线",
			1:"艺人线",
			2:"剑士线",
			3:"法师线"
		}
		
		public static function getProTypeName(proType:int):String
		{
			return ProTypeNames[proType];
		}
	}
}