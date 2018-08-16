package mmo.interfaces.collegeprefession
{
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IInitService;
	
	public interface ICollegeProfessionService extends IInitService
	{
		/**
		 *	打开职业的核心玩法面板 
		 * @param id 职业id
		 */		
		function showProfessionMainGamePanel(id:int=1):void;
		
		/**
		 *	加入职业面板 
		 * @param id 职业id
		 * @param callBack 加入职业后的面板
		 */		
		function showJoinProfessionPanel(id:int=1,callBack:Function=null):void;
		
		/**
		 *	个人信息面板 
		 * @param id 职业id
		 */		
		function showMyInfoPanel(id:int=1):void;
		
		/**
		 *	职业训练
		 * @param id 职业id
		 */	
		function showProfessionTrainPanel(id:int=1):void;
		
		/**
		 *	每日任务
		 * @param id 职业id
		 */	
		function showDailyTaskPanel(id:int=1):void;
		
		/**
		 *	职业挑战
		 * @param id 职业id
		 */	
		function showProfessionChallengePanel(id:int=1):void;
		
		/**
		 *	排行榜
		 * @param id 职业id
		 */	
		function showTopRankPanel(id:int=1):void;
		
		/**
		 *	兑换面板
		 * @param id 职业id
		 */	
		function showExchangePanel(id:int=1):void;
		
		/**
		 *	是否加入这个职业
		 * @param id 职业id
		 */		
		function hasJoinProfession(id:int):Boolean;
		
		/**
		 *	某职业当前的经验值
		 * @param id 职业id
		 */	
		function getProfessionCurExp(id:int):int;
		
		/**
		 *	某职业当前的等级
		 * @param id 职业id
		 */	
		function getProfessionCurLv(id:int):int;
		
		/**
		 * 获取职业图标
		 * proId 为 0 时候，图标为问号
		 */		
		function getProIcon(proId:int,width:Number,height:Number):DisplayObject;
		
		
	}
}