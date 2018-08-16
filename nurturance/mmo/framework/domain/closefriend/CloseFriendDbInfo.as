package mmo.framework.domain.closefriend
{
	import mmo.common.DateUtil;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;

	public class CloseFriendDbInfo
	{
		private var _id:int;
		private var _un0:String;
		private var _un1:String;
		private var _combineTime:Date;
		private var _signTimes:int;
		private var _oath:int;
		private var _historyOath:int;
		
		public function CloseFriendDbInfo(info:Object)
		{
			_id = info["id"];
			_un0 = info["un0"];
			_un1 = info["un1"];
			_combineTime = new Date(info["ct"]);
			_signTimes = info["si"];
			_oath = info["ov"];
			_historyOath = info["hov"];
		}
		
		public static function generateNewInfo(id:int, name:String):CloseFriendDbInfo{
			var obj:Object = {};
			obj["id"] = id;
			obj["un0"] = UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName;
			obj["un1"] = name;
			obj["ct"] = DateUtil.getServerTime().time;
			obj["si"] = 0;
			obj["ov"] = 0;
			obj["hov"] = 0;
			return new CloseFriendDbInfo(obj);
		}

		public function get id():int
		{
			return _id;
		}

		public function get un0():String
		{
			return _un0;
		}

		public function get un1():String
		{
			return _un1;
		}

		public function get combineTime():Date
		{
			return _combineTime;
		}

		public function get signTimes():int
		{
			return _signTimes;
		}

		public function get oath():int
		{
			return _oath;
		}
		
		public function get historyOath():int{
			return _historyOath;
		}


	}
}