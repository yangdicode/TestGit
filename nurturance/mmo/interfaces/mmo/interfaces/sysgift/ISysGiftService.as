package mmo.interfaces.sysgift
{
	import mmo.interfaces.IInitService;
	
	public interface ISysGiftService extends IInitService
	{
		/** 打开职业等级礼包 */
		function showProLvGiftPanel():void;
				
		/** 打开在线时长礼包 **/
		function showOnlineGiftPanel():void;
				
		/** 打开奥雅礼包 **/
		 function showAoyaGiftPanel():void;
		 
		 /** 领取vip等级礼包接口，vipservice木有接口，在这边弄个用着先 **/
		 function tryGetVipLevelGift():void;
		 
		 /**
		 * 有当前职业等级礼包可领取
		 */
		 function canGetProGift():Boolean;
			 	 
		 /**
		 * 打开每日签到面板
		 * */
		 function showSigninPanel():void;
	}
}