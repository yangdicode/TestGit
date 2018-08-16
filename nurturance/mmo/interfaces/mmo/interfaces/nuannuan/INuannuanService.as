package mmo.interfaces.nuannuan
{
	import mmo.framework.domain.nuannuan.NuanScoreEnum;
	import mmo.framework.domain.union.config.UnionTaskDefine;
	import mmo.interfaces.IDownloadInitService;
	import mmo.interfaces.IService;
	
	public interface INuannuanService extends IDownloadInitService
	{
		/**
		 * 站在某个id的任务上。
		 */		
		function enterNuannuan(taskId:int = 0):void;
		
		/**
		 * 完成任务数量，F以上都为完成任务
		 */		
		function get finishTaskNum():int;
		
		/**
		 * 获得某评价的任务数量
		 */		
		function getTaskNumByGrade(grade:NuanScoreEnum):int;
		
		/**
		 * 获得某评价以上的任务数量
		 */		
		function getTaskNumAboveGrade(grade:NuanScoreEnum):int;
		
		/**
		 * 某任务的评价
		 */		
		function getGradeByTask(taskId:int):NuanScoreEnum;
		
		/**
		 * 获得某地图某评价的任务数量
		 */		
		function getTaskNumInMapByGrade(mapId:int, grade:NuanScoreEnum):int;
		
		/**
		 * 获得某地图某评价以上的任务数量
		 */	
		function getTaskNumInMapAboveGrade(mapId:int, grade:NuanScoreEnum):int;
		
		function showExchange():void;
		
		/** 查看海选 */
		function viewUserMatch(userName:String):void;
		/** 投票海选 */
		function voteUserMatch(userName:String):void;
		/** 海选面版 */
		function showMatch():void;
		/** 决赛投票  */	
		function showFinalMatch():void;
		/** 决赛搭配  */		
		function startFinalMatch():void;
		
		/** 宝典  */	
		function showNuanBook():void;
		
		function showPanel(key:String, params:* = null):void;
		
		function enterUnionNuanTask(utd:UnionTaskDefine):void;
		
		function test():void;
		
	}
}