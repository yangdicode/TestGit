package mmo.interfaces.aoyacircle
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IAoYaCircleService extends IDownloadInitService
	{
		/**
		 *	是否建立奥雅圈
		 */		
		function hasBuiltCircle():Boolean;
		
		/**
		 *	进入系统场景
		 */		
		function enterScene():void;
		
		/**
		 *	建立奥雅圈，添加好友
		 */		
		function tryBuiltCircle():void;
		
		/**
		 *	获取奥雅圈面板，（用于分享） 
		 * @param callBack	回调，参数sp：Sprite
		 * @param userName 用户名，默认自己
		 * 
		 */		
		function tryGetUserAoYaCirclePanel( callBack:Function, userName:String=""):void;
		
		/**
		 *	打开奥雅圈 
		 * @param userName userName
		 * 
		 */		
		function showAoYaCircle( userName:String="" ):void;
		
		/**
		 *	申请缔结姐妹关系 
		 * @param userName userName
		 * 
		 */		
		function tryApplySister( userName:String ):void;
		
		/**
		 * 进入制衣间，打开梦幻制衣间的主面板
		 */		
		function showMakeClothcHouse( userName:String="" ):void;
		
		/** 各种活动面板 **/
		function showCommonPanel( key:String, params:Object=null ):void;
		
		/**
		 *	请求结成姐妹 
		 * @param sender 发起者
		 * @param ctOverTime 请求到期时间 
		 */		
		function showSisterRequest( sender:String, ctOverTime:Number ):void;
		/**
		 * 接受请求结成姐妹
		 * @param sender 发起者
		 */		
		function showSisterAccept( sender:String):void;
		/**
		 *	解除姐妹关系 
		 * @param sender 发起者
		 * @param isLogin 是否因为超过期限没登录(0否，1是)
		 * @param strName 超过期限未登陆玩家名
		 * 
		 */		
		function showSisterRelieve( sender:String, isLogin:Boolean, strName:String = "" ):void;
		
		/**
		 *	缔结姐妹成功(自动接受) 
		 * @param sender 跟谁缔结
		 * 
		 */		
		function showSisterSuccess( sender:String):void;
		
		/**
		 *是不是我的妹妹
		 */		
		function isMyYuongSister( userName:String ):Boolean;
		/**
		 *是不是我的姐姐
		 */	
		function isMyOlderSister( userName:String ):Boolean;
		
		/**
		 *	进入制衣间（一不小心写多了一个，跟showMakeClothcHouse一样的功能）
		 */		
		function enterMakeClothesScene(userName:String = ""):void;
		
		/**
		 *	是不是老司机
		 */		
		function isOldPlayer():Boolean;
				
		/**
		 *	是不是申请自立门户才成为老司机的
		 */	
		function isApplyToBeOldPlayer():Boolean;
		
		/**
		 *	是否已经结交师徒
		 */	
		function hasAnySister():Boolean;
	}
}