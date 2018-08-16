package mmo.framework.domain.monster
{
	public class Monster
	{
		private var _id:int;
		private var _name:String;
		private var _proName:String;
		private var _proLv:int;
		private var _lv:int;
		public function Monster(id:int, name:String, proName:String, lv:int, proLv:int)
		{
			_id = id;
			_name = name;
			_proName = proName;
			_proLv = proLv;
			_lv = lv;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}
		
		public function get proName():String
		{
			return _proName;
		}
		
		public function get proLv():int
		{
			return _proLv;
		}
		
		public function get lv():int
		{
			return _lv;
		}
	}
}