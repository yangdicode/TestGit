package mmo.framework.domain.palace
{
	public class PalaceBlessBagTypes
	{
		public static const GoldJewel:int = 1;
		public static const YubiPatch:int = 2;
		
		public function PalaceBlessBagTypes()
		{
		}
		
		public static function getBlessBagTypeName(type:int):String
		{
			if (type == GoldJewel)
			{
				return "金钻";
			}
			return "羽贝碎片";
		}
		
		public static function getSpecialTypeName(type:int, count:int=0):String
		{
			var str:String = count==0 ? "":count.toString();
			if (type == GoldJewel)
			{
				return str + "金钻";
			}
			count = count / 108;
			
			if (count > 0)
			{
				str = count.toString();
			}
			
			return str + "羽贝";
		}
	}
}