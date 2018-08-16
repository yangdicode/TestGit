package mmo.interfaces.market
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface IRmbMarketService extends IDownloadInitService
	{
		/**
		 * 进入RMB商城 
		 * @param customExpendIndexs	子页面index的数组
		 * @param page					最终叶子页面的页数
		 */		
		function enterRmbMarket(customExpendIndexs:Array = null, page:int = 1, showLayer:Sprite = null):void;
		
		/**
		 * 进入RMB商城 
		 * @param customExpendIndexs	子页面index的数组
		 * @param goodsId				要跳到的商品id
		 */		
		function enterRmbMarketByGoods(customExpendIndexs:Array = null, goodsId:int = -1, showLayer:Sprite = null):void;

		/**
		 * 显示买多个商品的界面 
		 * @param data		直接传入goodsId的数组
		 * 					或者传入Goods的数组
		 */		
		function showBuyBatchPanel(data:Array, showLayer:Sprite = null):void;
		/**
		 * 根据套装id购买多件goods 
		 * @param suitId		套装id
		 * 
		 */		
		function showBuySuitBatchPanel(suitId:int, showLayer:Sprite = null):void;
		
		/**
		 * @param clothIds		
		 * 
		 */		
		function showFittingRoom(clothIds:Array):void;
	}
}