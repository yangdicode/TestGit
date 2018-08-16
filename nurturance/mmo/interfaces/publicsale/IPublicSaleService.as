package mmo.interfaces.publicsale
{
	import mmo.interfaces.IInitService;

	public interface IPublicSaleService extends IInitService
	{
		function auctionPanel():void;
		
		/**
		 * 购买拍卖币
		 */
		function buyScorePanel():void;
		
		/**
		 * 名人榜
		 */
		function starRankPanel():void;
		
		/**
		 * 拍卖奖励
		 */
		function consumePanel():void;
		
		/**
		 * 活动接口
		 */
		function activityInterface(key:String, params:Array=null):void;
	}
}