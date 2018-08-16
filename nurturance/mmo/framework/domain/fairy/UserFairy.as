package mmo.framework.domain.fairy
{
	public class UserFairy
	{
		private var _userFairyId:Number;
		private var _fairyId:int;
		private var _currExp:int;
		private var _mainSkillLevel:int;
		
		private var _awakenCount:int;
		private var _extraAttack:int;
		private var _extraRecover:int;
		private var _extraHp:int;
		
		public function UserFairy()
		{
		}
		
		public static function parse(data:Object):UserFairy
		{
			var userFairy:UserFairy = new UserFairy();	
			userFairy.parseData(data);
			return userFairy;
		}
		
		public function parseData(data:Object):void
		{
			this._userFairyId = data.ufid;
			this._fairyId = data.fid;
			this._currExp = data.exp;
			this._mainSkillLevel = data.mslv;
			
			this._awakenCount = data.awc;
			this._extraAttack = data.ea;
			this._extraRecover = data.er;
			this._extraHp = data.eh;
		}
		
		public function get userFairyId():Number
		{
			return this._userFairyId;
		}
		
		public function get fairyId():int
		{
			return this._fairyId;
		}
		
		public function get fairyType():int
		{
			return this.fairy.type;
		}
		
		public function get fairy():Fairy
		{
			return Fairys.getFairyById(this._fairyId);
		}
		
		public function get currExp():int
		{
			return this._currExp;
		}
		public function set currExp(value:int):void
		{
			this._currExp = value;
		}
		
		public function get fairyLevel():FairyLevel
		{
			return Fairys.getFairyLevelFromExp(this._fairyId, this._currExp);
		}
		
		public function get currLevel():int
		{
			return this.fairyLevel.level;
		}
		
		public function get starLevel():int
		{
			return this.fairy.starLevel;
		}
		
		public function get mainSkillLevel():FairyMainSkillLevel
		{
			return Fairys.getFairyMainSkillByLevel(this.fairy.mainSkillId, this._mainSkillLevel);
		}
		
		public function get maxMainSkillLevel():FairyMainSkillLevel
		{
			return Fairys.getFairyMainSkillMaxLevel(this.fairy.mainSkillId);
		}
		
		public function get mainSkillIsMax():Boolean
		{
			var levelInfo:FairyMainSkillLevel = Fairys.getFairyMainSkillMaxLevel(this.fairy.mainSkillId);
			if (levelInfo == null)
			{
				return true;
			}
			if (levelInfo.level == this._mainSkillLevel)
			{
				return true;
			}
			return false;
		}
		
		public function get mainSkill():FairyMainSkill
		{
			return this.fairy.mainSkill;
		}
		
		public function get leaderSkill():FairyLeaderSkill
		{
			return this.fairy.leaderSkill;
		}
		
		public function get isFullLevel():Boolean
		{
			if (this.currLevel == this.fairy.maxLevel)
			{
				return true;
			}
			return false;
		}
		
		public function get awakenCount():int
		{
			return this._awakenCount;
		}
		
		public function get extraAttack():int
		{
			return this._extraAttack;
		}
		public function get extraRecover():int
		{
			return this._extraRecover;
		}
		public function get extraHp():int
		{
			return this._extraHp;
		}
		
		public function get currAttack():int
		{
			return this.fairyLevel.attack + this._extraAttack;
		}
		public function get currRecover():int
		{
			return this.fairyLevel.recover + this._extraRecover;
		}
		public function get currHp():int
		{
			return this.fairyLevel.hp + this._extraHp;
		}
		
		public function clone():UserFairy
		{
			var data:Object = {"ufid":this._userFairyId, "fid":this._fairyId, "exp":this._currExp, "mslv":this._mainSkillLevel, "awc":this._awakenCount, "ea":this._extraAttack, "er":this._extraRecover, "eh":this._extraHp};
			return UserFairy.parse(data);
		}
	}
}