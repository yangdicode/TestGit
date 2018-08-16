package mmo.framework.domain.community
{
	import mmo.framework.comm.ExtMessageClient;
	
	public class LanternRiddleClient
	{
		private static var _instance:LanternRiddleClient;
		private static const EXTENSION_NAME:String = "LanternRiddleExtension";
		
		public static const CMD_GET_RIDDLE_STATE:String = "73_1";
		public static const CMD_TAKE_RIDDLE_GIFT:String = "73_2";
		public static const CMD_TAKE_RIDDLES_GIFT:String = "73_3";
		public static const CMD_GET_RIDDLE_TOP:String = "73_4";
		public static const EVT_RIDDLE_STATE:String = "73_5";
		
		public function LanternRiddleClient()
		{
		}
		
		public static function get instance():LanternRiddleClient
		{
			if(_instance == null)
			{
				_instance = new LanternRiddleClient();
			}
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSION_NAME, cmd, params);
		}
		
		public function getRiddleState():void
		{
			sendXtMessage(CMD_GET_RIDDLE_STATE,{});
		}
		
		public function takeRiddleGift(isRight:Boolean):void
		{
			sendXtMessage(CMD_TAKE_RIDDLE_GIFT,{"suc":isRight});
		}
		
		public function takeRiddlesGift():void
		{
			sendXtMessage(CMD_TAKE_RIDDLES_GIFT,{});
		}
		
		public function getTiddleTop():void
		{
			sendXtMessage(CMD_GET_RIDDLE_TOP,{});
		}
	}
}