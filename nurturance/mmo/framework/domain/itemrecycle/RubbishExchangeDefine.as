package mmo.framework.domain.itemrecycle
{
	public class RubbishExchangeDefine
	{
		private var _id:int;
		private var _score:int;
		private var _itemType:ItemType;
		
		public function RubbishExchangeDefine(id:int, score:int, items:String)
		{
			this._id = id;
			this._score = score;
			this._itemType = parseItemType(items);
		}
		
		private function parseItemType(items:String):ItemType
		{
			var itemStr:Array = items.split("-");
			return new ItemType(itemStr[0], itemStr[1]);
		}

		public function get id():int
		{
			return _id;
		}

		public function get score():int
		{
			return _score;
		}

		public function get itemType():ItemType
		{
			return _itemType;
		}
		
	}
}