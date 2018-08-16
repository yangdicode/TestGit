package mmo.interfaces.tower
{
	import mmo.interfaces.IDownloadInitService;

	public interface ITowerService extends IDownloadInitService
	{
		/**
		 * 显示迷镜隧道入口面板
		 */
		function showTowerEntrancePanel():void;
		/**
		 * 显示好友前五 
		 */
		function showBuddyTopFive():void;
		/**
		 * 显示排行榜 
		 */		
		function showLadder():void;
		
		/**
		 * 显示礼物兑换面板 
		 * 传入的参数是默认显示的sheet的序号……
		 * 不想在外面搞个这么无聊的常量了……
		 * 自己打开美术元件从上数到下吧……
		 * 0开始……
		 */		
		function showExchangePanel(panelIndex:int = 0):void;
		/**
		 * 获取最大极限模式的层数 
		 */		
		function getMaxChanllengeLevel():int;
		/**
		 * 是否在塔内，假如在塔内是什么模式。
		 * "Outside"不在塔内
		 * "Free"在自由模式
		 * "Limit"在极限模式
		 */		
		function get towerMode():String;
		/**
		 * 获取用户今天是否已经打过任意5层塔BOSS
		 * 回调函数 fuc(bool)
		 */
		function getPassTowerFreeState(fuc:Function):void;
		
		/**
		 *显示兑换胜利奖章 
		 */		
		function showWinMedalPanel():void;
			
			
	}
}