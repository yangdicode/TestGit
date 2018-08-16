package mmo.framework.domain.fairy
{
	public class FairyEnemyAIDefine
	{
		private var _monsterId:int;
		private var _maxHp:int;
		private var _minHp:int;
		private var _dataArr:Array;
		
		public function FairyEnemyAIDefine(monsterId:int, maxHp:int, minHp:int, dataArr:Array)
		{
			_monsterId = monsterId;
			_maxHp = maxHp;
			_minHp = minHp;
			_dataArr = dataArr;
		}

		public function get dataArr():Array
		{
			return _dataArr;
		}

		public function get minHp():int
		{
			return _minHp;
		}

		public function get maxHp():int
		{
			return _maxHp;
		}

		public function get monsterId():int
		{
			return _monsterId;
		}


	}
}