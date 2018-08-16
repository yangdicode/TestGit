package mmo.framework.domain.dreamcard
{
	public class DreamCardUserLv
	{
		private var _lv:int;
		private var _exp:int;
		private var _badge:String;
		
		public function DreamCardUserLv(lv:int, exp:int, badge:String){
			_lv = lv;
			_exp = exp;
			_badge = badge;
		}

		public function get lv():int
		{
			return _lv;
		}

		public function get exp():int
		{
			return _exp;
		}

		public function get badge():String
		{
			return _badge;
		}


	}
}