package mmo.framework.domain.wintervacation
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	
	public class WinterVacationClient
	{
		public static const EXTENSIONS_NAME:String = "WinterVacationExtension";
		
		public static const cmdTakeLv46To50Bonus:String = "71_1";
		public static const cmdTakeOnLineTimeBonus:String = "71_2";
		public static const cmdTackEarlyYearBonus:String = "71_3";
		public static const cmdTakeOnLineTimeBonusState:String = "71_4";
		public static const cmdTackEarlyYearState:String = "71_5";
		public static const CMD_TAKE_YAYALE_DAILYGIFT:String  = "71_6";
		public static const CMD_TAKE_YAYALE_DAILYGIFT_STATE:String = "71_7";
		public static const CMD_TAKE_YAYALE_TRANSGIFT:String = "71_8";
		
		public static const cmdTakeCoupletsBouns:String = "71_12";
		public static const CMD_HOUSE_BLESSING:String = "71_13";
		public static const CMD_BUSINESSSTREET_FEEDBACK:String = "71_14";
		public static const CMD_TAKE_NPC_BONUS:String = "71_15";
		public static const CMD_TAKE_NPC_BONUS_STATE:String = "71_16";
		public static const CMD_TAKE_MAMMOM_DRAGONSIGN:String = "71_17";
		public static const CMD_TAKE_MAMMON_BLESSINGBAG:String = "71_18";
		public static const CMD_OPEN_BLESSINGBAG:String = "71_19";
		public static const CMD_TAKE_SITANA_GIFT:String = "71_20";
		public static const CMD_TAKE_TIME_DANCE_BONUS:String = "71_21";
		public static const CMD_BUILD_DRAGONCITY:String = "71_9";
		public static const CMD_TAKE_BUILD_DRAGONCITY_STATE:String = "71_10";
		public static const CMD_TRANS_CIRCLE:String = "71_22";
		public static const CMD_TAKE_CIRCLE_BONUS:String = "71_23";
		public static const CMD_TAKE_CIRCLE_TRIPS:String = "71_24";
		
		
		private static var _instance:WinterVacationClient;
		
		public function WinterVacationClient()
		{
		}
		
		public static function get instance():WinterVacationClient
		{
			if (_instance == null)
			{
				_instance = new WinterVacationClient();
			}
			return _instance;
		}

		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSIONS_NAME, cmd, params);
		}
		/** 
		 * 拜早年奖励
		 */		
		public function tackEarlyYearBonus(suc:Boolean):void
		{
			this.sendXtMessage(cmdTackEarlyYearBonus,{"suc":suc});
		}
		/**
		 * 拜早年状态
		 */		
		public function tackEarlyYearState():void
		{
			this.sendXtMessage(cmdTackEarlyYearState,{});
		}
		/**
		 * 50级冲级礼包
		 * */
		public function takeLv46To50Bonus(lv:int):void
		{
			this.sendXtMessage(cmdTakeLv46To50Bonus,{"lv":lv});
		}
		/**
		 * 累计在线奖励
		 * */
		public function takeOnlineTimeBonus(id:int,times:int):void
		{
			this.sendXtMessage(cmdTakeOnLineTimeBonus,{"id":id,"times":times});
		}
		/**
		 * 获取累计在线奖励状态
		 * */
		public function takeOnlineTimeBonusState():void
		{
			this.sendXtMessage(cmdTakeOnLineTimeBonusState,{});
		}
		
		/**
		 * 拿牙牙乐每日奖励  
		 * 
		 */		
		public function takeYayaleDailyGift():void
		{
			this.sendXtMessage(CMD_TAKE_YAYALE_DAILYGIFT,{});
		}
		
		/**
		 * 取牙牙乐有没有领过每日奖励的数据  
		 * 
		 */		
		public function takeYayaleDailyGiftState():void
		{
			this.sendXtMessage(CMD_TAKE_YAYALE_DAILYGIFT_STATE,{});
		}
		
		/**
		 * 拿牙牙乐兑换奖励  
		 * 
		 */		
		public function takeYayaleTransGift(password:String):void
		{
			this.sendXtMessage(CMD_TAKE_YAYALE_TRANSGIFT,{"pwd":password});
		}
		
		/**
		 *财神路获取龙符号 
		 */		
		public function takeMammomDargonSign(quantity:int):void
		{
			this.sendXtMessage(CMD_TAKE_MAMMOM_DRAGONSIGN,{"c":quantity});
		}
		/**
		 * 财神路获得福袋
		 */		
		public function takeMamonBlessingBag(type:int):void
		{
			this.sendXtMessage(CMD_TAKE_MAMMON_BLESSINGBAG,{"t":type});
		}
		
		/***
		 * 春节写对联活动
		 * */
		public function takeCoupletBouns(name:String,isGoldBrush:Boolean):void
		{
			this.sendXtMessage(cmdTakeCoupletsBouns,{"un":name,"igb":isGoldBrush});
		}
		/**
		 * 春节家园祝福
		 * @param roomOwnerName 屋主用户名
		 * 
		 */		
		public function handleHouseBlessing(roomOwnerName:String):void
		{
			sendXtMessage(CMD_HOUSE_BLESSING,{"un":roomOwnerName});
		}
		/**
		 * 春节你有我就送  
		 * @param type 物品类型
		 * @param id 物品ID
		 * 
		 */		
		public function handleFeedback(type:int,id:int):void
		{
			sendXtMessage(CMD_BUSINESSSTREET_FEEDBACK,{"type":type,"id":id});
		}
		/**
		 * NPC拜年领取礼物 
		 * 
		 */		
		public function handleTakeNPCBonus():void
		{
			sendXtMessage(CMD_TAKE_NPC_BONUS,{});
		}
		/**
		 * NPC拜年是否今天领取过的状态 
		 * 
		 */		
		public function handleTakeNPCBonusState():void
		{
			sendXtMessage(CMD_TAKE_NPC_BONUS_STATE,{});
		}
		/**
		 * 开福袋  
		 * @param type 福袋类型 
		 * 
		 */		
		public function handleOpenBressingBag(type:int):void
		{
			sendXtMessage(CMD_OPEN_BLESSINGBAG,{"t":type});
		}
		/**
		 * NPC领取财神礼盒 
		 * 
		 */		
		public function handleTakeSantanaGift():void
		{
			sendXtMessage(CMD_TAKE_SITANA_GIFT,{});
		}
		/**
		 * 跨年舞会奖励 
		 * @param type 奖励类型
		 * 
		 */		
		public function handleTakeTimeDanceBonus(type:int):void
		{
			sendXtMessage(CMD_TAKE_TIME_DANCE_BONUS,{"t":type});
		}

		/** 
		 * 建设龙城
		 */		
		public function buildDragonCity():void
		{
			this.sendXtMessage(CMD_BUILD_DRAGONCITY,{});
		}
		
		/** 
		 * 建设龙城的状态
		 */		
		public function takeBuildDragonCityState():void
		{
			this.sendXtMessage(CMD_TAKE_BUILD_DRAGONCITY_STATE,{});
		}
		
		/**
		 * 换圈圈
		 */		
		public function transCircle(typeId:int, num:int):void
		{
			this.sendXtMessage(CMD_TRANS_CIRCLE, {"t":typeId, "num":num});
		}
		
		public function takeCircleBonus(type:int, id:int, lv:int, circleid:int):void
		{
			this.sendXtMessage(CMD_TAKE_CIRCLE_BONUS, {"it":type, "ii":id, "il":lv, "cid":circleid});
		}
		
		/**
		 * 捉迷藏拿圈圈碎片奖励 
		 * 
		 */		
		public function takeCircleTrips():void
		{
			this.sendXtMessage(CMD_TAKE_CIRCLE_TRIPS,{});
		}
	}
}