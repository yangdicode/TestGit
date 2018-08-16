package mmo.framework.domain.material.clothes
{
	/**
	 * 服装类型
	 */
	public class ClothesType
	{

		/**
		 * 类型
		 */		
		public static const NormalClothes:String = "一般服饰";
		
		/**
		 * 类型
		 */		
		public static const SuperStarClothes:String = "星团服饰";
		
		/**
		 * 类型
		 */	
		public static const MiracleClothes:String = "神迹时装";
		/**
		 * 类型
		 */	
		public static const WonderClothes:String = "奇迹时装";
		
		/**
		 * 类型
		 */		
		public static const TryOnClothes:String = "试穿服饰";
		/**
		 * 类型
		 */		
		public static const MiracleNuan:String = "魔法训练营";
		
		
		/**
		 * 品牌
		 */		
		public static const ShanelClothesBrand:String = "雪奈尔服饰";
		
		/**
		 * 品牌
		 */		
		public static const NormalBrand:String = "罗莎服饰";
		
		
		public static const DefaultShowType:Array = [NormalClothes, MiracleClothes, WonderClothes, TryOnClothes];
		
		public static const NuannuanShowTypes:Array = [NormalClothes, MiracleClothes];
		
		public static function getDefalultShowType():Array{
			return DefaultShowType;
		}
		
		public static function getMiracleType():Array
		{
			return [MiracleClothes, WonderClothes];
		}

	}
}