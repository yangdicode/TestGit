package mmo.framework.domain.voucher
{
	public class ActivityVoucherDefine
	{
		private var _id:int;
		private var _name:String;
		private var _value:int;
		private var _endDate:String;
		
		public function ActivityVoucherDefine( id:int, name:String, value:int, endDate:String)
		{
			_id = id;
			_name = name;
			_value = value;
			_endDate = endDate;
		}
						
		public function get id():int
		{
			return _id;
		}

		public function get itemId():int
		{
			return _id;
		}
		
		public function get itemNum():int
		{
			return 1;
		}

		public function get name():String
		{
			return _name;
		}

		public function get value():int
		{
			return _value;
		}

		public function get endDate():String
		{
			return _endDate;
		}


	}
}