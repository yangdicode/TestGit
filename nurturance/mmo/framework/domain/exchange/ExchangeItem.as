package mmo.framework.domain.exchange
{
	public class ExchangeItem
	{
		private var _type:int;
		private var _id:int;
		private var _num:int;
		
		/**
		 * bonus和demand都称为item，不分开两个了。
		 */		
		public function ExchangeItem(type:int, id:int, num:int)
		{
			_type = type;
			_id = id;
			_num = num;
		}
		
		public static function parseString(itemStr:String):ExchangeItem{
			var arr:Array = itemStr.split("-");
			return new ExchangeItem(arr[0], arr[1], arr[2]);
		}
		
		public function get num():int
		{
			return _num;
		}

		public function get id():int
		{
			return _id;
		}

		public function get type():int
		{
			return _type;
		}

	}
}