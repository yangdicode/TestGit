package mmo.framework.domain.stat
{
	import mmo.framework.comm.ExtMessageClient;
	
	public class BiClient
	{
		private static const extensionName:String = "BIExtension";
		private static var _instance:BiClient;
		
		public static const ViewCardCompose:int = 9;
		public static const ViewCardDecompose:int = 10;
		public static const OpenMcCancel:int = 11;     //记录开场动画跳过
		
		//发送记录数据库信息
		public static const cmdSendStat:String = "49_1";
		
		//发送记录日志
		public static const cmdCommonBehavior:String = "49_2";
		
		//发送记录日志
		public static const cmdTempBehavior:String = "49_3";
		
		//新手操作记录
		private static const cmdNewbeeRecords:String = "49_4";
		
		//新手操作记录
		private static const cmdFightWildBoss:String = "49_5";
		
		//前端FlashPlayer版本号
		private static const cmdFlashPlayerVersion:String = "49_6";
		
		//进入殿堂之路
		private static const cmdEnterPalaceRoad:String = "49_7";
				
		//发送记录日志
		public static const cmdXmlBiLog:String = "49_8"; 
		
		//累计记bi，后端特殊报表，1次、2次、3次........
		public static const CMD_DB_LOG:String = "49_9";
		
		public function BiClient()
		{
		}
		
		public static function get instance():BiClient
		{
			if(_instance == null)
			{
				_instance = new BiClient();
			}	
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object)
		{
			ExtMessageClient.instance.sendXtMessage(extensionName, cmd, params);
		}
		
		public function sendOneOff(type:int):void
		{
			this.sendXtMessage(cmdSendStat,{"id":type});
		}
		
		/**
		 * 改方法已经不用了【被树涛抛弃的,没有特殊需要，不要使用。】	
		 */		
		public function sendCommonBehavior(type:int,value:int = 1):void
		{
			this.sendXtMessage(cmdCommonBehavior,{"id":type,"value":value});
		}
		
		/**
		 *  改方法已经不用了 【不要用这个啦！树涛抛弃它啦！】
		 */
		public function sendTempBehavior(type:int,value:int = 1):void
		{
			this.sendXtMessage(cmdTempBehavior,{"id":type, "value":value});
		}
		
		/**
		 * type BiTempType 配置 【新bi统计 树涛的新专宠！】
		 */
		public function sendXmlBehavior(type:int,value:int = 1):void
		{
			this.sendXtMessage(cmdXmlBiLog,{"id":type, "value":value});
		}
		
		public function sendNewbeeOperatorRecords(params:Object):void
		{
			this.sendXtMessage(cmdNewbeeRecords, params);
		}
		
		public function sendFightWildBoss(name:String):void
		{
			this.sendXtMessage(cmdFightWildBoss, {"boss":name});
		}
		
		/**
		 * FlashPlayer的大版本号，应该只有可能是9、10、11 
		 */		
		public function sendFlashPlayerVersion(version:int):void
		{
			this.sendXtMessage(cmdFlashPlayerVersion, {"v":version});
		}
		
		/**
		 * 进入殿堂之路Bi统计 
		 * 
		 */		
		public function sendEnterPalaceRoad(id:int):void
		{
			this.sendXtMessage(cmdEnterPalaceRoad, {"id":id});
		}
		
		/**
		 *累计记bi，后端特殊报表，1次、2次、3次........
		 */		
		public function sendDbLogBi(index:int, num:int=1):void{
			this.sendXtMessage(CMD_DB_LOG, {"index":index, "num":num});
		}
	}
}