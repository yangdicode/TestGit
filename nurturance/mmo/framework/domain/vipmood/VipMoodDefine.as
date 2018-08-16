package mmo.framework.domain.vipmood
{
	public class VipMoodDefine
	{
		private var _id:int;
		private var _isVip:Boolean;
		private var _isYearVip:Boolean;
		private var _lightId:int;
		public function VipMoodDefine(id:int, lightId:int, isVip:Boolean=true, isYearVip:Boolean=false)
		{
			_id = id;
			_isVip = isVip;
			_isYearVip = isYearVip;
			_lightId = lightId;
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get isVip():Boolean
		{
			return _isVip;
		}
		
		public function get isYearVip():Boolean
		{
			return _isYearVip;
		}

		public function get lightId():int
		{
			return _lightId;
		}

		
	}
}