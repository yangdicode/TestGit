package mmo.interfaces.garden.gardenui
{
	import mmo.interfaces.IService;
	
	public interface IGardenUIService extends IService
	{
		/**
		 * 花园公告
		 */		
		function showGardenNotice():void;
		
		/**
		 * 种子商店
		 */		
		function showSeedShop():void;
		
		/**
		 * 道具商店
		 */		
		function showPropShop():void;
		
		/**
		 * 花园背景商店
		 */		
		function showBackgroundShop():void;
		
		/**
		 * 卖花主面版
		 */		
		function showSellMainPanel():void;
		
		/**
		 * 植物换金币
		 */		
		function showSellPlant():void;
		
		/**
		 * 植物换奥光面版
		 */		
		function showExchangeSGold():void;
		
		/**
		 * 植物合成花面版
		 */		
		function showComposeFlower():void;
		
		/**
		 * 教程动画
		 */		
		function showTeachMovie(callBack:Function = null):void;
		
		/**
		 * 水晶柜
		 */		
		function showCrystalCabinet():void;
	}
}