package mmo.interfaces.fairy
{
	import mmo.framework.domain.fairy.UserFairy;
	import mmo.interfaces.IDownloadInitService;
	
	public interface IFairyService extends IDownloadInitService
	{
		function showFairyMainPanel(userName:String=""):void;
		
		/**
		 * 副本入口面版
		 */		
		function showFbEntrance():void;
		/**
		 * 打开召唤面版
		 */		
		function showSummonPanel():void;
		
		/**
		 * 精灵图鉴
		 */		
		function openFairyBook():void;
		
		function superEvolveFairy(userFairy:UserFairy):void;
	}
}