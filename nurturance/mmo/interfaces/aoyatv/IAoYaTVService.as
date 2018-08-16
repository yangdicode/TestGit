package mmo.interfaces.aoyatv
{
	import flash.display.DisplayObject;
	
	import mmo.framework.domain.aoyatv.IUserAoYaTVCinemaWord;
	import mmo.framework.domain.aoyatv.UserAoYaTVCinemaWord;
	import mmo.interfaces.IDownloadInitService;
	
	public interface IAoYaTVService extends IDownloadInitService
	{
		function enterAoYaTV():void;
		
		/**
		 * type 详见AoYaTVLevelTypes
		 */
		function getLv(type:int):int;
		
		function enterShop(tab:int=0):void;
		
		function enterCinema(tab:int=0):void;
		
		function showBookPage(tab:int, page:int):void;
		
		function showWorks(userName:String=""):void;
		
		/**
		 * 作品封面缩略图
		 */
		function getWorkCoverThumbnail(width:Number, height:Number, cover:String):DisplayObject;
		
		/**
		 * 作品封面图
		 */
		function getWorkCover(width:Number, height:Number, cover:String):DisplayObject;
		
		/**
		 * 查看已完成的作品
		 */
		function lookOverWork(userWord:IUserAoYaTVCinemaWord, endFunc:Function=null, midExitFunc:Function=null):void;
		
		/**
		 * 评价作品
		 * endFunc 传入评价分数1-10
		 */
		function appraiseFilm(userWord:IUserAoYaTVCinemaWord, endFunc:Function=null, midExit:Function=null):void;
		
		/**
		 * 影视工厂
		 */
		function showFactory():void;
		
		function enterHonorCenter(startTab:int=0):void;
		
		function debugMakeAoYaTheatre():void;
	}
}