package mmo.framework.domain.fairy
{
	public class FairyEvolve
	{
		private var _targetId:int;
		private var _originId:int;
		private var _costGold:int;
		private var _needStuffs:Array;
		
		public function FairyEvolve(targetId:int, originId:int, costGold:int, needStuffs:Array)
		{
			this._targetId = targetId;
			this._originId = originId;
			this._costGold = costGold;
			this._needStuffs = needStuffs;
		}
		
		public function get targetId():int
		{
			return this._targetId;
		}
		
		public function get originId():int
		{
			return this._originId;
		}
		
		public function get costGold():int
		{
			return this._costGold;
		}
		
		public function get needStuffs():Array
		{
			return this._needStuffs;
		}
	}
}