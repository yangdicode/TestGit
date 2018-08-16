package mmo.framework.domain.rangers.define
{
	import com.adobe.utils.StringUtil;

	public class RangersTaskDefine
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _limit:XML;
		private var _bonus:Array = [];
		
		public function RangersTaskDefine(id:int, name:String, desc:String, limit:XML, bonus:XML){
			_id = id;
			_name = name;
			_desc = desc;
			_limit = limit;
			var list:XMLList = XMLList(bonus.b);
			for each(var e:XML in list){
				if(e.@type == "score"){
					_bonus.push([10085, 2, e.@num]);
				}else if(e.@type == "item"){
					parseItem(e.@items);
				}
			}
		}
		
		private function parseItem(itemStr:String):void{
			var eItemStrList:Array = itemStr.split(",");
			for each(var eItemStr:String in eItemStrList){
				_bonus.push(eItemStr.split("-"));
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

		public function get desc():String
		{
			return _desc;
		}

		public function get limit():XML
		{
			return _limit;
		}

		/**
		 * [[1-1-1],[1-1-1],[1-1-1]]
		 */		
		public function get bonus():Array
		{
			return _bonus;
		}

		
	}
}