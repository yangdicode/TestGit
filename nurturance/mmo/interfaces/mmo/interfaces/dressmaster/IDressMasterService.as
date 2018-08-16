package mmo.interfaces.dressmaster
{
	import flash.display.MovieClip;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface IDressMasterService extends IDownloadInitService
	{
		/**
		 * 进入系统，打开主面板(我的作品库)
		 */		
		function enterDressMaster():void;
		
		/**
		 *比赛面板 
		 * @param defaultSheet 0-参赛作品；1-当前排名；2-历史第一
		 * 
		 */		
		function showMatchPanel( defaultSheet:int=0 ):void;
		
		/**
		 *成就跟奖励面板
		 * @param defaultSheet 0-新手奖励；1-成就奖励；2-兑换服装
		 */		
		function showBonus( defaultSheet:int=0 ):void;
		
		/**
		 * 最新公告
		 */		
		function showPoster():void;
		
		/**
		 * 查看用户的所有作品 
		 * @param userName
		 */		
		function showUserDesignInfo( userName:String = "" ):void;
		
		function showDesignDetailPanel( designId:int ):void;
		
		function debugDressMasterDesign():void;
		
		function initLastTopDesign( mcIcon:MovieClip ):void;
		
		function showPanel(name:String, params:* = null):void;
		
		/**
		*	显示作品形象
		**/
		function initDesignIcon( mcContainer:MovieClip, strInfo:String, w:Number = 160, h:Number=290 ):void;
		
		/** 当周是否有作品参赛 **/
		function isCurWeekInMatch():Boolean;
	}
}