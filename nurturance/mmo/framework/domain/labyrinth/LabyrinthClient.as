package mmo.framework.domain.labyrinth
{
	import mmo.framework.comm.ExtMessageClient;

	public class LabyrinthClient
	{
		private static const EXTENSIONS_ID:int = 85;	
		
		public static const CMD_GET_USER_INFO:String = "85_1";	
		public static const CMD_ENTER_LABYRINTH:String = "85_2";	
		public static const CMD_ACTION:String = "85_3";	
		public static const CMD_LEAVE_LABYRINTH:String = "85_4";	
		public static const CMD_BUY_ENTER_TIMES:String = "85_5";	
		public static const CMD_HANDLE_PRO_GRID:String = "85_6";	
		public static const CMD_HANDLE_PARTNER_GRID:String = "85_7";	
		public static const CMD_USE_ITEM:String = "85_8";			
		public static const CMD_CLEAR_ENTER_LABYRINTH_CD :String = "85_9";	
		
		public function LabyrinthClient()
		{
		}
		
		private static function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessageByExtId(EXTENSIONS_ID, cmd, params);
		}
		
		/** 获取用户当前迷宫信息 **/
		public static function getUserInfo():void
		{
			sendXtMessage(CMD_GET_USER_INFO,{});
		}
		
		/** 进入迷宫 **/
		public static function onEnterLabyrinth():void
		{
			sendXtMessage(CMD_ENTER_LABYRINTH,{});
		}
		
		/** 摇色子，走格子 **/
		public static function onAction():void
		{
			sendXtMessage(CMD_ACTION,{});
		}
		
		/** 离开迷宫 **/
		public static function onLeaveLabyrinth():void
		{
			sendXtMessage(CMD_LEAVE_LABYRINTH,{});
		}
		
		/** 购买进入次数 **/
		public static function onBuyEnterTimes():void
		{
			sendXtMessage(CMD_BUY_ENTER_TIMES,{});
		}
		
		/** 处理职业格事件 
		 * @param cIndex 0是升级,1,2对应职业格所推两个职业index
		 */		
		public static function onHandleProGrid(cIndex:int):void
		{
			sendXtMessage(CMD_HANDLE_PRO_GRID,{"c":cIndex});
		}
		
		/** 处理伙伴格事件 
		 * @param cIndex 0,1,2  伙伴格后端所推信息顺序
		 * @param ext 用来队伍成员满的时候,替换掉哪个成员, 该成员的值为：id-lv
		 **/
		public static function onHandlePartnerGrid(cIndex:int,ext:String):void
		{
			sendXtMessage(CMD_HANDLE_PARTNER_GRID,{"c":cIndex,"ext":ext});
		}
		
		/** 遥控色子 **/
		public static function onUserItem(c:int):void
		{
			sendXtMessage(CMD_USE_ITEM,{"c":c});
		}
		
		/** 清除进入CD **/
		public static function onCleanEnterCD():void
		{
			sendXtMessage(CMD_CLEAR_ENTER_LABYRINTH_CD ,{});
		}
		
		
		
	}
}