package mmo.framework.domain.itemrecycle
{
	public class ItemType
	{
		private var _typeId:int;
		private var _itemId:int;
		
		public function ItemType(typeId:int, itemId:int)
		{
			this._typeId = typeId;
			this._itemId = itemId;
		}

		public function get typeId():int
		{
			return _typeId;
		}

		public function get itemId():int
		{
			return _itemId;
		}


	}
}