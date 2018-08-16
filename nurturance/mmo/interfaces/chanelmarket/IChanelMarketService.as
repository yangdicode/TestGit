package mmo.interfaces.chanelmarket
{
	import flash.display.Sprite;
	
	import mmo.framework.domain.market.Goods;
	import mmo.interfaces.IDownloadInitService;
	import mmo.interfaces.IService;
	
	public interface IChanelMarketService extends IDownloadInitService
	{
		
		/**
		 * 商城
		 */		
		function showMarket(selectIndexs:Array = null):void;
		
		/**
		 * 简介:0;
		 * 成为会员:1;
		 * 成长规则:2;
		 * 特权:3;
		 */		
		function showHandBook(page:int = 0, ext:* = null):void;
		
		/**
		 * 香水信息
		 */		
		function showMyPerfumeInfo():void;
		/**
		 * 香水信息
		 */		
		function showOtherPerfumeInfo(userName:String):void;
		
		/**
		 * 使用香水
		 */		
		function tryUsePerfume(gitemId:int, callBack:Function = null):void;
		
		/**
		 * 日排行
		 */		
		function showDailyTops():void;
		/**
		 * 周排行
		 */	
		function showWeeklyTops():void;
		/**
		 * 历史排行
		 */	
		function showHisTops():void;
		/**
		 * 兑换
		 */		
		function showExchange():void;
		
		/**
		 * 购买某些商品
		 */		
		function tryBuyGoods(goodsIds:Array, sucCall:Function = null, showLayer:Sprite = null, canPutInCar:Boolean=false):void;
		
		/**
		 * 购买礼包
		 */		
		function tryBuyGift(goodsId:int, num:int = 1, sucCall:Function = null, showLayer:Sprite = null):void;
		
		/**
		 * 买套装
		 */		
		function tryBuySuit(suitId:int, sucCall:Function = null, showLayer:Sprite = null):void;
		
		function buyGoods(goodsIds:Array, sucCall:Function = null, buyType:int = 1, buyParams:String = ""):void;
		
		/**
		 * 管家面版
		 */		
		function showButler():void;
		
		/**
		 * 另一个手册
		 */		
		function showManual(page:int = 1):void;
		
		/**
		 *  强制刷新物品数量
		 */		
		function refreshGoodsNum(callBack:Function):void;
		/**
		 * {"left":1, "max":1000}
		 */		
		function getGoodsNum(goodsId:int):Object;
		
		/**
		 * 获得我某件雪奈尔商品打折后的价格
		 */		
		function getMyGoodsPrice(goods:Goods):int;
		
	}
}