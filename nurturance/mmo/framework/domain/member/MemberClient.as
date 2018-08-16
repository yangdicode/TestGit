package mmo.framework.domain.member
{
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.UserInfo;

	public class MemberClient
	{
		public function MemberClient()
		{
		}

		private static var _instance:MemberClient;
		private static const EXTENSIONS_ID:int = 70;

		public static function get instance():MemberClient
		{
			if(_instance == null)
			{
				_instance = new MemberClient();
			}
			return _instance;
		}
		
		private function sentXtMessage(cmd:String, obj:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(extensionName, cmd, obj);
		}
		
		public static const extensionName:String = "MemberExtension";
		public static const CMD_GET_MONTHLY_GIFT:String = "70_1";
		public static const CMD_GET_WEEKLY_GIFT:String = "70_2";
		public static const CMD_GET_VIPLV_GIFT:String = "70_3";
		public static const CMD_GET_OTHER_MEMBERINFO:String = "70_4";
		public static const CMD_GET_GIFT_STATE:String = "70_5";
		public static const CMD_GET_USER_VIP_CONSUMELOG:String = "70_6";
		public static const CMD_GET_OTHER_MEMBERINFOS:String = "70_7";
		public static const CMD_GET_MEMBER_RECHARGE_BONUS:String = "70_8";
		public static const CMD_SET_HIDE_MEMBER:String = "70_9";
		public static const CMD_GET_MEMBERINFO:String = "70_10";
		public static const CMD_GET_AOBISUM:String = "70_11";
		public static const CMD_GET_OVERDUEVIP:String = "70_12";
		public static const CMD_AOBI_EXCHANGE_YUBI:String = "70_13";
		public static const CMD_PIECE_EXCHANGE_YUBI:String = "70_14";
		public static const CMD_TAKE_FIRST_OPEN_GIFT:String = "70_15";
		
		public static const CMD_USE_MEMBER_EXPERIENCE_CARD:String = "70_18";
		public static const CMD_TAKE_MEMBER_RECHARGE_GFIT:String = "70_19";
		
		public static const CMD_GET_MEMBER_FIRST_OPENDATE:String = "70_20";
		
		public static const CMD_USER_IS_EXCHANGE_BEFORE_DATE:String = "70_21";		
		
		public static const CMD_USE_EXP_CARD:String = "70_1_1";//神羽骑士大体验
				
		public static const CMD_GET_DAILY_GIFT:String = "70_25";
		
		public static const CMD_TAKE_MEMBER_MONTH_GIFT:String = "70_26";
		
		public static const CMD_GET_USER_AOBI:String = "70_29"; //只取用户奥币数目
		
		public static const CMD_GET_USER_RECHARGE_OR_RENEW_FIRST_LOG:String = "70_31";//获取用于一段时间内第一次充值时间
		
		//----------------------------------------------------------//
		//推送事件
		public static const EVT_RMB_UPDATE:String = "70_e1";
		/*** 商城消费，增加vip成长值 ***/
		public static const EVT_MEMBER_EXP_UPDATE:String = "70_e2";
		
		public static const EVT_MEMBER_EXPERANCE_UPDATE:String = "70_e3";
		
		//只改变羽贝
		public static const EVT_YUBEI_UPDATE:String = "70_e4";
		
		//end 推送事件
		//----------------------------------------------------------//
		
		/**  发命令的包装  **/
		public static function sendExtAndCallBack(cmd:String, params:Object = null, callBack:Function = null):void{
			
			SocketClient.instance.sendXtMsgAndCallBack(EXTENSIONS_ID, cmd, function(backParams:Object):void{
				
				if(callBack != null){
					callBack.apply(null, [backParams]);
				}
			}, params);
		}
				
		public function getOtherMemberInfo(userName:String):void
		{
			this.sentXtMessage(CMD_GET_OTHER_MEMBERINFO, {"un": userName});
		}
		
		public function getOtherMemberInfos(names:String):void
		{
			this.sentXtMessage(CMD_GET_OTHER_MEMBERINFOS, {"uns":names});
		}
		
		public function setHideMember(isHide:Boolean):void
		{
			this.sentXtMessage(CMD_SET_HIDE_MEMBER, {"hvip":isHide});
		}
		
		public function getDailyGift():void
		{
			this.sentXtMessage(CMD_GET_DAILY_GIFT, {});
		}
		
		public function getMonthlyGift():void
		{
			this.sentXtMessage(CMD_GET_MONTHLY_GIFT, {});
		}
		
		public function getWeeklyGift():void
		{
			this.sentXtMessage(CMD_GET_WEEKLY_GIFT, {});
		}
		
		public function getVipLevelGift(lev:int):void
		{
			this.sentXtMessage(CMD_GET_VIPLV_GIFT, {"mlv":lev});
		}
			
		public function getGiftState():void
		{
			this.sentXtMessage(CMD_GET_GIFT_STATE, {});
		}
		
		public function getVipConsumentLog(num:int, offset:int):void
		{
			this.sentXtMessage(CMD_GET_USER_VIP_CONSUMELOG, {"offset":offset, "limit":num});
		}
		
		public function getVipRechargeBonus(id:int):void
		{
			this.sentXtMessage(CMD_GET_MEMBER_RECHARGE_BONUS, {"t":id});
		}
			
		public function getAlreadyOverdue():void
		{
			this.sentXtMessage(CMD_GET_OVERDUEVIP, {});
		}
		
		public function aobiExchangeYubi(num:int):void
		{
			this.sentXtMessage(CMD_AOBI_EXCHANGE_YUBI, {"aobi":num});
		}
		
		public function pieceExchangeYubi(num:int):void
		{
			this.sentXtMessage(CMD_PIECE_EXCHANGE_YUBI, {"num":num});
		}
		
		/**
		 * 这个只是在初始化数据时候调用，其他时刻禁止调用
		 */		
		public function getUserMemberInfo(callBack:Function):void
		{
			var onGetMemberInfo:Function = function(evt:SocketClientEvent):void
			{
				SocketClient.instance.removeEventListener(CMD_GET_MEMBERINFO, onGetMemberInfo);
				var userMember:UserMember = new UserMember();
				var userInfo:UserInfo = MainModelLocator.instance.retrieveModel(UserInfo) as UserInfo;
				userMember.userName = userInfo.userName;
				userMember.exp = evt.params["mexp"];
				userMember.isMember = evt.params["ism"];
				userMember.isYearMember = evt.params["isym"];
				userMember.isRMBMember = evt.params["isrm"];
				userMember.invalidateTime =  Number(evt.params["enddate"]);
				userMember.memberType = int(evt.params["mt"]);
				userMember.expeMemberEndTime = evt.params["expe"];
				userMember.newRechargeTime = evt.params["npmd"];
				
				MainModelLocator.instance.addModel(UserMember, userMember);
				callBack.apply();
			}
			
			SocketClient.instance.addEventListener(CMD_GET_MEMBERINFO, onGetMemberInfo);
			this.sentXtMessage(CMD_GET_MEMBERINFO,{});
		}
		
		public function getAobiYubiSum():void
		{
			this.sentXtMessage(CMD_GET_AOBISUM, {});
		}
		
		public function getAobiSum():void{
			this.sentXtMessage(CMD_GET_USER_AOBI, {});
		}
		
		public function takeNewVipGift():void
		{
			this.sentXtMessage(CMD_TAKE_FIRST_OPEN_GIFT, {});
		}
		
		public function exchangeExperanceMemberCard(itemId:int):void{
			this.sentXtMessage(CMD_USE_MEMBER_EXPERIENCE_CARD, {"cid":itemId});
		}
		
		public function takeRecharGift(month:int, id:int):void{
			this.sentXtMessage(CMD_TAKE_MEMBER_RECHARGE_GFIT, {"m":month, "id":id});
		}
		
		public function takeUserExpVipCard(expId:int,strExt:String = ""):void{
			this.sentXtMessage(CMD_USE_EXP_CARD, {"id":expId,"ext":strExt});
		}
		
		
		/**
		 * 获取用户首充时间
		 * 
		 * long time = date == null ? 0l : date.getTime();
		 * 
		 *  后端返回 res.putLong("fot", time);
		 * */
		public function getMemberFirstOpenDate():void
		{
			this.sentXtMessage(CMD_GET_MEMBER_FIRST_OPENDATE,{});
		}
		
		/**
		 *	 获取用户在某日之前是否奥币兑换过羽贝
		 * @param strDate 日期 2013-5-8
		 * 后端返回 res.putBool("ret", isExchangeBeforeDate);
		 */		
		public function getUserIsExchangeBeforeDate(strDate:String):void
		{
			this.sentXtMessage(CMD_USER_IS_EXCHANGE_BEFORE_DATE,{"date":strDate});
		}
		
		public function takeRechargeGift(month:int, id:int):void{
			this.sentXtMessage(CMD_TAKE_MEMBER_MONTH_GIFT, {"month":month, "id":id});
		}
		
		/**
		 *获取用于一段时间内第一次充值时间 
		 * @param sd 开始日期， 格式："2013-5-8"
		 * @param ed 截至日期， 格式："2013-5-8"
		 * @param callBack
		 * 	后端返回：res.putBool("suc", suc);
				       if(suc){
				           res.putLong("ct", log.getConsumeDate().getTime());
       					}
		 */		
		public function getUserRechargeOrRenewFirstTime( sd:String, ed:String, callBack:Function ):void{
			sendExtAndCallBack(CMD_GET_USER_RECHARGE_OR_RENEW_FIRST_LOG, {"sd":sd, "ed":ed}, callBack);
		}
		
	}
}