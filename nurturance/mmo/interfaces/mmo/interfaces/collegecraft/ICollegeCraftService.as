package mmo.interfaces.collegecraft
{
	import mmo.interfaces.IDownloadInitService;

	public interface ICollegeCraftService extends IDownloadInitService
	{
		/**
		 * 各种弹活动面板
		 * @param key
		 * @param params
		 *
		 */		
		function showPanel(key:String, params:* = null):void;

		/**
		 * 	检查显示加入阵营的面板，主要用于其他活动需要判断玩家没有加入阵营
		 * 1、未加入阵营，先弹出选择跳转面板
		 * 2、已经加入，会直接调用callBack
		 * @param callBack 加入阵营完成之后调用
		 * @openStart 这个参数暂时没用
		 *
		 */			
		function checkShowJionCampPanel(callBack:Function = null, openStart:Boolean = true):void;

		/**
		 * 显示加入阵营面板
		 * @param callBack 加入阵营完成之后调用
		 * @openStart 这个参数暂时没用
		 */		
		function showJionCampPanel(callBack:Function = null, openStart:Boolean = true):void;

		/**
		 *	主面板，如果没有加入阵营，则会先选阵营
		 */		
		function showCollegeCraftPanel():void;

		/**
		 *	打开排行榜，如果没有加入阵营，则会先选阵营
		 */	
		function showTopPanel(callBack:Function = null):void;

		/** 当前是否加入阵营 **/
		function hasJoinCamp():Boolean;

		/** 当前的阵营是不是某阵营 **/
		function isJionCamp( campId:int ):Boolean;

		/** 某阵营的名称 **/
		function getCampName( campId:int ):String;

//		/**
//		 *	 某阵营 总积分(显示积分)
//		 */		
//		function getCampMark( campId:int , crownIndex:int):int;

		/** 所有阵营积分 **/
		function getAllCampMark():Array;

		/**获取该阵营的积分**/
		function getCampScore(campId:int):int;

		/**获取阵营的排行 从1开始**/
		function getCampRow(campId:int):int;

		/**
		 *	当前加入哪个阵营id
		 * @return 0-没加；
		 */		
		function getMyCampId():int;

		/** 自己阵营的名称 **/		
		function getMyCampName():String

		/**
		 *	自己对当前阵营的贡献值
		 */		
		function getMyTotalMark():int;

		/**
		 * 	自己的代币数量,主要用于兑换
		 */		
		function getMyTotalGitemNumber():int;

		/**
		 * 显示抽奖面版
		 */		
		function showLotteryPanel():void;

		/**
		 * 显示颁奖面板
		 * */
		function showAwardPanel():void;

		/**
		 * 每日打开面板获得奖励
		 * */
		function takeDailyHuodongBonus( huodongId:int, callBackFunc:Function=null ):void;


	}
}

