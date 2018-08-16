package mmo.interfaces.band
{
	import flash.display.MovieClip;
	
	import mmo.interfaces.IDownloadInitService;

	public interface IBandService extends IDownloadInitService
	{
		/**
		 * 检测加入乐团
		 */
		function checkTobeMember(callBack:Function=null):void;
		function instrumentPanel():void;
		function setSideUI(ui:MovieClip):void;
		
		/**
		 * 表现力
		 */
		function get power():int;
		
		/**
		 * 技巧
		 */
		function get skill():int;
		
		/**
		 * 某个等级的乐器数目
		 * lv 从1开始
		 */
		function getInstrumentNum(lv:int):int;
	}
}