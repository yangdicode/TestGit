package mmo.framework.domain.fairy
{
	public class FairyTimeLimitedFbDefine
	{
		private var _fbId:int;
		private var _buyMinute:int;
		private var _score:int;
		private var _yubei:int;
		
		public function FairyTimeLimitedFbDefine(fbId:int, buyMinute:int, score:int, yubei:int){
			_fbId = fbId;
			_buyMinute = buyMinute;
			_score = score;
			_yubei = yubei;
		}

		public function get fbId():int
		{
			return _fbId;
		}

		public function get buyMinute():int
		{
			return _buyMinute;
		}

		public function get score():int
		{
			return _score;
		}

		public function get yubei():int
		{
			return _yubei;
		}


	}
}