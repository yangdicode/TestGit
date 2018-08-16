package mmo.framework.domain.market
{
	public class MarketCatalog
	{
		/**
		 * 衣服类
		 */		
		public static const CLOTHES:int = 1;
		/**
		 * 家具类
		 */		
		public static const FURNITURE:int = 2;
		/**
		 * 道具类
		 */		
		public static const GITEM:int = 3;
		/**
		 * 宠物用品类
		 */		
		public static const PETITEM:int = 4;
		/**
		 * 植物商品
		 */		
		public static const PLANT_ITEM:int = 5;
		/**
		 * 换装商品
		 */		
		public static const REDRESSCLOTHES:int = 6;
		/**
		 * 甜心国度
		 */		
		public static const CandyCrushMarket:int = 7;
		
		/**
		 * 星团衣服商品
		 */		
		public static const SuperStarClothes:int = 8;
		
		/**
		 * 明星
		 */		
		public static const SuperStar:int = 9;
		
		/**
		 * 雪奈儿衣服商品
		 * 目前有 单件衣服、套装衣服
		 */		
		public static const ShanelClothes:int = 10;
		
		/**
		 * 雪奈儿道具商品(礼包、香水)，相似于MarketCatalog.GItem = 3;
		 * 目前有 香水、礼包
		 */		
		public static const ShanelGItem:int = 11;
		/**
		 * 雪奈儿家具
		 */		
		public static const ShanelFurniture:int = 12;
		
		/**
		 * 暖暖商城衣服
		 */		
		public static const NuannuanClothes:int = 13;
		
		/**
		 * 活动类，不显示在商店
		 */		
		public static const OTHER:int = 255;
		
		public function MarketCatalog()
		{
		}
	}
}