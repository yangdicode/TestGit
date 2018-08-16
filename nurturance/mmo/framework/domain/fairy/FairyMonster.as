package mmo.framework.domain.fairy
{
	public class FairyMonster
	{
		private var _id:int;
		private var _name:String;	
		private var _type:String;
		private var _atk:int;
		private var _hp:int;
		private var _def:int;
		private var _cd:int;
		private var _gold:int;
		private var _lockcd:int;
		
		public function FairyMonster(id:int, name:String, type:String, hp:int, atk:int, def:int, cd:int, gold:int, lockcd:int)
		{
			_id = id;
			_name = name;
			_type = type;
			_atk = atk;
			_def = def;
			_hp = hp;
			_cd = cd;
			_gold = gold;
			_lockcd = lockcd;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get type():int
		{
			return FairysType.getFairyTypeByTypeName(_type);
		}
		
		public function get atk():int
		{
			return _atk;
		}
		
		public function get hp():int
		{
			return _hp;
		}
		
		public function get def():int
		{
			return _def;
		}
		
		public function get cd():int
		{
			return _cd;
		}
		
		public function get gold():int
		{
			return _gold;
		}
		
		public function get loadcd():Boolean
		{
			if(_lockcd == 0)
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	}
}