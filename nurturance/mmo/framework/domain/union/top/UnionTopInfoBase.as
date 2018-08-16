package mmo.framework.domain.union.top
{
	import mmo.framework.domain.top.ITopInfo;

	public class UnionTopInfoBase implements ITopInfo
	{
		private var _ranking:int;
		private var _name:String;
		private var _score:Number;
		
		public function UnionTopInfoBase(rank:int, name:String, value:Number)
		{
			_ranking = rank;
			_name = name;
			_score = value;
		}
		
		public function get ranking():int
		{
			return _ranking;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get score():Number
		{
			return _score;
		}
	}
}