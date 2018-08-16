package mmo.interfaces.notify
{
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface INotifyService extends IDownloadInitService
	{
		function setControlBarButton(button:DisplayObject):void;
		
		function getOfflineMsgByType(type:int):Array;
		
		function showNotifyUI():void;
		
		function getNewMsgNum():int;
	}
}