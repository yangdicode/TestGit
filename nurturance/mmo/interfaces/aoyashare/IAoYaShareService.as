package mmo.interfaces.aoyashare
{
	import flash.display.DisplayObject;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface IAoYaShareService extends IDownloadInitService
	{
		function showAoyaSharePanel(id:int, shareWord:String="", params:*=null, extUI:DisplayObject=null):void;
	}
}