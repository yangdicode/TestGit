package mmo.framework.domain.teamactivity
{
	import mmo.framework.comm.ExtMessageClient;

	/**
	 * 组队活动相关client
	 * @author liyawei
	 */	
	
	public class TeamActivityClient
	{
		private static const EXTENSIONS_NAME = "TeamActivityExtension";
		private static var _instance:TeamActivityClient;
		
		public static var CMD_GET_SPY_DONE_COUNT:String = "69_1";
		public static var EVT_UPDATE_SPY_DONE_COUNT:String = "69_e1";
		
		
		
		public function TeamActivityClient()
		{
		}
		
		public static function get instance():TeamActivityClient
		{
			if(_instance == null)
			{
				_instance = new TeamActivityClient();
			}
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}
		
		/**
		 * 得到间谍号数 
		 */		
		public function getSpyDoneCount():void
		{
			this.sendXtMessage(CMD_GET_SPY_DONE_COUNT,{});
		}
	}
}