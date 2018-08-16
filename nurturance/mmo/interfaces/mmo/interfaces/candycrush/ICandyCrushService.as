package mmo.interfaces.candycrush
{
	import mmo.interfaces.IInitService;
	
	public interface ICandyCrushService extends IInitService
	{
		/**
		 * 主面版
		 */		
		function showMainPanel():void;
		/**
		 * 开始面版
		 */		
		function startCandyCrushGame(gate:int=1):void;
		/**
		 * 当前等级
		 */		
		function getMyCurLevel():int;
		/**
		 * 特定关的星星数
		 */
		function getLevelStar(lvl:int):int;
	}
}