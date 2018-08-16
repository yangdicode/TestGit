package mmo.interfaces.market
{
	import mmo.interfaces.IInitService;

	public interface IMarketService extends IInitService
	{
		//进入服装店
		function enterClothesMarket():void;
		//进入家具店
		function enterFurnitureMarket():void;
		//进入道具店
		function enterGItemMarket():void;
		//进入宠物用品店
		function enterPetItemMarket():void;
		//进入精品商店、人民币商店
		function enterRmbMarket(customExpendIndexs:Array = null, page:int = 1):void;
		//限时购买
		function enterLimitSellMarket():void;
	}
}