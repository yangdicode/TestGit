package mmo.framework.domain.plant
{
	public class BuddyInfo
	{
		private var _name:String;
		private var _exp:int;
		private var _isMature:Boolean;
		private var _hasWeed:Boolean;
		private var _hasPest:Boolean;
		
		public function BuddyInfo()
		{
		}
		
		public static function parse(data:Object):BuddyInfo
		{
			var bi:BuddyInfo = new BuddyInfo();	
			bi.parseData(data);
			return bi;
		}
		
		public function parseData(data:Object):void
		{
			this._name = data.name;
			this._exp = data.exp;
			this._hasPest = data.worm;
			this._hasWeed = data.weed;
			this._isMature = data.flower;
		} 
		
		public function get name():String
		{
			return this._name;
		}
		
		public function get exp():int
		{
			return this._exp;
		}
		
		public function get isMature():Boolean
		{
			return this._isMature;
		}
		
		public function get hasPest():Boolean
		{
			return this._hasPest;
		}
		
		public function get hasWeed():Boolean
		{
			return this._hasWeed;
		}
	}
}