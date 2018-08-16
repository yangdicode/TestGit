package mmo.framework.domain.property
{
	public class Race
	{
		//无种族
		public static const None:Race = new Race(0);
		//人族
		public static const BULING:Race = new Race(1);
		//兽族
		public static const QIAOLING:Race = new Race(2);
		//精灵
		public static const QINGLING:Race = new Race(3); 
		function Race(value:int)
		{
			_value = value;
		}
		
		private var _value:int;		
		public function get value():int
		{
			return _value;
		}
		
		public function getDescription():String
		{
			switch(_value)
			{
				case 0:
					return "无"
				case 1:
					return "布灵族";
				case 2:
					return "巧灵族";
				case 3:
					return "轻灵族";		
			}
			return null;
		}
		
		public static function getRace(value:int):Race
		{
			switch(value)
			{
				case 0:
					return None;
				case 1:
					return BULING;
				case 2:
					return QIAOLING;
				case 3:
					return QINGLING;	
			}
			return null;
		}
	}
}