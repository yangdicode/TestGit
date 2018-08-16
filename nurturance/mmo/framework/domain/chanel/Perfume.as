package mmo.framework.domain.chanel
{
	public class Perfume
	{
		private var _id:int;
		private var _gitemId:int;
		private var _name:String;
		private var _last:int;
		private var _lightId:int;
		
		public function Perfume(id:int, gitemId:int, name:String, last:int, lightId:int){
			_id = id;
			_gitemId = gitemId;
			_name = name;
			_last = last * 60;
			_lightId = lightId;
		}

		public function get id():int
		{
			return _id;
		}

		public function get last():int
		{
			return _last;
		}

		public function get lightId():int
		{
			return _lightId;
		}

		public function get gitemId():int
		{
			return _gitemId;
		}

		public function get name():String
		{
			return _name;
		}


	}
}