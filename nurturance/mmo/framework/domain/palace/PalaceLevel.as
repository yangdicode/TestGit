package mmo.framework.domain.palace
{
	public class PalaceLevel
	{
		private var _level:int;
		private var _needExp:int;
		private var _maxMember:int;
		private var _maxElite:int;
		
		public function PalaceLevel(level:int, needExp:int, maxMember:int, maxElite:int)
		{
			this._level = level;
			this._needExp = needExp;
			this._maxMember = maxMember;
			this._maxElite = maxElite;
		}
		
		public function get level():int
		{
			return this._level;
		}
		
		public function get needExp():int
		{
			return this._needExp;
		}
		
		public function get maxMember():int
		{
			return this._maxMember;
		}
		
		public function get maxElite():int
		{
			return this._maxElite;
		}
		
		public function get isMaxLevel():Boolean
		{
			if (this._level == PalaceDataFacade.maxPalaceLevel)
			{
				return true;
			}
			return false;
		}
	}
}