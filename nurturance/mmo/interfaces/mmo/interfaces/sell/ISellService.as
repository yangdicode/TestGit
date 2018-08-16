package mmo.interfaces.sell
{
	import mmo.interfaces.IService;

	public interface ISellService extends IService
	{
		function showSellUI():void;
		
		function showRecycleUI():void;
		
		function showRubbishExchangeUI():void;
		
	}
}