package mmo.framework.domain.closefriend
{
	import com.adobe.utils.StringUtil;
	
	import flash.events.EventDispatcher;
	
	import mmo.common.DateUtil;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;

	public class CloseFriendInfo extends EventDispatcher
	{
		private const CanInviteDis:Number = 24 * 60 * 60 * 1000;
		
		private var _dbInfo:CloseFriendDbInfo;
		private var _closeFriend:String;
		
		private var _brokeTime:Number;
		
		public function CloseFriendInfo()
		{
		}
		
		public function initInfo(callBack:Function):void{
			
			SocketClient.instance.sendXtMsgAndCallBack(20, "20_1_3", onGetBaseInfo, {"un":userName});
			
		function onGetBaseInfo(ret:Object):void{
				if(ret.hasOwnProperty("info")){
					var info:Object = ret["info"];
				_dbInfo = new CloseFriendDbInfo(info);
					_closeFriend = (_dbInfo.un0 == userName) ? _dbInfo.un1:_dbInfo.un0;
					callBack.apply();
				}
				else{
					SocketClient.instance.sendXtMsgAndCallBack(20, "20_1_17", onGetBreakTime, {"un":userName});
				}
			}
			
			function onGetBreakTime(ret:Object):void{
				_brokeTime = ret.self;
				callBack.apply();
		}
			
		//	callBack.apply();
			
		}
		
		public function setInfo(id:int, name:String):void{
			_closeFriend = name;
			_dbInfo = CloseFriendDbInfo.generateNewInfo(id, name);
			this.dispatchEvent(new CloseFriendEvent(CloseFriendEvent.MakeFriend));
		}
		
		public function breakRelationship():void{
			_closeFriend = "";
			_dbInfo = null;
			_brokeTime = DateUtil.getServerTime().time;
			this.dispatchEvent(new CloseFriendEvent(CloseFriendEvent.BreakFriend));
		}
		
		public function get hasCloseFriend():Boolean{
			return !StringUtil.isEmpty(_closeFriend);
		}
		
		/**
		 * 密友id
		 */
		public function get id():int{
			return (_dbInfo == null) ? 0:_dbInfo.id;
		}
		
		/**
		 * 誓言值
		 */
		public function get oath():int{
			return (_dbInfo == null) ? 0:_dbInfo.oath;
		}
		
		/**
		 * 没有为空
		 */
		public function get closeFriend():String{
			return _closeFriend;
		}
		
		public function get combineDate():Date{
			return (_dbInfo == null) ? null:_dbInfo.combineTime;
		}
		
		public function get canInviteFriend():Boolean{
			var disTime:Number = DateUtil.getServerTime().time - _brokeTime;
			return (disTime >= CanInviteDis);
		}

		/**
		 * 累积签到次数
		 */
		public function get signTime():int
		{
			return (_dbInfo == null) ? 0:_dbInfo.signTimes;
		}
		
		public function get dbInfo():CloseFriendDbInfo{
			return _dbInfo;
		}
		
		private function get userName():String{
			return UserInfo(MainModelLocator.instance.retrieveModel(UserInfo)).userName;
		}

		
	}
}