package mmo.framework.domain.halos
{
	public class Halo
	{
		private var _id:int;
		private var _name:String;
		private var _goodsId:int;
		private var _last:int;
		private var _hasFrame:Boolean;
		private var _lightId:int;
		private var _memberLimit:Boolean;
		private var _maxNum:int;
		
		public function Halo(id:int, name:String, goodsId:int, last:int, hasFrame:Boolean, lightId:int, memberLimit:Boolean = false, maxNum:int = 0){
			_id = id;
			_name = name;
			_goodsId = goodsId;
			_last = last;
			_hasFrame = hasFrame;
			_lightId = lightId;
			_memberLimit = memberLimit;
			_maxNum = maxNum;
		}
		
		public function get id():int
		{
			return _id;
		}

		public function get lightId():int
		{
			return _lightId;
		}

		public function get name():String
		{
			return _name;
		}

		public function get goodsId():int
		{
			return _goodsId;
		}

		public function get last():int
		{
			return _last;
		}

		public function get hasFrame():Boolean
		{
			return _hasFrame;
		}

		public function get memberLimit():Boolean
		{
			return _memberLimit;
		}

		public function get maxNum():int
		{
			return _maxNum;
		}


	}
}