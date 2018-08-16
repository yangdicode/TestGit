package mmo.interfaces.arena
{
	import mmo.interfaces.IDownloadInitService;

	public interface IArenaService extends IDownloadInitService
	{
		/**
		 * 打开竞技场面板
		 */
		function showArenaPanel():void;
		/**
		 * 打开排名面板
		 */
		function showRankPanel():void;
		
		function tryShowTopBonus():void;
		
		function showCom():void;
		
		function showNewYearArena():void;
	}
}