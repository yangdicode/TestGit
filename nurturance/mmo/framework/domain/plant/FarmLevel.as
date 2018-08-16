package mmo.framework.domain.plant
{
	public class FarmLevel
	{
		private var _level:int;
		private var _exp:int;
		private var _maxPotNum:int;
		
		public function FarmLevel(level:int, exp:int, potNum:int)
		{
			this._level = level;
			this._exp = exp;
			this._maxPotNum = potNum;
		}
		
		public function get level():int {
			return this._level;
		}
		
		public function get needExp():int {
			return this._exp;
		}
		
		public function get maxPotNum():int {
			return this._maxPotNum;
		}
	}
}