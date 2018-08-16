package mmo.framework.domain.plant
{
	public class GardenInfo
	{
		private var _owner:String;
		private var _roomName:String;
		
		public function GardenInfo(owner:String)
		{
			this._owner = owner;
		}
		
		public function get owner():String
		{
			return this._owner;
		}
		
		public function get roomName():String
		{
			return this._roomName;
		}
		
		public function set roomName(value:String):void
		{
			this._roomName = value;
		}
	}
}