package mmo.framework.domain.community
{
	import mmo.framework.comm.ExtMessageClient;
	
	public class CarnivalClient
	{
		public static const cmdYaoTouZiKouJinBi:String="57_1";
		public static const cmdSongXiaoChouLiXianKuangHuanQuan:String="57_2";
		public static const cmdSongXiaoChouLiXianBonus:String="57_3";
		public static const cmdSongXiaoChouLiXianBigBonus:String="57_4";
		public static const GET_CURRENT_CANDY_NUM:String="57_5";
		public static const ADD_AND_GET_CANDY_NUM:String="57_6";
		public static const PICK_CANDY_GIFT:String="57_7";
		public static const CMD_RIDE_QI_CHONG:String="57_9";
		public static const CMD_RIDE_QI_CHONG_TELL_OTHERS:String="57_evt9";
		public static const CMD_LEAVE_QI_CHONG:String="57_10";

		
		public static const HIT_BALL_GAME_TICKET_REQUESE:String="57_11";
		public static const CMD_JIAN_JIAO_MO_FANG_KHQ:String = "57_12";
		public static const LIVELY_BUFFON_TICKET_REQUEST:String="57_13";
		
		public static const CMD_CHANGE_KHQ:String = "57_15";
		
		public static const CMD_TRY_GET_LUCKYSTAR_BONUS:String = "57_16";
		
		private static const EXTENSION_NAME = "CarnivalTmpExtension";
		
		private static var _instance:CarnivalClient;
		
		public function CarnivalClient()
		{
		}
		
		public static function get instance():CarnivalClient
		{
			if(_instance == null)
				_instance = new CarnivalClient();
			return _instance;
		}
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSION_NAME, cmd, params);
		}
		
		/**
		 * 获得当前糖果数
		 * 
		 */		
		public function getCandyNum():void
		{
			sendXtMessage(GET_CURRENT_CANDY_NUM,{});
		}
		/**
		 * 获得糖果礼物 
		 * 
		 */		
		public function pickCandyGift():void
		{
			sendXtMessage(PICK_CANDY_GIFT,{});
		}
		/**
		 * 扔糖果到罐子加糖果数广播全房间
		 * 
		 */		
		public function hitPot():void
		{
			sendXtMessage(ADD_AND_GET_CANDY_NUM,{});
		}
		
		/**
		 * 扣100金币
		 * 
		 */		
		public function yaoTouZiKouJinBi():void
		{
			sendXtMessage(cmdYaoTouZiKouJinBi,{});
		}
		
		/**
		 * 送狂欢券
		 * 
		 */		
		public function songXiaoChouLiXianKuangHuanQuan(ticket:int):void
		{
			sendXtMessage(cmdSongXiaoChouLiXianKuangHuanQuan,{"n":ticket});
		}
		
		/**
		 * 送小礼品
		 * 
		 */		
		public function songXiaoChouLiXianBonus():void
		{
			sendXtMessage(cmdSongXiaoChouLiXianBonus,{});
		}
		
		/**
		 *送大礼品  
		 * 
		 */		
		public function songXiaoChouLiXianBigBonus():void
		{
			sendXtMessage(cmdSongXiaoChouLiXianBigBonus,{});
		}
		
		/**
		 *骑上宠物 
		 * 
		 */		
		public function rideQiChong(petNum:int):void
		{
			sendXtMessage(CMD_RIDE_QI_CHONG,{"n":petNum});
		}
		/**
		 *离开宠物 
		 * 
		 */		
		public function leaveQiChong(petNum:int):void
		{
			sendXtMessage(CMD_LEAVE_QI_CHONG,{"n":petNum});
		}
		
		/**
		 * 顶球游戏请求获得狂欢卷 
		 * 
		 */		
		public function hitBallGameTicketRequese(level:int):void
		{
			sendXtMessage(HIT_BALL_GAME_TICKET_REQUESE,{n:level});
		}
		
		/**
		 * 活泼的小丑游戏请求获得狂欢卷 
		 * 
		 */		
		public function livelyBuffonTicketRequese(level:int):void
		{
			sendXtMessage(LIVELY_BUFFON_TICKET_REQUEST,{n:level});
		}
		
		/**
		 * 兑换狂欢券礼物 
		 */		
		public function exchangeKHQ(id:int):void
		{
			sendXtMessage(CMD_CHANGE_KHQ,{"id":id});
		}
		
		/**
		 * 获得尖叫魔方狂欢卷 
		 * 
		 */		
		public function magicCubeRequese():void
		{
			sendXtMessage(CMD_JIAN_JIAO_MO_FANG_KHQ,{});
		}
		
		public function tryGetLuckStartBonus(num:int):void
		{
			this.sendXtMessage(CMD_TRY_GET_LUCKYSTAR_BONUS, {"num":num});
		}
	}
}