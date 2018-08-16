package mmo.framework.domain.halos
{
	public class UserHaloDefine
	{
		private var _id:int;
		private var _haloLightInfo:HaloLightInfo;
		private var _putOnDate:Number;
		private var _buyDate:Number;
		
		public function UserHaloDefine(id:int, haloBaseId:int, colorId:int = 1, frameAId:int = 0, frameBId:int = 0, endDate:Number = 0, putOnDate:Number = 0, buyDate:Number = 0 )
		{
			_id = id;
			_putOnDate = putOnDate;
			_buyDate = buyDate;
			_haloLightInfo = new HaloLightInfo(haloBaseId,colorId,frameAId,frameBId,endDate);
		}
		
		public function get id():int
		{
			return _id;
		}

		public function get haloLightInfo():HaloLightInfo
		{
			return _haloLightInfo;
		}

		public function get putOnDate():Number
		{
			return _putOnDate;
		}

		public function get buyDate():Number
		{
			return _buyDate;
		}


	}
}