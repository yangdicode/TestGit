package mmo.interfaces.buddy {
	
	import flash.events.IEventDispatcher;
	
	import mmo.interfaces.IInitService;
	
	public interface IBuddyDocService extends IInitService, IEventDispatcher {
		/**
		 * 获得好友列表
		 * @return Array
		 * 		Array[i].name 用户名称
		 * 		Array[i].isOnline 是否在线
		 * 		Array[i].memberType 用户类型
		 *  	Array[i].friendShip 好友亲密度
		 * 		Array[i].incFriendship 新增好友亲密度
		 */
		function getBuddyList():Array;
		
		/**
		 * 用户列表数据都是buddy类型的数组，上面那个方法就不要用了
		 */
		function getBuddyClassList():Array;
		
		/**
		 * 获得房间用户列表
		 * @return Array
		 * 		Array[i].name 用户名
		 * 		Array[i].id 用户ID
		 * 		Array[i].isOnline=true
		 * 		Array[i].isBlock=false
		 * 		Array[i].memberType 用户类型，取自User.getMemberType();
		 */
		function getUserList():Array;
		
		/**
		 * 获得黑名�?
		 * @return Array
		 * 		Array[i].name 用户名
		 */
		function getBlockList():Array;
		
		/**
		 * 获得好友的小屋更新时间列表
		 * @return Array
		 * 		Array[i].name 用户名
		 * 		Array[i].date 更新时间，Long型
		 */
		function getBuddyHousesUpdateDateList():Array;
		
		/**
		 * 检查某用户是否在黑名单中
		 * @param name:String 用户名
		 * @return true=用户在黑名单中 false=用户不在黑名单中
		 */
		function isBlock(name:String):Boolean;
		
		/**
		 * 设置好友的黑名单状态
		 * @param name:String 好友用户名
		 * @param isBlocked:Boolean 是否被加入黑名单
		 */
		function setBuddyBlockStatus(name:String, isBlocked:Boolean):void;
		
		/**
		 * 检查某用户是否在好友列表中
		 * @param name:String 用户名
		 * @return true=用户在好友列表中 false=用户不在好友列表中
		 */
		function isBuddy(name:String):Boolean;
		
		/**
		 * 检测好友数目是否到达上限自动弹出对话框
		 * @return true=已经到达上限   false=未到达上限
		 */
		function checkMyBuddyQuantity():Boolean;
		
		/**
		 * 设置好友分组
		 * @param name:String 用户名
		 * @param group:int 分组
		 */
		function setBuddyGroup(name:String, group:int):void;
		
		/**
		 * !!!在客户端添加好友，并刷新好友列表!!!
		 * 
		 * @param	name	用户名
		 */
		function addBuddyAtClientOnly(name:String):void;
		
		/**
		 * 获取当前的好友请求队列
		 *
		 * @param sender 用户名
		 */
		function getBuddyPermissionList():Array;
		
		/**
		 * 发送添加对方为好友的请求
		 * @param buddyName:String 好友用户名
		 */
		function sendAddBuddyRequest(buddyName:String);
		
		/**
		 * 发送获取好友位置的请求
		 * @param buddyName:String 好友用户名
		 */
		function seedGetBuddyLocation(buddyName:String):void;
		
		/**
		 * 发送“是否接受好友添加请求”的回复
		 * @param accept:Boolean 是否接受对方请求
		 * @param buddyName:String 回复的好友用户名
		 */
		function sendBuddyPermissionResponse(accept:Boolean,buddyName:String):void;
		
		/**
		 * 删除好友
		 * @param targetBuddy:String 想要删除的好友用户名
		 */
		function removeBuddy(buddyName:String):void;
		
		/**
		 * 删除好友
		 * @param buddys:Array 想要删除的好友用户名
		 */
		function removeBuddys(buddys:Array):void;
		
		/**
		 * 获取同意添加好友回复队列
		 */
		function getBuddyPermissionAcceptedList():Array;
		
		/**
		 * 从同意添加好友回复队列中，移除某个指定的项
		 */
		function removeItemFromBuddyPermissionAcceptedList(buddyName:String):void;
		
		/**
		 * 显示好友请求窗口
		 */
		function showBuddyRequestPanel():void;
		
		/**
		 * 显示好友请求确认窗口
		 */
		function showBuddyRequestAcceptedPanel(userId:String):void;
		
		/**
		 * 判断好友是否在线
		 */
		function isOnline(buddyName:String):Boolean;
		
		/**
		 * 获得自己的用户名
		 */
		function get myUsername():String;
		
		/**
		 * 验证各种信息后添加好友
		 * @param userName
		 */		
		function checkAndAddBuddy(buddyName:String):void;
		
		/**
		 * 打开交友愿望墙
		 */
		function showBuddyGiftWishPanel():void;
	}
	
}