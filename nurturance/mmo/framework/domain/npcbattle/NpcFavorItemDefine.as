package mmo.framework.domain.npcbattle
{
	public class NpcFavorItemDefine
	{
		var _itemId:int;
		var _itemName:String;
		var _itemType:String;
		var _itemFavor:int;
		
		public function NpcFavorItemDefine(itemId:int,itemName:String,itemType:String,itemFavor:int)
		{
			_itemId = itemId;
			_itemName = itemName;
			_itemType = itemType;
			_itemFavor = itemFavor;
		}
		
		public function get id():int
		{
			return _itemId;
		}
		
		public function get name():String
		{
			return _itemName;
		}
		
		public function get type():String
		{
			return _itemType;
		}
		
		public function get favor():int
		{
			return _itemFavor;
		}
		
	}
}