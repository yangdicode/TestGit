package mmo.framework.domain.plant
{
	public class GBarMainInfo
	{
		private var _currPage:int;
		private var _buddyInfos:Array;
		
		public function GBarMainInfo()
		{
			this._currPage = 0;
			this._buddyInfos = [];
		}
		
		public function get currPage():int
		{
			return this._currPage;
		}
		
		public function set currPage(value:int):void
		{
			this._currPage = value;
		}
		
		public function get currBuddyInfos():Array
		{
			return this._buddyInfos;
		}
		
		public function set currBuddyInfos(value:Array):void
		{
			this._buddyInfos = value;
		}
	}
}