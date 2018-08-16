package mmo.framework.domain.property
{
	public class PropertyUtil
	{
		public function PropertyUtil()
		{
		}
		
		public static function getAstrology(date:Date):String
		{
			return getAstro(date.month + 1, date.date);
		}	
		
		//计算星座
		protected static function getAstro(month:int, day:int):String
		{
			var s:String="摩羯水瓶双鱼牧羊金牛双子巨蟹狮子处女天秤天蝎射手摩羯";
			var arr:Array=new Array(20, 19, 21, 21, 21, 22, 23, 23, 23, 23, 22, 22);
			return s.substr(month * 2 - (day < arr[month - 1] ? 2 : 0), 2);
		}
	}
}