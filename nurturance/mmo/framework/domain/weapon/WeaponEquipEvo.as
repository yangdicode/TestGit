package mmo.framework.domain.weapon
{
	public class WeaponEquipEvo
	{
		private var _id:int;
		private var _newId:int;
		private var _needScore:int;
		private var _needProLv:int;
		private var _needItem:Array;
		
		public function WeaponEquipEvo(id:int, newId:int, needScore:int, needProLv:int, needItem:String){
			_id = id;
			_newId = newId;
			_needScore = needScore;
			_needProLv = needProLv;
			_needItem = parseNeedItem(needItem);
		}
		
		private function parseNeedItem(needItems:String):Array{
			if(needItems == ""){
				return [];
			}
			var itemStrs:Array = needItems.split(",");
			var arr:Array = [];
			var eachItems:Array;
			for each(var eachStr:String in itemStrs){
				eachItems = eachStr.split("-");
				arr.push({"type":eachItems[0], "id":eachItems[1], "num":eachItems[2]});
			}
			return arr;
		}

		public function get id():int
		{
			return _id;
		}

		public function get newId():int
		{
			return _newId;
		}

		public function get needScore():int
		{
			return _needScore;
		}

		public function get needProLv():int
		{
			return _needProLv;
		}
		
		/**
		 * 物品数组：例
		 * {"type":1,"id":1,"num":1}
		 */
		public function get needItem():Array
		{
			return _needItem;
		}


	}
}