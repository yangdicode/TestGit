package mmo.framework.domain.honor
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;

	public class HonorClient
	{
		private static const EXTENSIONS_NAME:String = "HonorExtension";
		
		private static var _instance:HonorClient;
		
		public static const EVT_ADD_HONOR:String = "56_e1";
		public static const EVT_ADD_BADGE:String = "56_e2";
		public static const EVT_DEL_BADGE:String = "56_e3";
		
		public static const CMD_GET_EFFORTS:String = "56_1";
		public static const CMD_GET_RECORDS:String = "56_2";
		
		public static const CMD_GET_OTHER_EFFORTS:String = "56_3";
		public static const CMD_SET_BADGE:String = "56_4";
		public static const CMD_SET_EFFORTS:String = "56_5";
		public static const CMD_GET_PART_EFFORTS:String = "56_6";
		
		public function HonorClient()
		{
		}
		
		public static function get instance():HonorClient
		{
			if(_instance == null)
			{
				_instance = new HonorClient();
			}	
			return _instance;
		}	
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}
		
		public function getEfforts():void
		{
			this.sendXtMessage(CMD_GET_EFFORTS,{});
		}
		
		public function getHonors():void
		{
			this.sendXtMessage(CMD_GET_RECORDS,{});
		}
		
		public function getOtherEfforts(userName:String):void
		{
			this.sendXtMessage(CMD_GET_OTHER_EFFORTS,{"u":userName});
		}
		
		public function setBadge(badge:int):void
		{
			this.sendXtMessage(CMD_SET_BADGE,{"badge":badge});
		}
		
		public function setEfforts(efforts:String):void
		{
			this.sendXtMessage(CMD_SET_EFFORTS,{"efforts":efforts});
		}
		
		public static function getEffortBonus(id:int, callBack:Function):void{
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSIONS_NAME, "56_7", callBack, {"effort":id});
		}
		
		/*
		*Params: {"efforts":"1,2,3"}
		*{
		*ret 1-0,2-0,3-0
		*_cmd   56_6
		*}
		*/
		public function checkIsOwnEfforts(efforts:String):void
		{
			this.sendXtMessage(CMD_GET_PART_EFFORTS,{"efforts":efforts});
		}
	}
}