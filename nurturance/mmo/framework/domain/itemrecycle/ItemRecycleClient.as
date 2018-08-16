package mmo.framework.domain.itemrecycle
{
	import mmo.framework.comm.ExtMessageClient;

	public class ItemRecycleClient
	{
		public static const CMD_RECYCLE_ITEM:String = "44_114";
		public static const CMD_EXCHANGE_RUBBISH:String = "44_115";
		
		public function ItemRecycleClient()
		{
		}
		
		private static function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessageByExtId(44, cmd, params);
		}
		
		public static function recycleItem(itemStr:String):void
		{
			sendXtMessage(CMD_RECYCLE_ITEM, {"is":itemStr});
		}
		
		public static function exchangeRubbish(itemStr:String):void
		{
			sendXtMessage(CMD_EXCHANGE_RUBBISH, {"is":itemStr});
		}
		
	}
}