package mmo.framework.domain.flower
{
	public class UserFlowerInfor
	{
		private var _userName:String;
		private var _charm:int;
		private var _sendFlower:int;
		private var _weeklyCharm:int;
		private var _weeklySend:int;
		private var _buddyInforList:Array;
		
		public var yearFlowerType:int;
		
		public function UserFlowerInfor(userName:String, charm:int, sendFlower:int, weeklyCharm:int, weeklySend:int, buddyInforList:Array)
		{
			_charm = charm;
			_sendFlower = sendFlower;
			_weeklyCharm = weeklyCharm;
			_weeklySend = weeklySend;
			setBuddyInfor(buddyInforList);
		}
		
		private function setBuddyInfor(array:Array):void
		{
			_buddyInforList = new Array();
			for each(var infor:Object in array)
			{
				_buddyInforList.push({"time":infor.time, "buddyName":infor.buddy, "flowerId":infor.fid, "num":infor.num});
			}
		}
		
		public function get charm():int
		{
			return _charm;
		}
		
		public function get sendFlower():int
		{
			return _sendFlower;
		}
		
		public function get weeklyCharm():int
		{
			return _weeklyCharm;
		}
		
		/**
		 * 好友信息:Object类型;
		 * time:送出时间；
		 * buddyName：好友名；
		 * flowerId:花id;
		 * num：数量;
		 */		
		public function get buddyInforList():Array
		{
			return _buddyInforList;
		}

		public function get weeklySend():int
		{
			return _weeklySend;
		}

		
	}
}