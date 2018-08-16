package mmo.interfaces.buddy {
	
	import flash.display.MovieClip;
	
	import mmo.interfaces.IService;

	public interface IBuddyListService extends IService {
		function showPanel(name:String, params:Object = null):void;
		function closePanel(name:String):void;
		
		/**
		 * 亲密度说明面板
		 */
		function showFriendShipHelpPanel(callBack:Function=null):void;
		/**
		 * 送礼收礼排行榜
		 */
		function showGiftRankPanel():void;
		
		/**
		 * 亲密度排行榜
		 */
		function showFriendShipRankPanel():void;
		
		/**
		 * 交友愿望墙
		 */
		function showFriendWishPanel():void;
		
		/**
		 * 如何组队
		 */
		function showMakeTeamPanel(callBack:Function=null):void;
		
		/**
		 *	赠送好友礼物面板 
		 * @param userName 好友名称
		 */		
		function showSendGiftPanel(userName:String):void;
			
	}
	
}