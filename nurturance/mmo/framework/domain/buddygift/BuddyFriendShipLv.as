package mmo.framework.domain.buddygift
{
	public class BuddyFriendShipLv
	{
		private var _lv:int;
		private var _min:int;
		private var _des:String;
		
		public function BuddyFriendShipLv(info:Array)
		{
			_lv = info[0];
			_min = info[1];
			_des = info[2];
		}

		public function get lv():int
		{
			return _lv;
		}

		public function get min():int
		{
			return _min;
		}

		public function get des():String
		{
			return _des;
		}


	}
}