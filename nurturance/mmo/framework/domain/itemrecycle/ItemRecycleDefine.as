package mmo.framework.domain.itemrecycle
{
	public class ItemRecycleDefine
	{
		private var _id:int;
		private var _itemType:ItemType;
		private var _score:int;
		
		public function ItemRecycleDefine(id:int, typeId:int, itemId:int, score:int)
		{
			this._id = id;
			this._itemType = new ItemType(typeId, itemId);
			this._score = score;
		}

		public function get id():int
		{
			return _id;
		}

		public function get itemType():ItemType
		{
			return _itemType;
		}

		public function get score():int
		{
			return _score;
		}

	}
}