package mmo.framework.domain.card
{
	public class EquipSuitEffect
	{
		private var _id:int;
		private var _name:String;
		private var _equipSuits:Array = [];
		private var _desc:String;
//		private var _param:String;
		
		public function EquipSuitEffect(id:int, name:String, suits:String, desc:String){
			_id = id;
			_name = name;
			_desc = desc;
			
			var ids:Array = suits.split(",");
			for each(var eId:String in ids){
				_equipSuits.push(int(eId));
			}
		}
		
		public static function get emptyEffect():EquipSuitEffect{
			return new EquipSuitEffect(0, "无", "", "无");
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get equipSuits():Array
		{
			return _equipSuits;
		}

		public function get desc():String
		{
			return _desc;
		}


	}
}