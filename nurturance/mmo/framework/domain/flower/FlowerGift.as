package mmo.framework.domain.flower
{

	public class FlowerGift
	{
		private var _id:int;
		private var _name:String;
		private var _need:int;
		private var _score:int;
		private var _sGold:int;
		private var _bonusArray:Array;
		
		public function FlowerGift(id:int, name:String, need:int, score:int, sGold:int, bonusXML:XML)
		{
			_id = id;
			_name = name;
			_need = need;
			_score = score;
			_sGold = sGold;
			initBonusItem(bonusXML);
		}
		
		private function initBonusItem(xml:XML):void
		{
			_bonusArray = new Array();
			var items:String = xml.@items;
			var itemArr:Array = items.split(",");
			for each(var itemStr:String in itemArr)
			{
				var itemStrs:Array = itemStr.split("-");
				var type:int = itemStrs[0];
				var id:int = itemStrs[1];
				var num:int = itemStrs[2];
				_bonusArray.push({"type":type, "id":id, "num":num});
			}
		}
		
		public function get id():int
		{
			return _id;
		}
		
		public function get name():String
		{
			return _name;
		}
		
		public function get need():int
		{
			return _need;
		}
		
		public function get score():int
		{
			return _score;
		}
		
		public function get sGold():int
		{
			return _sGold;
		}
		
		/**
		 * @return type:物品类型;id:物品标识;num:物品数量;
		 */		
		public function get itemBonus():Array
		{
			return _bonusArray;
		}
		
	}
}