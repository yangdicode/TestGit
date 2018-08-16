package mmo.framework.domain.palace
{
	public class PalaceCrown
	{
		private var _id:int;
		private var _clothId:int;
		private var _name:String;
		
		public function PalaceCrown(id:int, clothId:int, name:String)
		{
			this._id = id;
			this._clothId = clothId;
			this._name = name;
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get clothId():int
		{
			return this._clothId;
		}
		
		public function get name():String
		{
			return this._name;
		}
	}
}