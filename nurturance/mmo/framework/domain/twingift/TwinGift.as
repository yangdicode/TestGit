package mmo.framework.domain.twingift
{
	public class TwinGift
	{
		private var _id:int;
		private var _name:String;
		private var _des:String;
		private var _friendShip:int;
		private var _price:int;
		private var _type:int;
		
		public function TwinGift(info:Array)
		{
			_id = info[0];
			_name = info[1];
			_des = info[2];
			_friendShip = info[3];
			_price = info[4];
			_type = info[5];
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get des():String
		{
			return _des;
		}
		
		public function get isVipGift():Boolean
		{
			return _type == 1;
		}

		public function get friendShip():int
		{
			return _friendShip;
		}

		public function get price():int
		{
			return _price;
		}
		
		
	}
}