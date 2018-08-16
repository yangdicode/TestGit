package mmo.framework.domain.property
{
	public class Sex
	{
		public static const MALE:Sex = new Sex(1);
		public static const FEMALE:Sex = new Sex(0);		
		function Sex(value:int)
		{
			_value = value;
		}
		
		private var _value:int;
		public function get value():int
		{
			return _value;	
		}	
		
		public function description():String
		{
			if(_value == 1)
			{
				return "男";
			}else
			{
				return "女";
			}
		}
		
		//代号,用户文件命名等
		public function code():String
		{
			if(_value == 1)
			{
				return "m";
			}else
			{
				return "f";
			}	
		}
		
		public function get isMale():Boolean{
			return _value == 1;
		}
		
		public static function getSex(value:int):Sex
		{
			if(value == 0)
			{
				return FEMALE;
			}else if(value == 1)
			{
				return MALE;
			}
			return null;
		}
	}
}