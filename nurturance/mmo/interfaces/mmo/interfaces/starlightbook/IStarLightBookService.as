package mmo.interfaces.starlightbook
{
	import mmo.interfaces.IDownloadInitService;

	public interface IStarLightBookService extends IDownloadInitService
	{
		function showStarLightMain():void;
		
		function showStarLightBook(quarter:int=1, currPage:int=1):void;
		
		function showMvLyric():void;
		
		function showAoYaFilm():void;
	}
}