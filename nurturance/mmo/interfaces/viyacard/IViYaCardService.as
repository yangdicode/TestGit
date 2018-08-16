package mmo.interfaces.viyacard
{
	import mmo.interfaces.IDownloadInitService;
	
	public interface IViYaCardService extends IDownloadInitService
	{
		function get isNewHand():Boolean;
		
		function get vYubi():int;
		
		function showViYaCardPanel():void;
		
		function gotoNewHandMarket():void;
		
		function buyGoodsByViYaCard(goodsId:int):void;
	}
}