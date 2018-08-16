package mmo.framework.domain.login
{
	
	public class LoginLocalInfo
	{
		private var _userName:String;
		private var _duoduoId:int;
		private var _zone:String;
		private var _room:String;
		private var _handleType:int;
		private var _info:Object;
		
		public function LoginLocalInfo(userName:String, duoduoId:int, zone:String, room:String, handleType:int, info:Object=null)
		{
			_userName = userName;
			_duoduoId = duoduoId;
			_zone = zone;
			_room = room;
			_handleType = handleType;
			_info = info;
		}
		
		public static function objToInfo(info:Object):LoginLocalInfo{
			
			return new LoginLocalInfo(info["name"], info["duoduo"], info["zone"], 
				info["room"], info["handleType"], info["info"]);
		}
		
		public function toObject():Object{
			var obj:Object = {};
			obj["name"] = _userName;
			obj["duoduo"] = _duoduoId;
			obj["zone"] = _zone;
			obj["room"] = _room;
			obj["handleType"] = _handleType;
			obj["info"] = _info;
			return obj;
		}

		public function get userName():String
		{
			return _userName;
		}
		
		public function get duoduoId():int{
			return _duoduoId;
		}

		public function get zone():String
		{
			return _zone;
		}

		public function get room():String
		{
			return _room;
		}

		public function get handleType():int
		{
			return _handleType;
		}

		public function get info():Object
		{
			return _info;
		}

		
	}
}