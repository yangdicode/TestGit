package mmo.framework.domain.clothesdesign
{
	public class ClothesDesignSubTaskResult
	{
		private var _subTaskId:int;
		private var _rate:int;
		private var _minScore:int;
		private var _bonusCount:int;
		
		public function ClothesDesignSubTaskResult(subTaskId:int, rate:int, minScore:int, bonusCount:int){
			_subTaskId = subTaskId;
			_rate = rate;
			_minScore = minScore;
			_bonusCount = bonusCount;
		}
		
		public function get subTaskId():int
		{
			return _subTaskId;
		}

		public function get rate():int
		{
			return _rate;
		}

		public function get minScore():int
		{
			return _minScore;
		}

		public function get bonusCount():int
		{
			return _bonusCount;
		}


	}
}