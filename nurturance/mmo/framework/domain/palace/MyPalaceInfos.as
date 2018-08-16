package mmo.framework.domain.palace
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;

	public class MyPalaceInfos
	{
		private var _master:UserPalaceInfo;
		private var _member:UserPalaceInfo;
		private var _masterChat:UserPalaceChat;
		private var _memberChat:UserPalaceChat;
		
		public function MyPalaceInfos()
		{
			this._masterChat = new UserPalaceChat();
			this._memberChat = new UserPalaceChat();
			SocketClient.instance.addEventListener(PalaceClient.onUpdateUserJoinPalace, onUpdateUserJoinPalace);
			SocketClient.instance.addEventListener(PalaceClient.onUpdatePalaceChatMsg, onUpdatePalaceChatMsg);
		}
		
		public function getUserPalaceIdentitys(callback:Function):void
		{
			PalaceClient.sendXtMessage(PalaceClient.onGetMyPalaceInfos, function(param:Object):void{
				initMyPalaceIdentitys(param.infos);
				callback.apply();
			});
		}
		
		public function get isJoined():Boolean
		{
			return isMaster || isMember;
		}
		
		public function get isMaster():Boolean
		{
			return this._master.isUsable;
		}
		
		public function get isMember():Boolean
		{
			return this._member.isUsable;
		}
		
		public function get master():UserPalaceInfo
		{
			return this._master;
		}
		
		public function get member():UserPalaceInfo
		{
			return this._member;
		}
		
		public function get masterMsgs():UserPalaceChat
		{
			return this._masterChat;
		}
		
		public function resetMasterMsgs():void
		{
			this._masterChat.resetNewCount();
			PalaceEventDispatcher.instance.dispatchEvent(new PalaceEvent(PalaceEvent.onRefreshChatNewMsgCount, {"pid":this.master.id}));
		}
		public function resetMemberMsgs():void
		{
			this._memberChat.resetNewCount();
			PalaceEventDispatcher.instance.dispatchEvent(new PalaceEvent(PalaceEvent.onRefreshChatNewMsgCount, {"pid":this.member.id}));
		}
		
		public function get memberMsgs():UserPalaceChat
		{
			return this._memberChat;
		}
		
		private function initMyPalaceIdentitys(infos):void
		{
			for each(var info:Object in infos)
			{
				var temp:UserPalaceInfo = new UserPalaceInfo(info);
				if (temp.identity == PalaceIdentityTypes.Master)
				{
					this._master = temp;
				}
				else
				{
					this._member = temp;
				}
			}
		}
		
		private function onUpdatePalaceChatMsg(evt:SocketClientEvent):void
		{
			var palaceId:int = evt.params.pid;
			var msg:UserPalaceChatMsg = new UserPalaceChatMsg(evt.params.cer, evt.params.cnt);
			if (palaceId == this.master.id)
			{
				this._masterChat.addNewMsg(msg);
			}
			else
			{
				this._memberChat.addNewMsg(msg);
			}
			PalaceEventDispatcher.instance.dispatchEvent(new PalaceEvent(PalaceEvent.onUpdateChatMsg, {"pid":palaceId, "msg":msg}));
			PalaceEventDispatcher.instance.dispatchEvent(new PalaceEvent(PalaceEvent.onRefreshChatNewMsgCount, {"pid":palaceId}));
		}
		
		private function onUpdateUserJoinPalace(evt:SocketClientEvent):void
		{
			this.member.id = evt.params.pid;
		}
	}
}