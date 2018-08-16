package mmo.framework.domain.member
{
	public class MemberLevel
	{
		public function MemberLevel(level:int, minExp:int, desc:String)
		{
			_level = level;
			_minExp = minExp;
			_desc = desc;
		}
		
		private var _level:int;
		public function get level():int
		{
			return _level;
		}
		
		private var _minExp:int;
		public function get minExp():int
		{
			return _minExp;
		}
		
		private var _desc:String;
		public function get desc():String
		{
			return _desc;
		}
	}
}