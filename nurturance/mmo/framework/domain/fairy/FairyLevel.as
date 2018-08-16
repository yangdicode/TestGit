package mmo.framework.domain.fairy
{
	public class FairyLevel
	{
		private var _id:int;
		private var _level:int;
		private var _attack:int;
		private var _recover:int;
		private var _hp:int;
		private var _needExp:int;
		private var _affordExp:int;
		
		public function FairyLevel(id:int, level:int, attack:int, recover:int, hp:int, needExp:int, affordExp:int)
		{
			this._id = id;
			this._level = level;
			this._attack = attack;
			this._recover = recover;
			this._hp = hp;
			this._needExp = needExp;
			this._affordExp = affordExp;
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get level():int
		{
			return this._level;
		}
		
		public function get attack():int
		{
			return this._attack;
		}
		
		public function get recover():int
		{
			return this._recover;
		}
		
		public function get hp():int
		{
			return this._hp;
		}
		
		public function get needExp():int
		{
			return this._needExp;
		}
		
		public function get affordExp():int
		{
			return this._affordExp;
		}
	}
}