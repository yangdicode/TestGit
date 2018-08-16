package mmo.interfaces.supermodel
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface ISuperModelService extends IDownloadInitService
	{
		/**  系统入口 **/
		function enterSuperModel():void;
		
		/** 主面板 **/
		function showMain():void;
		
		/** PK面板 **/
		function showPK():void;
		
		/** 杂物面板 **/
		function showPanel( key:String, params:* = null):void;
		
		function checkJoin(onCheck:Function = null):void;
	}
}