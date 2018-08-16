package mmo.interfaces.skyteamwar
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface ISkyTeamWarService extends IDownloadInitService
	{
		/**
		 * 主面板
		 */		
		function showMainPanel():void;
		
		/**
		 *	支持天团面板 
		 * @param callBack 支持面板关闭之后的回调
		 */		
		function showJoinPanel(callBack:Function=null):void;
		
		/**
		 * 排行榜面板
		 */	
		function showTopPanel():void;
		
		/**
		 * 兑换面板
		 * */
		function showExchangePanel():void;
					
		/**
		 * 是否加入天团
		 * */
		function hasJionSkyTeam():Boolean;
		
		/**
		 * 我的天团id   
		 * 	"0":"无",
			"1":"甜心天团",
			"2":"精灵天团",
			"3":"魔女天团",
			"4":"学院天团"
		 * */
		function getMySkyTeamId():int;
		
		/**
		 * 我的天团中文名称
		 * */
		function getMyTeamName():String;
		
		/**
		 *	检查是否支持天团
		 * @param callBack 检查之后的回调
		 */	
		function checkJoinTeam(callBack:Function=null):void;
		
	}
}