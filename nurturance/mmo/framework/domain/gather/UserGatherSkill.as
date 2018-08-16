package mmo.framework.domain.gather
{
	public class UserGatherSkill
	{
		private var _level:int;
		private var _exp:int;
		private var _phase:int;
		
		public function UserGatherSkill(level:int,exp:int,phase:int)
		{
			this._level = level;
			this._exp = exp;
			this._phase = phase;
		}
		
		public function get level():int
		{
			return _level;
		}
		
		public function set level(value:int):void
		{
			_level = value;
		}
		
		public function get exp():int
		{
			return _exp;
		}
		
		public function set exp(value:int):void
		{
			_exp = value;
		}
		
		public function get phase():int
		{
			return _phase;
		}

		public function set phase(value:int):void
		{
			_phase = value;
		}
	}
}