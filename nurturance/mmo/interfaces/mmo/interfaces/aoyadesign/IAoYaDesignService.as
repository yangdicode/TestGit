package mmo.interfaces.aoyadesign
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IAoYaDesignService extends IDownloadInitService
	{
		/**
		 * 奥雅设计馆主面板
		 */		
		function showMainPanel():void;
		
		/**
		 * 奥雅设计馆兑换
		 */		
		function showExchangePanel():void;
		
		
		/**
		 * 奥雅设计馆其他面板
		 */		
		function showCommonPanel( key:String, params:* = null ):void;
		
	}
}