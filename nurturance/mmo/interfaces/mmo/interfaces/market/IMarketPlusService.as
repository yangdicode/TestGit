package mmo.interfaces.market
{
	import mmo.interfaces.IService;
	
	public interface IMarketPlusService extends IService
	{
		function enterMarket(page:Array = null):void;
		
		function enterScoreClothes():void;
	}
}