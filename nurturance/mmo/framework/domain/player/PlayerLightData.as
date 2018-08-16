package mmo.framework.domain.player
{
	public class PlayerLightData
	{
		private var _id:int;
		private var _type:String;
		private var _params:Object;
		public function PlayerLightData(id:int, type:String, params:Object = null)
		{
			_id = id;
			_type = type;
			_params = (params)?params:{};
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function get params():Object
		{
			return _params;
		}
	}
}