package mmo.framework.domain.fairy
{
	public class FairyPlayerLevel
	{
		private var _level:int;
		private var _exp:int;
		private var _cost:int;
		private var _endurance;
		private var _cell:int;
		
		public function FairyPlayerLevel(level:int, exp:int, cost:int, endurance:int, cell:int)
		{
			this._level = level;
			this._exp = exp;
			this._cost = cost;
			this._endurance = endurance;
			this._cell = cell;
		}
		
		public function get level():int
		{
			return this._level;
		}
		
		public function get needExp():int
		{
			return this._exp;
		}
		
		public function get cost():int
		{
			return this._cost;
		}
		
		public function get endurance():int
		{
			return this._endurance;
		}
		
		public function get presentCell():int
		{
			return this._cell;
		}
	}
}