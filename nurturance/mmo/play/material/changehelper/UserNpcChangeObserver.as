package mmo.play.material.changehelper
{
	import flash.utils.Dictionary;
	
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.npcbattle.NpcBattleClient;
	import mmo.framework.domain.npcbattle.NpcBattleEvent;
	import mmo.framework.domain.npcbattle.NpcBattleEventDispatcher;
	import mmo.framework.domain.npcbattle.UserNpc;
	import mmo.play.material.panel.MaterialGetPanel;
	
	
	public class UserNpcChangeObserver implements IResourceChangeObserver
	{
		private var _userNpcChange:Dictionary;
		public function UserNpcChangeObserver()
		{
			_userNpcChange = new Dictionary();
		}
		
		public function start():void
		{
			SocketClient.instance.addEventListener(NpcBattleClient.EVT_ADD_USER_NPCS, onUserNpcAdd);
		}
		
		public function stop():void
		{
			SocketClient.instance.removeEventListener(NpcBattleClient.EVT_ADD_USER_NPCS, onUserNpcAdd);
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
				MaterialGetPanel.instance().showUserNpcPanel(userNpcId, changeNum);
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
		
		private function onUserNpcAdd(evt:SocketClientEvent):void{
			var newNpcData:Object = evt.params.npc;			
			var npcId:int = UserNpc.parse(newNpcData).npcId;
			_userNpcChange[npcId] = 1;	
			NpcBattleEventDispatcher.instance.dispatchEvent(new NpcBattleEvent(NpcBattleEvent.ADD_USER_NPC,{"npc":newNpcData}));
		}
	}
}