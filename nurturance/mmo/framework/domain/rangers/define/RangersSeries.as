package mmo.framework.domain.rangers.define
{
	public class RangersSeries
	{
		private var _id:int;
		private var _name:String;
		private var _rangers:Array;
		private var _bonus:Array;
		
		public function RangersSeries(id:int, name:String, rangers:String, bonus:XML){
			_id = id;
			_name = name;
			_rangers = rangers.split(",");
			if(bonus.@type == "score"){
				_bonus = [10085, 2, bonus.@num];
			}else if(bonus.@type == "item"){
				var itemStr:String = bonus.@items;
				_bonus = itemStr.split("-");
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

		public function get rangers():Array
		{
			return _rangers;
		}

		/**
		 * [type, id, num]
		 */		
		public function get bonus():Array
		{
			return _bonus;
		}
		
	}
}