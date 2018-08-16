package mmo.interfaces.wondernuan
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IWonderNuanService extends IDownloadInitService
	{
		function showGainSkillPanel(id:int, callBack:Function=null):void;
		function showGainClothesPanel(id:int, callBack:Function=null):void;
		
		/**
		 * 通过WonderNuanFacade调用
		 */
		function enterTaskScene(theme:int, lv:int):void;
		function canStartTask(theme:int, lv:int):Boolean;
		
		function themePanel():void;
		
		function showPKEntrance():void;
		function showPKRank():void;
		function showDeaconPanel():void;
		function showLotDeaconPanel():void;
		
		/**
		 * 执事个数
		 */
		function getDeaconNum():int;
		
		function test():void;
	}
}