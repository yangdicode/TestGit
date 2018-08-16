package mmo.framework.domain.profession
{
	public class ProfessionBase
	{
		private var _id:int;
		private var _name:String;
		private var _des:String;
		private var _backGroundStory:String;
		private var _isVip:Boolean;
		
		private var _phyAttRate:Number;
		private var _magAttRate:Number;
		private var _extAttRate:Number;
		private var _initWeapon:int;
		
		private var _phyAttLv:int;
		private var _magAttLv:int;
		private var _lifeLv:int;
		private var _phyDefLv:int;
		private var _magDefLv:int;
		private var _speedLv:int;
		
		public function ProfessionBase(id:int, name:String, desc:String, bgDesc:String, isVip:int, 
									   phyAttRate:int, magAttRate:int, extAttRate:int, initWeapon:int, 
									   phyAttLv:int, magAttLv:int, lifeLv:int, phyDefLv:int, magDefLv:int, speedLv:int)
		{
			_id = id;
			_name = name;
			_des = desc;
			_backGroundStory = bgDesc;
			_isVip = isVip == 1;
			_phyAttRate = phyAttRate / 100;
			_magAttRate = magAttRate / 100;
			_extAttRate = extAttRate / 100;
			_initWeapon = initWeapon;
			_phyAttLv = phyAttLv;
			_magAttLv = magAttLv;
			_lifeLv = lifeLv;
			_phyDefLv = phyDefLv;
			_magDefLv = magDefLv;
			_speedLv = speedLv;
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

		public function get backGroundStory():String
		{
			return _backGroundStory;
		}

		public function get isVip():Boolean
		{
			return _isVip;
		}

		public function get phyAttRate():Number
		{
			return _phyAttRate;
		}

		public function get magAttRate():Number
		{
			return _magAttRate;
		}

		public function get extAttRate():Number
		{
			return _extAttRate;
		}

		public function get initWeapon():int
		{
			return _initWeapon;
		}

		public function get phyAttLv():int
		{
			return _phyAttLv;
		}

		public function get magAttLv():int
		{
			return _magAttLv;
		}

		public function get lifeLv():int
		{
			return _lifeLv;
		}

		public function get phyDefLv():int
		{
			return _phyDefLv;
		}

		public function get magDefLv():int
		{
			return _magDefLv;
		}

		public function set magDefLv(value:int):void
		{
			_magDefLv = value;
		}

		public function get speedLv():int
		{
			return _speedLv;
		}


	}
}