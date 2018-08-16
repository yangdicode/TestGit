package mmo.interfaces.vip
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IService;

	public interface IVipPanelService extends IService
	{
		/** 
		 * 初始化
		 * */
		function initVip():void;
		
		/**
		 * vip主界面
		 */
		function showAlreadyVipPanel(container:Sprite=null, x:Number = 0, y:Number = 0):void;
		/**
		 * 非vip主界面
		 */
		function showGeneralPanel(container:Sprite=null, x:Number = 0, y:Number = 0):void;
		/**
		 * vip最新消息面板
		 */
		function showNewlyPanel(container:Sprite=null, x:Number = 0, y:Number = 0):void;
		/**
		 * vip礼包
		 */
		function showGiftPanel(container:Sprite=null, x:Number = 0, y:Number = 0):void;
		/**
		 * vip特权
		 */
		function showVipPrivilagePanel(container:Sprite=null, x:Number = 0, y:Number = 0):void;			
		/**
		 * 消费记录查询
		 */
		function showRecordQueryPanel(container:Sprite=null, x:Number = 0, y:Number = 0):void;
		/**
		 * 副本宝箱面板
		 */
		function showFBGiftBox(onClickGet:Function, container:Sprite=null, x:Number = 0, y:Number = 0):void;
		/**
		 * 打开成为神羽骑士页面
		 * @param pn:充值入口：1.首充活动2.基础系统入口3.运营活动入口
		 */
		function showRechargePage(pn:int = 2):void;
		/**
		 * 打开充值奥币页面
		 * @param pn:充值入口：1.首充活动2.基础系统入口3.运营活动入口
		 */
		function showChargePage(pn:int = 2):void;
		/**
		 * 打开多多卡售卖点页面
		 */
		function showDuoDuoCardSalesPlace():void;
		/**
		 * 弹出已经康复的提示框
		 */
		function showAlreadyHealthyMessage():void;
		/**
		 * 弹出不用康复的提示框
		 */
		function showNoNeedHealMessage():void;
		/**
		 * 充值vip成功提示
		 */
		function showBeVipSuccessMessage(callback:Function=null):void;
		/**
		 * 不是vip无法享受特权提示
		 */
		function showNotVipMessage():void;
		/**
		 * vip快要过期提示
		 */
		function showVipOverdueMessage():void;
		/**
		 * 获取vip礼包的获取状况，等级、每周、每月
		 */
		function getVipGiftGotStatus(callback:Function):void;
		/**
		 * vip邀请消息面板
		 */
		function showVipInvitePanel():void;
		/**
		 * vip已经过期提示
		 */
		function showAlreadyOverdueMessage():void;
		/**
		 * 澳币兑换羽币
		 */
		function showAobiExhcangeYubiPanel(layer:Sprite = null,defaultSheet:int=0):void;
		/**
		 * 团队回血消息
		 */
		function showTeamRecoverMessage(byWho:String):void;
		/**
		 * vip快速成长消息面板
		 */
		function showVipGrowPanel():void;
		/**
		 * vip消息面板
		 */
		function showVipPanel():void;
		/**
		 * vip消息面板
		 */
		function showVipPanel2():void;
		/**
		 * 是否领取了某个等级的vip礼包
		 * */
		function hadGotVipLevelGift(level:int):Boolean;
		
		/**
		 * 打开昵称更改面版
		 */		
		function showModifyNickNamePanel():void;
		
		/**
		 * 显示续费vip奖励面板(每月好礼)。month = -1为当月。
		 */
		function showVipRechargeGiftPanel(month:int = -1):void;
		
		/**
		 * 登录后自动弹出每月好礼
		 */		
		function autoShowVipRechargeGiftAfterLogin():void;
		
		/**
		 *	vip等级礼包 
		 * @param defaultLv 需要显示的等级，默认为0,人物vip当前等级
		 * 
		 */		
		function showVipLvGiftPanel(defaultLv:int=0):void;
		
		/**
		 * 神羽礼包——最新活动面板
		 */		
		function showVipGiftNewlyPanel():void;
		
		/**
		 * 首充好礼图标：2014年7月16日10:09:40
		 */		
		function checkAndAddNewRechargeIcon():void;
		/**
		 * 首充好礼面版：2014年7月17日23:04:57
		 */	
		function showNewReghargeGift():void;
		/**
		 * 新手一元购图标:
		 */	
		function addFreshIcon():void;
		
		/**
		 * 神羽相关的运营功能面板
		 */		
		function showCommonPanel( key:String, params:* = null ):void;
		
		/**
		 * 神羽骑士即将过期提示————斯塔那的温馨提示
		 */		
		function showOverdueVipPanel():void;
		
	}
}