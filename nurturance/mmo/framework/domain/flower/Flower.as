package mmo.framework.domain.flower
{
	public class Flower
	{
		
		private var _id:int;
		private var _name:String;
		private var _meaning:String;
		private var _price:int;
		private var _isScore:int;
		private var _charm:int;
		private var _level:int;
		private var _isOnly:Boolean;
		
		public function Flower(id:int, name:String, meaning:String, price:int, isScore:int, 
							   charm:int, level:int, only:int)
		{
			_id = id;
			_name = name;
			_meaning = meaning;
			_price = price;
			_isScore = isScore;
			_charm = charm;
			_level = level;
			_isOnly = only == 1;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		/**
		 * 名称
		 */		
		public function get name():String
		{
			return _name;
		}
		
		/**
		 * 寓意
		 */		
		public function get meaning():String
		{
			return _meaning;
		}
		
		/**
		 * 价格
		 */		
		public function get price():int
		{
			return _price;
		}
		
		/**
		 * 计价单位是否金币：1为金币；0为羽币。
		 */		
		public function get isSocre():Boolean
		{
			return _isScore == 1;
		}
		
		/**
		 * 魅力值
		 */		
		public function get charm():int
		{
			return _charm;
		}
		
		/**
		 * 等级
		 */		
		public function get level():int
		{
			return _level;
		}

		public function get isOnly():Boolean
		{
			return _isOnly;
		}

		
	}
}