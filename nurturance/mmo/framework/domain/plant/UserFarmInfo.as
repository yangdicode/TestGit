package mmo.framework.domain.plant
{
	public class UserFarmInfo
	{
		private var _currExp:int;
		private var _currStarExp:int;
		private var _owner:String;
		
		public function UserFarmInfo(currExp:int, currStarExp:int, owner:String)
		{
			this._currStarExp = currStarExp;
			this._currExp = currExp;
			this._owner = owner;
		}

		public function updateExp(change:int):void {
			this._currExp += change;
		}
		public function updateStarExp(change:int):void {
			this._currStarExp += change;
		}
		
		public function get currExp():int {
			return this._currExp;
		}
		public function get currStarExp():int {
			return this._currStarExp;
		}
		
		public function get currlevel():int {
			return this.levelInfo.level;
		}
		public function get currStarlevel():int {
			return this.starLevelInfo.level;
		}
		
		public function get isMaxLevel():Boolean
		{
			if (this.currlevel >= Plants.getMaxFarmLevel())
			{
				return true;
			}
			return false;
		}
		public function get isMaxStarLevel():Boolean
		{
			if (this.currStarlevel >= Plants.getMaxFarmStarLevel())
			{
				return true;
			}
			return false;
		}
		
		public function get levelInfo():FarmLevel {
			return Plants.getFarmLevelFromExp(this._currExp);
		}
		public function get starLevelInfo():FarmStarLevel {
			return Plants.getFarmStarLevelFromExp(this._currStarExp);
		}
		
		public function get owner():String {
			return this._owner;
		}
	}
}