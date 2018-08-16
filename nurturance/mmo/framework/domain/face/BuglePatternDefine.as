package mmo.framework.domain.face
{
	public class BuglePatternDefine
	{
		private var _id:int;
		private var _type:int;
		private var _goodId:int;
		private var _patternName:String;
		
		/**
		 * 好像名字没什么用，从goods拿吧
		 * type 0普通 1炫动
		 */
		public function BuglePatternDefine(id:int, type:int, goodId:int, patternName:String="")
		{
			_id = id;
			_type = type;
			_goodId = goodId;
			_patternName = patternName
		}

		public function get id():int
		{
			return _id;
		}

		public function get goodId():int
		{
			return _goodId;
		}

		public function get type():int
		{
			return _type;
		}

		public function get patternName():String
		{
			return _patternName;
		}
		
		


	}
}