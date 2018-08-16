package mmo.framework.domain.collegeprofession
{
	public class CollegeProfessionLvDefine
	{
		private var _id:int;
		private var _lv:int;
		private var _limitExp:int;
		
		public function CollegeProfessionLvDefine(id:int,lv:int,limitExp:int)
		{
			_id = id;
			_lv = lv;
			_limitExp = limitExp;
		}
		
		
		public function get id():int
		{
			return _id;
		}

		public function get lv():int
		{
			return _lv;
		}

		public function get limitExp():int
		{
			return _limitExp;
		}


	}
}