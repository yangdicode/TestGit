package mmo.framework.domain.honor
{
	/**
	 * 荣誉定义类
	 * @author liyawei
	 */	
	
	public class Honor
	{
		private var _id:int;
		private var _name:String;
		
		public function Honor(id:int,name:String)
		{
			this._id = id;
			this._name = name;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}
	}
}