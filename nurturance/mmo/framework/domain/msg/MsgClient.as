package mmo.framework.domain.msg
{
	import mmo.framework.comm.ExtMessageClient;

	//全服通告使用
	//主类写在MsgNotify
	
	public class MsgClient
	{
		private static const EXTENSIONS_NAME:String = "MsgExtension";
		public static const ZoneMsg:String = "75_1";
		public static const SendBugleMsg:String = "75_2";
		public static const SendIslandMsg:String = "75_3";
		public static const GetBuyFace:String = "75_4";
		public static const BuyFace:String = "75_5";
		
		/**
		 * type: 详见BugleType
		 * sender
		 * content
		 * ext
		 * var content:String = evt.params["content"];
			var chatter:String = evt.params["chatter"];
			var userIdentity:String = evt.params["chatterId"];
		 */
		public static const BugleMsgChange:String = "75_e2";
		
		public function MsgClient()
		{
		}
		
		/**
		 * @param type 1是小喇叭,2是大喇叭
		 * @param content
		 * @param huabian 花边
		 * @param ext 其他功能参数
		 */
		public static function sendBugleMsg(type:int, content:String, huabian:int=0, ext:String=""):void{
			sendXtMessage(SendBugleMsg, {"type":type, "content":content, "huabian":huabian, "ext":ext});
		}
		
		/**
		 * 免费本服消息
		 * msg
		 */
		public static function sendFreeIslandMsg(msg:String):void{
			sendXtMessage(SendIslandMsg, {"msg":msg});
		}
		
		public static function getBuyFaces():void{
			sendXtMessage(GetBuyFace, {});
		}
		
		public static function buyFace(faceId:int):void{
			sendXtMessage(BuyFace, {"face":faceId});
		}
		
		private static function sendXtMessage(cmd:String, paramObj:Object):void{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, paramObj);
		}
		
	}
}