package mmo.framework.domain.monster
{
	public class WildMonster
	{
		private var _id:int;
		private var _lv:int;
		
		public function WildMonster(id:int, lv:int)
		{
			_id = id;
			_lv = lv;
		}

		public function get id():int
		{
			return _id;
		}

		public function get lv():int
		{
			return _lv;
		}
	}
}