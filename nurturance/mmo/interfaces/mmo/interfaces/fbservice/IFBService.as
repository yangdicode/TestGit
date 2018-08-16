package mmo.interfaces.fbservice
{
	import mmo.framework.domain.battle.BattleParams;
	import mmo.interfaces.IDownloadInitService;

	public interface IFBService extends IDownloadInitService
	{
		/**
		 * 加入副本。
		 */
		function joinFB(fbName:String, fbScene:String, fbLevel:int = 0):void;
		/**
		 * 加入好感度副本。
		 */		
		function joinFavorFB(fbName:String, fbScene:String, fbLevel:int = 0):void;
		/**
		 * 离开副本
		 */
		function leaveFB():void;
		/**
		 * 创建符合当前副本难度的怪物战斗 
		 * 其实就是不用多写一句getMonsterLv了……
		 */		
		function createMonsterBattle(monsterId:int, battleParams:BattleParams = null):void;
		/**
		 * 获取当前难度下某个怪物的等级。
		 * 只适用于同一个副本内同一难度同一种怪物只有一个等级的情况。
		 * 假如出现同难度副本中同Id怪物出现多个等级的话请自己处理……
		 */		
		function getMonsterLv(monsterId:int):int;
		/**
		 * 获得当前副本的奖励 
		 */		
		function getBonus():void;
		/**
		 * 获取团队副本奖励。 
		 */		
		function getTeamBonus():void;
		/**
		 * 获得好感度副本奖励
		 */		
		function getFavorBonus(callBack:Function):void
		/**
		 * 显示副本难度选择的面板 
		 */		
		function showEntrancePanel(fbName:String):void;
		/**
		 * 当前副本名字 
		 */		
		function get curFBName():String;
		/**
		 * 当前副本难度等级
		 */		
		function get curFBLevel():int;
		/**
		 * 获取是否正在副本中。 
		 */		
		function get isInFB():Boolean;
		/**
		 * 显示副本兑换面版
		 */		
		function showExchangePanel(fbName:String):void;
		
		function showFavorFBPanel(favorFBId:int):void;
		
		function get fbId():int;
	}
}