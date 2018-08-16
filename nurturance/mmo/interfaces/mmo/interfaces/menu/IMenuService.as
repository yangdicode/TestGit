package mmo.interfaces.menu
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IMenuService extends IDownloadInitService
	{
		function showAoyaLifeGuid():void;
		function closeAoyaLifeGuid():void;
		
		function showApp(index:int = 0):void;
		function closeApp():void;
	}
}