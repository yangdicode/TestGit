package mmo.play.material.supermarketitem
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.comm.ExtMessageClient;
	import mmo.framework.comm.SocketClient;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.layer.LayerManager;

	public class SupermarketClient
	{
		public static const  CMD_ADD_SHOP:String = "89_1";
		public static const  CMD_LVUP_GOODS_CABINET:String = "89_2";
		public static const  CMD_REMOVE_GOODS_CABINET:String = "89_3";
		public static const  CMD_UNLOCK_GOODS:String = "89_4";
		public static const  CMD_GET_BUDDIES_EXP:String = "89_5";
		public static const  CMD_BUY_GOODS:String = "89_6";
		public static const  CMD_DECORATE_SHOP:String = "89_7";
		public static const  CMD_START_WELCOME_GUESTS:String = "89_8";
		public static const  CMD_END_WELCOME_GUESTS:String = "89_9";
		public static const  CMD_GET_MY_SUPERMARKET_ITEMS:String = "89_10";
		
		public static const  CMD_GET_USER_SHOPINFO:String = "89_11";
		public static const  CMD_GET_MY_SHOP_OTHER_INFO:String = "89_12"; //区别开他人信息
		public static const  CMD_GET_OTHER_BASE_INFO:String = "89_13"; //用户基本信息(营业等级,开了哪些店,精品币)
		
		public static const  CMD_GET_MY_UNLOCK_GOODS:String = "89_14"; //取解锁货物
		public static const  CMD_BUY_SUPERMARKET_SELL_GOODS_PARTNER:String = "89_15"; //雇佣理货员
		public static const  CMD_REMOVE_SUPERMARKET_SELL_GOODS_PARTNER:String = "89_16"; //解雇
		
		public static const CMD_UNLOCK_SHOP_FLOOR_BLOCK_GRIDS:String = "89_17"; //解锁块
		public static const CMD_ADD_OR_CHANGE_GOODS_TO_CABINET:String = "89_18"; // 补货/换货
		public static const CMD_GET_MY_BASE_INFO:String = "89_19"; //取自己的基本信息  添加多这条,和之前的 89_13区分
		
		public static const CMD_GET_HOT_NEWS_MSGS:String = "89_20";  //取最新消息
		public static const CMD_GET_GAME_MSGS:String = "89_21";  //取游戏消息
		public static const CMD_GET_MANAGE_MSGS:String = "89_22";  //取经营消息
		
		public static const CMD_TAKE_EMPLOYEE_BONUS:String = "89_23";   //领取被雇佣工资
		public static const CMD_USE_PROP:String = "89_24";  //使用道具

		public static const CMD_GET_DAILY_CHECKIN_INFO:String = "89_25";  //取每日任务面板信息
		public static const CMD_DAILY_CHECK_IN:String = "89_26";  //进行签到
		
		public static const CMD_CLEAR_USER_GOODS_CABINET_LVUP_QUEUECD:String = "89_27"; // 清掉升级队列小于5分钟cd
		public static const CMD_BUY_BACK:String = "89_28";
		public static const CMD_BI:String = "89_29";
		public static const CMD_TAKE_DAILY_CHEST_BONUS:String = "89_30"; //领取每日任务奖励
		public static const CMD_USER_QUIT_SUPERMARKET:String = "89_31"; //用户离开超市
		
		public static const CMD_LVUP_USER_BALLON:String = "89_32";//升级气球
		public static const CMD_START_BALLON_AD:String = "89_33";//开始巡回宣传
		public static const CMD_TAKE_BALLON_AD_BONUS:String = "89_34";//拿气球奖励
		public static const CMD_THE_FIRST_TIME_OPEN_BALLON:String = "89_35";//首次开气球
		
		public static const CMD_GET_USER_RICHMAN_INFO:String = "89_36";
		public static const CMD_START_RICHMAN_CHALLENGE:String = "89_37";
		public static const CMD_GET_MAGNATE_TOP:String = "89_38";
		public static const CMD_VIP_FLUSH_RICHMAN:String = "89_39"; //vip重置大亨
		
		public static const CMD_GET_USER_EXP:String = "89_40"; //前端活动单独调用,获取营业等级经验

		
		/**
		 *装饰完后
		 * shopfloorgrids， userfloorgrids
		 */		
		public static const  EVT_ADD_USER_FLOOR_GRID:String = "89_e1";
		
		public static const EVT_FINISH_DAILY_TASK:String = "89_e2";
		
		public static const EVT_UPDATE_SHOP_GUESTS:String = "89_e3";
		
		public static const EVT_UPDATE_GOODS_CABINET_LVUP_QUEUE:String = "89_e4";
		
		public static const EVT_INC_BUSINESS_EXP:String = "89_e5";
		public static const EVT_INC_SHOP_VALUE:String = "89_e6";
		public static const EVT_BUSINESS_LV_UP_BONUS:String = "89_e7";
		
		
		private static var _instance:SupermarketClient;
		private static const ExtensionName:String = "SuperMarketExtension";
		
		public function SupermarketClient()
		{
		}
		
		public static function get instance():SupermarketClient
		{
			if (_instance == null)
			{
				_instance = new SupermarketClient();
			}	
			
			return _instance;
		}
		
		public function flushRichMan(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_VIP_FLUSH_RICHMAN,callBack);
		}
		
		public function getMagnateTop(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_MAGNATE_TOP,callBack);
		}
		
		public function getUserRichManInfo(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_USER_RICHMAN_INFO,callBack);
		}
		
		public function startRichmanChanllenge(index:int, shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_START_RICHMAN_CHALLENGE,callBack, {"index":index, "sid":shopId});
		}
		
		public function onFirstTimeOpenBallon(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_THE_FIRST_TIME_OPEN_BALLON,callBack);
		}
		
		public function onTakeBallonADBonus(shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_TAKE_BALLON_AD_BONUS,callBack,{"sid":shopId});
		}
		
		public function onStartBallonAD(hour:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_START_BALLON_AD,callBack,{"hour":hour});
		}
		
		public function onLvUpBallon(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_LVUP_USER_BALLON,callBack);
		}
		
		public function onLeaveSupermarket():void
		{
			this.sendXtMsgAndCallBack2(CMD_USER_QUIT_SUPERMARKET);
		}
		
		public function onBuyBack(items:String, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_BUY_BACK,callBack,{"items":items});
		}
		
		public function unlockShopFloorBlock(shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_UNLOCK_SHOP_FLOOR_BLOCK_GRIDS,callBack,{"sid":shopId});
		}
		
		public function removeSellGoodsPartner(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_REMOVE_SUPERMARKET_SELL_GOODS_PARTNER,callBack);
		}
		
		/**
		 * 雇佣理货员
		 * @param userName ""默认为系统理货员
		 * @param callBack partner:SupermarketAssistantData
		 * 
		 */			
		public function buySellGoodsPartner(userName:String, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_BUY_SUPERMARKET_SELL_GOODS_PARTNER,callBack,{"user":userName});
		}
		
		/** 
		 * 补货换货
		 */		
		public function supplyShelfGoods(shopId:int,ugid:int,goodsId:int,callBack:Function):void
		{
			this.sendXtMsgAndCallBack2(CMD_ADD_OR_CHANGE_GOODS_TO_CABINET,callBack,{"sid":shopId,"ugid":ugid.toString(),"gsid":goodsId});
		}
		
		/**
		 * 增加商店，返回suc
		 * @param shopId
		 * 
		 */		
		public function addShop(shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_ADD_SHOP,callBack,{"sid":shopId});
		}
		/**
		 * 升级货架，返回suc
		 * @param shopId
		 * @param ugid 货架标识，后端决定
		 * 
		 */		
		public function lvUpShelf(shopId:int, ugid:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_LVUP_GOODS_CABINET,callBack,{"sid":shopId, "ugid":ugid.toString()});
		}
		/**
		 * 移除货架，和格子装饰物
		 * @param shopId
		 * @param index 位置
		 * 
		 */		
		public function removeShelf(shopId:int,index:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_REMOVE_GOODS_CABINET,callBack,{"sid":shopId,"index":index});
		}
		/**
		 * 装饰商店，
		 * @param shopId
		 * @param changeinfo  		// oldIndex,newIndex,itemId,itemAngle | oldIndex,newIndex,itemId,itemAngle
		 * 
		 */		
		public function decorateShop(shopId:int,changeinfo:String, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_DECORATE_SHOP,callBack,{"sid":shopId, "changeinfo":changeinfo});
		}
		/**
		 * 迎客，
		 * @param shopId
		 * 返回ret
		 */		
		public function startWelcomeGuests(shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_START_WELCOME_GUESTS,callBack,{"sid":shopId});
		}
		/**
		 * 结束迎客，
		 * @param shopId
		 * @param goodsgridsinfo
		 * @param solditemsinfo
		 * 返回ret
		 */		
		public function endWelcomeGuests(shopId:int, goodsgridsinfo:String, solditemsinfo:String, pefectCount:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_END_WELCOME_GUESTS,callBack, {"goodsgridsinfo":goodsgridsinfo,"solditemsinfo":solditemsinfo,"sid":shopId,"pc":pefectCount});
		}
		/**
		 * 获得商店数据
		 * @param user   用户名
		 * @param shopId  为0时最后一个商店
		 * 
		 * 返回 res：base,  lock  + value ;
		 * 			shopfloorgrids,  index + ugid;
		 * 			userfloorgrids  ugid + iid +　iangle　+　ilv+gid +gnum
		 */		
		public function getUserShopInfo(user:String, shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_USER_SHOPINFO,callBack,{"user":user, "sid":shopId});
		}
		/**
		 * 
		 * @param shopId
		 * return res  guest, count + lastTime
		 * 			   queue//升级队列  index + nextUseTime + deadline 			   
		 */		
		public function getMyShopOtherInfo(shopId:int, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_MY_SHOP_OTHER_INFO, callBack, {"sid":shopId});
		}
		
		/**
		 *获得他人用户数据 
		 * @param user
		 */		
		public function getOtherUserInfo(user:String, callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_OTHER_BASE_INFO, callBack, {"user":user});
		}
		/**
		 * 获取自己用户数据
		 */		
		public function getMyUserInfo(callBack:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_MY_BASE_INFO, callBack);
		}
		
		
		public function getMySupermarketItemInfos():void
		{
			this.sendXtMessage(CMD_GET_MY_SUPERMARKET_ITEMS, {});
		}
		
		public function getUnlockGoodsIds(callback:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_MY_UNLOCK_GOODS, callback);
		}
		
		public function unlockGoods(goodsId:int, callback:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_UNLOCK_GOODS, callback, {"gid":goodsId});
		}
		
		/**
		 *批量购买货物
		 * @param items(id-num,id-num)
		 */	
		public function buyGoods(items:Array, callback:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_BUY_GOODS, callback, {"items":StringUtil.join(items, ",")});
		}
		
		public function getBuddyInfos(callback:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_BUDDIES_EXP, callback);
		}
		
		public function getNewMsg(callback:Function):void{
			this.sendXtMsgAndCallBack(CMD_GET_HOT_NEWS_MSGS, callback);
		}
		public function getGameMsg(offset:int, length:int, callback:Function):void{
			var params:Object = {"offset":offset, "length":length};
			this.sendXtMsgAndCallBack(CMD_GET_GAME_MSGS, callback, params);
		}
		public function getManageMsg(offset:int, length:int, callback:Function):void{
			var params:Object = {"offset":offset, "length":length};
			this.sendXtMsgAndCallBack(CMD_GET_MANAGE_MSGS, callback, params);
		}
		
		public function gainPay(msgId:Number, callback:Function):void
		{
			var params:Object = {"mid":msgId.toString()};
			this.sendXtMsgAndCallBack(CMD_TAKE_EMPLOYEE_BONUS, callback, params);
		}
		
		public function useProp(id:int, num:int, ext:String, callback:Function):void
		{
			var params:Object = {"id":id, "num":num, "ext":ext};
			this.sendXtMsgAndCallBack(CMD_USE_PROP, callback, params);
		}
		
		public function getDailyInfo(callback:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_GET_DAILY_CHECKIN_INFO, callback);
		}
		
		public function dailyCheckIn(callback:Function):void
		{
			this.sendXtMsgAndCallBack(CMD_DAILY_CHECK_IN, callback);
		}
		
		public function clear5MinQueuecd(index:int, callback:Function):void
		{
			var params:Object = {"index":index};
			this.sendXtMsgAndCallBack(CMD_CLEAR_USER_GOODS_CABINET_LVUP_QUEUECD, callback, params);
		}
		
		public function takeDairyBonus(type:int, index:int, sid:int, callback:Function):void
		{
			var params:Object = {"type":type, "index":index, "sid":sid};
			this.sendXtMsgAndCallBack(CMD_TAKE_DAILY_CHEST_BONUS, callback, params);
		}
		
		public function sendBI(index:int):void
		{
			this.sendXtMessage(CMD_BI, {"index":index});
		}
		
		public function getUserExp(callback:Function):void{
			this.sendXtMsgAndCallBack(CMD_GET_USER_EXP, callback);
		}
		
		//不可连续调用。。。
		private function sendXtMsgAndCallBack(cmd:String, onCallBackFun:Function=null, paramObj:*=null):void
		{
			ProgressFullSprite.show(false, LayerManager.getCurrentLayerTop());
			SocketClient.instance.sendXtMsgAndCallBack(ExtensionName, cmd, function(params:Object):void{
				ProgressFullSprite.close();
				onCallBackFun.apply(null, [params]);
			}, paramObj);
		}
		
		private function sendXtMsgAndCallBack2(cmd:String, onCallBackFun:Function=null, paramObj:*=null):void
		{
			SocketClient.instance.sendXtMsgAndCallBack(ExtensionName, cmd, onCallBackFun, paramObj);
		}
		
		
		private function sendXtMessage(cmd:String, params:Object):void
		{
			ExtMessageClient.instance.sendXtMessage(ExtensionName, cmd, params);
		}
	}
}