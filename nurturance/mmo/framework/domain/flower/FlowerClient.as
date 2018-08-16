package mmo.framework.domain.flower
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.domain.stat.BiClient;

	public class FlowerClient
	{
		private static var _instance:FlowerClient;
		private static const EXTENSION_NAME:String = "FlowerExtension";
		
		/**
		 * 该命令用于用户送花面板,需要取所有信息
		 */		
		public static const CMD_GET_USER_FLOWER_STATE:String = "74_1";
		/**
		 * 送花
		 */		
		public static const CMD_SEND_FLOWER:String = "74_2";
		/**
		 * 回复
		 */		
		public static const CMD_SEND_REPLY:String = "74_3";
		/**
		 *领取所有用户每日礼包 
		 */		
		public static const CMD_TAKE_COMMON_DAILY_FLOWER:String = "74_4";
		/**
		 *领取会员用户每日礼包 
		 */		
		public static const CMD_TAKE_MEMBER_DAILY_FLOWER:String = "74_5";
		/**
		 * 每日礼包领取状态
		 */		
		public static const CMD_TAKE_DAILY_FLOWER_STATE:String = "74_6";
		/**
		 * 当周花榜
		 */		
		public static const CMD_OPEN_CURWEEK_FLOWER_TOP:String = "74_7";
		/**
		 * 上周花榜
		 */		
		public static const CMD_OPEN_LAST_WEEK_FLOWER_TOP:String = "74_8";
		/**
		 * 领取鲜花魅力值礼包
		 */		
		public static const CMD_TAKE_FLOWERCHARM_GIFT:String = "74_9";
		/**
		 * 领取送花值礼包
		 */		
		public static const CMD_TAKE_SENDFLOWER_GIFT:String = "74_10";
		/**
		 * 领取排行榜礼包
		 */		
		public static const CMD_TAKE_FLOWERTOP_GIFT:String = "74_11";
		
		/**
		 * 取得用户鲜花信息
		 */		
		public static const CMD_TAKE_USER_FLOWER:String = "74_12";
		
		/**
		 * 花榜礼物状态
		 */		
		public static const CMD_TAKE_FLOWERTOP_GIFT_STATE:String = "74_13";
		
		/**
		 * 仙梦花魁的祝福 -- 获取花魁的信息
		 */		
		public static const CMD_GET_LASTWEEK_FLOWERTOPNO1_WEARING:String = "74_14";
		/**
		 * 仙梦花魁的祝福 -- 获取花魁活动的奖励 
		 * 
		 */
		public static const CMD_TAKE_FLOWERBLESS_BONUS:String = "74_15";
		/**
		 * 仙梦花魁的祝福 -- 获取花魁活动的获取奖励状态 
		 * 
		 */
		public static const CMD_GET_FLOWERBLESS_BONUSS_TATE:String = "74_16";
		
		public static const CMD_GET_FLOWER_TOP1_DATA:String = "74_17";
		
		//年度花榜活动
		public static const CMD_JOIN_YEARFLOWER:String = "74_18";
		public static const CMD_GET_YEARFLOWER_RECOMMEND_INFO:String = "74_19";
		public static const CMD_GET_YEARFLOWER_RECOMMEND_INFOS:String = "74_20";
		public static const CMD_INVITE_USER_BUILD_YEARFLOWER_GROUP:String = "74_21";
		public static const CMD_HANDLE_BUILD_YEARFLOWER_GROUP_REQUEST:String = "74_22";
		public static const CMD_DISBAND_YEARFLOWER_GROUP:String = "74_23";
		
		public static const CMD_GET_YEARFLOWER_TOP_INFOS:String = "74_24";
		public static const CMD_GET_YEARFLOWER_GROUP_INFO:String = "74_25";
		public static const CMD_GET_USER_YEARFLOWER_INFO:String = "74_26";
		public static const CMD_YEARFLOWER_RENAME:String = "74_27";
		
		public static const CMD_GET_FINAL_YEARFLOWER_TOP:String = "74_28";
		//唯一花束
		private static const CMD_GET_FLOWERS_ONLY_BUDDIES:String = "74_29";

		
		/**
		 * 全场景监听别人收到高级花
		 */		
		public static const EVT_RECFLOWER_ANIMATION:String = "74_e1";
		
		public function FlowerClient()
		{
		}
		
		public static function get instance():FlowerClient
		{
			if(_instance == null)
			{
				_instance = new FlowerClient();
			}
			return _instance;
		}
		
		private function sentXtMessage(cmd:String, obj:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(EXTENSION_NAME, cmd, obj);
		}
		
		/**
		 * 用户所有的鲜花信息
		 */		
		public function getUserFlowerInfor(userName:String):void
		{
			this.sentXtMessage(CMD_GET_USER_FLOWER_STATE, {"un":userName});
		}
		
		/**
		 * 送鲜花给某人
		 */		
		public function handlePresendFlower(userName:String, flowerId:int, num:int, a:*):void
		{
			BiClient.instance.sendXmlBehavior(4080);
			this.sentXtMessage(CMD_SEND_FLOWER, {"un":userName, "fid":flowerId, "num":num, "code":a + "@aoya.com"});
		}
		
		/**
		 * 当周花榜信息
		 */		
		public function getCurWeekTopInfo(offset:int, length:int):void
		{
			this.sentXtMessage(CMD_OPEN_CURWEEK_FLOWER_TOP, {"offset":offset, "length":length});
		}
		
		public function getLastWeekTopInfo(offset:int, length:int):void
		{
			this.sentXtMessage(CMD_OPEN_LAST_WEEK_FLOWER_TOP, {"offset":offset, "length":length});
		}
		
		/**
		 * 所有用户都能领取的每日鲜花礼包
		 */		
		public function getCommonDailyGift():void
		{
			this.sentXtMessage(CMD_TAKE_COMMON_DAILY_FLOWER, {});
		}
		
		/**
		 * 领取VIP用户每日鲜花礼包
		 */		
		public function getMemberDailyGift():void
		{
			this.sentXtMessage(CMD_TAKE_MEMBER_DAILY_FLOWER, {});
		}
		
		/**
		 * 回复送花人
		 */		
		public function handleReply(userName:String, type:int):void
		{
			BiClient.instance.sendXmlBehavior(4081);
			this.sentXtMessage(CMD_SEND_REPLY, {"un":userName, "t":type});
		}
		
		/**
		 * 魅力礼包
		 */		
		public function getFlowerCharmGift(giftId:int):void
		{
			this.sentXtMessage(CMD_TAKE_FLOWERCHARM_GIFT, {"id":giftId});
		}
		
		/**
		 * 送花礼包
		 */		
		public function getFlowerSendtGift(giftId:int):void
		{
			this.sentXtMessage(CMD_TAKE_SENDFLOWER_GIFT, {"id":giftId});
		}
		
		/**
		 * 获得领取每日礼包状态
		 */		
		public function getDailyGiftState():void
		{
			this.sentXtMessage(CMD_TAKE_DAILY_FLOWER_STATE, {});
		}
		
		/**
		 * 领取排行榜礼包
		 */		
		public function getFlowerTopGift():void
		{
			this.sentXtMessage(CMD_TAKE_FLOWERTOP_GIFT, {});
		}
		
		/**
		 * 用户鲜花信息，只取charm和sendFlower
		 */		
		public function getUserFlowerData(userName:String):void
		{
			this.sentXtMessage(CMD_TAKE_USER_FLOWER, {"un":userName});
		}
		
		/**
		 * 取得花榜奖励状态
		 */		
		public function getTopGiftState():void
		{
			this.sentXtMessage(CMD_TAKE_FLOWERTOP_GIFT_STATE, {});
		}
		
		
		/**
		 * 仙梦花魁的祝福 -- 获取花魁的信息
		 */			
		public function getLaskweekFlowerTopWearing():void
		{
			this.sentXtMessage(CMD_GET_LASTWEEK_FLOWERTOPNO1_WEARING, {});
		}
		/**
		 * 仙梦花魁的祝福 -- 获取花魁活动的奖励 
		 * 
		 */
		public function takeFlowerBlessBonus():void
		{
			this.sentXtMessage(CMD_TAKE_FLOWERBLESS_BONUS, {});
		}
		/**
		 * 仙梦花魁的祝福 -- 获取花魁活动的奖励 状态
		 * 
		 */
		public function getFlowerBlessBonusState():void
		{
			this.sentXtMessage(CMD_GET_FLOWERBLESS_BONUSS_TATE, {});
		}
		
		/**
		 * 历届花魁
		 */		
		public function getFlowerTop1Data():void
		{
			this.sentXtMessage(CMD_GET_FLOWER_TOP1_DATA, {});
		}
		
		public function getMyYearFlowerInfo():void{
			this.sentXtMessage(CMD_GET_USER_YEARFLOWER_INFO, {});
		}
		
		public function reNameMyGruop(name:String):void{
			this.sentXtMessage(CMD_YEARFLOWER_RENAME, {"name":name});
		}
		
		public function joinYearFlower(isKnight:Boolean):void{
			this.sentXtMessage(CMD_JOIN_YEARFLOWER, {"t":isKnight});
		}
		
		public function findPartner():void{
			this.sentXtMessage(CMD_GET_YEARFLOWER_RECOMMEND_INFOS, {});
		}
		
		public function searchPartner(content:String):void{
			this.sentXtMessage(CMD_GET_YEARFLOWER_RECOMMEND_INFO, {"info":content});
		}
		
		public function invitePartner(name:String):void{
			this.sentXtMessage(CMD_INVITE_USER_BUILD_YEARFLOWER_GROUP, {"bn":name});
		}
		
		public function acceptPartner(name:String):void{
			this.sentXtMessage(CMD_HANDLE_BUILD_YEARFLOWER_GROUP_REQUEST, {"rn":name, "agree":true});
		}
		
		public function leaveTeam():void{
			this.sentXtMessage(CMD_DISBAND_YEARFLOWER_GROUP, {});
		}
		
		public function getYearFlowerTop():void{
			this.sentXtMessage(CMD_GET_YEARFLOWER_TOP_INFOS, {});
		}
		
		public function getGruopData(groupId:int):void{
			this.sentXtMessage(CMD_GET_YEARFLOWER_GROUP_INFO, {"gid":groupId});
		}
		
		public function getYearFlowerTop10():void{
			this.sentXtMessage(CMD_GET_FINAL_YEARFLOWER_TOP, {});
		}
		
		public static function getOnlyFlowerData(callBack:Function):void{
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSION_NAME, CMD_GET_FLOWERS_ONLY_BUDDIES, callBack);
		}
		
		public static function getReceiveList(userName:String, callBack:Function):void{
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSION_NAME, "74_30", callBack, {"un":userName});
		}
		
		public static function sendExtAndCall(cmd:String, callBack:Function, params:Object = null):void
		{
			SocketClient.instance.sendXtMsgAndCallBack(74, cmd, callBack, params);
		}
		
	}
}