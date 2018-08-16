package mmo.framework.domain.halos
{
	public class HaloColor
	{
		private var _id:int;
		private var _name:String;
		private var _goodsId:int;
		private var _limit:Array;
		private var _except:Array;
		
		public function HaloColor(id:int, name:String, goodsId:int, halosLimits:String = "", excpetHalo:String = ""){
			_id = id;
			_name = name;
			_goodsId = goodsId;
			_limit = halosLimits.split(",");
			_except = excpetHalo.split(",");
			_except.push(1);
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get goodsId():int
		{
			return _goodsId;
		}

		public function get limit():Array
		{
			return _limit;
		}

		public function get except():Array
		{
			return _except;
		}


	}
}