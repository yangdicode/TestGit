package mmo.framework.domain.plant
{
	public class UserFlowerpot
	{
		private var _locationId:int;
		private var _flowerpotId:int;
		private var _remainCount:int;
		private var _usable:Boolean;
		
		public function UserFlowerpot()
		{
		}
		
		public static function parse(data:Object):UserFlowerpot{
			var userFlowerpot:UserFlowerpot = new UserFlowerpot();	
			userFlowerpot.parseData(data);
			return userFlowerpot;
		}
		
		public function parseData(data:Object):void{
			this._locationId = data.fpid;
			this._remainCount = data.rc;
			this._flowerpotId = 0;
			this._usable = data.usable;
		}
		
		/**
		 * 花盆的位置id
		 * @return 
		 */
		public function get locationId():int
		{
			return this._locationId;
		}
		
		/**
		 * 花盆id （和plantitem的id对应）
		 * @return 
		 */
		public function get flowerpotId():int
		{
			return this._flowerpotId;
		}
		
		/**
		 * 花盆是否可用
		 * @return 
		 */
		public function get usable():Boolean
		{
			return this._usable;
		}
		
		/**
		 * 开放花盆
		 * @return 
		 */
		public function openPot():void
		{
			this._usable = true;
		}
		
		/**
		 * 花盆还可以种多少次
		 * @return 
		 */
		public function get remainCount():int
		{
			return this._remainCount;
		}
		
		public function set remainCount(value:int):void
		{
			if (value < 0)
			{
				value = 0;
			}
			this._remainCount = value;
		}
	}
}