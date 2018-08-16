package mmo.framework.domain.union.define
{
	public class UnionHonor
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _tempName:String;
		private var _type:int;
		
		public function UnionHonor(id:int, name:String, desc:String, tempName:String, type:int){
			_id = id;
			_name = name;
			_desc = desc;
			_tempName = tempName;
			_type = type;
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

		public function get tempName():String
		{
			return _tempName;
		}

		public function get type():int
		{
			return _type;
		}


	}
}