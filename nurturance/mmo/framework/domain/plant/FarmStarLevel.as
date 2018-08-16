package mmo.framework.domain.plant
{
	public class FarmStarLevel
	{
		private var _level:int;
		private var _exp:int;
		private var _incVarRate:int;
		
		public function FarmStarLevel(level:int, exp:int, incVarRate:int)
		{
			this._level = level;
			this._exp = exp;
			this._incVarRate = incVarRate;
		}
		
		public function get level():int {
			return this._level;
		}
		
		public function get needExp():int {
			return this._exp;
		}
		
		public function get incVarRate():int
		{
			return this._incVarRate;
		}
	}
}