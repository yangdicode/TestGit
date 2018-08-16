package mmo.framework.domain.battleitem
{
	import flash.events.EventDispatcher;
	
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;

	public class BattleItemClient extends EventDispatcher
	{
		private static const extName:String = "BattleItemExtension";
		
		public static const cmdGetMyItem:String = "34_1";
		public static const cmdUseItem:String = "34_5";
		public static const CMD_GET_BATTLE_ITEM_STATE:String = "34_6";
		
		private static var _instance:BattleItemClient;
		
		public function BattleItemClient()
		{
		}
		
		public static function get instance():BattleItemClient
		{
			if (_instance == null)
			{
				_instance = new BattleItemClient();
			}
			return _instance;
		}
		
		public function useItem(itemId:int):void
		{
			sendXtMessage(cmdUseItem, {"item":itemId});
		}
		
		public function getMyBattleItems():void
		{
			sendXtMessage(cmdGetMyItem, {});
		}
		
		public function getBattleItemState():void{
			sendXtMessage(CMD_GET_BATTLE_ITEM_STATE, {});
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extName, cmd, params);
		}

	}
}