package mmo.play.material.changehelper
{
	import flash.utils.Dictionary;
	
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.npcbattle.NpcBattleClient;
	import mmo.framework.domain.npcbattle.NpcBattleEvent;
	import mmo.framework.domain.npcbattle.NpcBattleEventDispatcher;
	import mmo.play.material.panel.MaterialGetPanel;
	
	
	public class UserNpcFavorChangeObserver implements IResourceChangeObserver
	{
		private var _userNpcChange:Dictionary;
		public function UserNpcFavorChangeObserver()
		{
			_userNpcChange = new Dictionary();
		}
		
		public function start():void
		{
			SocketClient.instance.addEventListener(NpcBattleClient.EVT_UPDATE_NPC_FAVOR, onUserNpcFavorAdd);
		}
		
		public function stop():void
		{
			SocketClient.instance.removeEventListener(NpcBattleClient.EVT_UPDATE_NPC_FAVOR, onUserNpcFavorAdd);
		}
		
		public function restart():void
		{
			clear();
			start();
		}
		
		public function showChangePanel(type:int=1):void
		{
			stop();
			for(var userNpcId:* in _userNpcChange){
				var changeNum:int = _userNpcChange[userNpcId];
				if(changeNum <= 0)
					continue;
				MaterialGetPanel.instance().showUserNpcFavorPanel(userNpcId, changeNum);
			}
		}
		
		public function getChangeValue():*
		{
			return _userNpcChange;
		}
		
		public function clear():void
		{
			stop();
			_userNpcChange = new Dictionary();
		}
		
		public function isChangeValue():Boolean
		{
			return false;
		}
		
		private function onUserNpcFavorAdd(evt:SocketClientEvent):void{
			
			var npcId:int = int(evt.params.nid);	
			var favorInc:int = int(evt.params.inc);	
			var favorNum:int = int(_userNpcChange[npcId]);
			_userNpcChange[npcId] = favorNum+favorInc;
			NpcBattleEventDispatcher.instance.dispatchEvent(new NpcBattleEvent(NpcBattleEvent.ADD_USER_NPC_FAVOR,{"id":npcId,"inc":favorInc}));
		}
	}
}