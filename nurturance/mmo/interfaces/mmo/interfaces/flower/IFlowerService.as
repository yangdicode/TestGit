package mmo.interfaces.flower
{
	import mmo.framework.domain.market.Goods;
	import mmo.interfaces.IInitService;

	public interface IFlowerService extends IInitService
	{
		/**
		 * 显示好友鲜花信息
		 */		
		function showFlowerInforPanel(userName:String):void;
		
		/**
		 * 显示花榜面版
		 */		
		function showFlowerTopPanel():void;
		
		/**
		 * 显示买花面版
		 */		
		function showFlowerMarket():void;
		
		/**
		 * 打开玫瑰礼包
		 */		
		function showFlowerGiftPanel():void;
		
		/**
		 * 获得鲜花信息
		 * 反回:charm魅力值；sendFlower:送花值。
		 */		
		function getFlowerData(userName:String, callBack:Function):void;
		
		/**
		 * 显示上周前10
		 */		
		function showFlowerTop10():void;
		
		/**
		 * 鲜花购买面版
		 * @param flowerGoods 鲜花商品
		 */		
		function showBuyFlowerPurcase(flowerGoods:Goods):void;
		
		/**
		 * 历代花魁
		 */		
		function showFlowerTop1Panel():void;
			
		/**
		 * 送花值奖励
		 */		
		function showSendFlowerBonusPanel():void;
		
		function showYearFlowerMainPanel():void;
		function showFlowerInvitePanel(sender:String):void;
		function viewFlowerTwins(groupId:int):void;
		
		function showFloCommunityShop():void;
		
		/**
		 * 尝试送花，显示背包。
		 */		
		function trySendFlowerTo(buddyName:String):void;
		
		function showFlowerExchange():void;
	}
}