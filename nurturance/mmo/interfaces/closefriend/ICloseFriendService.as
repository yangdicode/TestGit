package mmo.interfaces.closefriend
{
	import mmo.framework.domain.closefriend.CloseFriendDbInfo;
	import mmo.interfaces.IInitService;

	public interface ICloseFriendService extends IInitService
	{
		/**
		 * 是否显示强制弹框
		 */
		function setTipsVisible(value:Boolean):void;
		/**
		 * 申请密友
		 */
		function combine():void;
		/**
		 * 解除密友
		 */
		function broke():void;
		/**
		 * 誓言区
		 */
		function oathPanel():void;
		
		function howToPanel():void;
		function rankPanel():void;
		function changeZoneInvite(params:Object):void;
		function changeZoneBreak():void;
		
		/**
		 * 无法知道当前是否是花园？？那加在花园场景里面吧
		 */
		function enterGarden():void;
		
		/**
		 * 收礼记录
		 */
		function receiveGiftPanel(user:String):void;
		/**
		 * 结婚证
		 */
		function cerfiticatePanel(info:CloseFriendDbInfo):void;
		
		function sendSelfGift():void;
		function sendOtherGift(gid:int):void;
	}
}