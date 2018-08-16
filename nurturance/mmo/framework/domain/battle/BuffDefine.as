package mmo.framework.domain.battle
{
	public class BuffDefine
	{
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _type:String;
		private var _visible:Boolean;
		public function BuffDefine(id:int, name:String, desc:String, type:String, visible:int = 1)
		{
			_id = id;
			_name = name;
			_desc = desc;
			_type = type;
			_visible = visible > 0;
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
		
		public function get type():String
		{
			return _type;
		}

		public function get visible():Boolean
		{
			return _visible;
		}

	}
}