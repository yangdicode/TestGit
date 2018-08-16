package mmo.play.material.gitem
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;

	public class GItemClient
	{
		private static const EXTENSIONS_NAME:String = "GatherExtension";
		private static var _instance:GItemClient;
		
		public static const cmdGetMyItems:String = "22_2";
		public static const cmdAddGItems:String = "22_3";
		
		public static const cmdGetOtherGItems:String = "22_6";
		
		public function GItemClient()
		{
		}
		
		public static function get instance():GItemClient
		{
			if (_instance == null)
			{
				_instance = new GItemClient();
			}
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}
		
		public function getMyItems():void
		{
			this.sendXtMessage(cmdGetMyItems,{});
		}
		
		public function addGiftItem(itemId:int,itemNum:int):void
		{
			this.sendXtMessage(cmdAddGItems,{"iid":itemId,"num":itemNum});
		}
		
		/**
		 * @param userName : 要取的userName;
		 * @param ids : 需要知道的GItem id，数组如[1,2,3,4,5];
		 * @param onGetFun ： 返回函数，带参数，Array类型，如[1,2,3]代表有1,2,3没有4,5;
		 */		
		public function getOtherHasGItems(userName:String, ids:Array, onGetFun:Function):void{
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSIONS_NAME, cmdGetOtherGItems, onGet, {"o":userName, "i":ids.join(",")});
			function onGet(params:Object):void{
				onGetFun.apply(null, [params.own]);
			}
		}
		
	}
}