package mmo.framework.domain.material.petitem
{
	public class PetItemTypes
	{
		/**
		 * 食物道具
		 */
		public static const PROP_FOOD:int = 2;
		/**
		 * 娱乐道具 
		 */
		public static const PROP_FUN:int = 1;
		/**
		 * 清洁道具
		 */
		public static const PROP_CLEANING:int = 3;
		/**
		 * 加属性道具
		 */
		public static const PROP_SPECIAL:int = 4;
		/**
		 * 洗资质道具
		 */
		public static const PROP_GOBACK:int = 5;
		
		
		/**
		 * 放在地面的家具
		 */
		public static const FURNITURE_GROUND:int = 31;
		/**
		 * 放在墙面的家具
		 */
		public static const FURNITURE_WALL:int = 32;
		/**
		 * 地板， 不可移动
		 */
		public static const FURNITURE_FLOOR:int = 33;
		/**
		 * 墙纸，不可移动
		 */
		public static const FURNITURE_WALLPAPER:int = 34;
		/**
		 * 门， 不可移动
		 */
		public static const FURNITURE_DOOR:int = 35;
		
		
		/**
		 * 合成材料
		 */
		public static const STUFF:int = 40;
		
		
		public static const PROPS:Array = [PROP_FOOD, PROP_FUN, PROP_CLEANING, PROP_SPECIAL, PROP_GOBACK];
		public static const FURNITURES:Array = [FURNITURE_GROUND, FURNITURE_WALL, FURNITURE_FLOOR, FURNITURE_WALLPAPER, FURNITURE_DOOR];
		public function PetItemTypes()
		{
		}
		
		public static function getTypeName(type:int):String
		{
			var res:String = "";
			switch(type)
			{
				case PROP_FOOD:
					res = "食物道具";
					break;
				case PROP_FUN:
					res = "娱乐道具";
					break;
				case PROP_CLEANING:
					res = "清洁道具";
					break;
				case PROP_SPECIAL:
				case PROP_GOBACK:
					res = "特殊道具";
					break;
				
				case FURNITURE_GROUND:
					res = "地面家具";
					break;
				case FURNITURE_WALL:
					res = "墙面挂饰";
					break;
				case FURNITURE_FLOOR:
					res = "地板";
					break;
				case FURNITURE_WALLPAPER:
					res = "墙纸";
					break;
				case FURNITURE_DOOR:
					res = "门";
					break;
				
				case STUFF:
					res = "宠物材料";
					break;
				
				default:
					res = "宠物物品";
			}
			return res;
		}
		
		public static function isPropType(type:int):Boolean
		{
			if(type >= 1 && type <= 5)
			{
				return true;
			}
			return false;
		}
		
		public static function isFurnitureType(type:int):Boolean
		{
			if(type >= 31 && type <= 35)
				return true;
			return false;
		}
		
		public static function isStuffType(type:int):Boolean
		{
			return type == STUFF;
		}
		public static function isLivingProp(type:int):Boolean
		{
			if(type >= 1 && type <= 3)
				return true;
			return false;
		}
		public static function isSpecialProp(type:int):Boolean
		{
			return (type == PROP_SPECIAL || type == PROP_GOBACK);
		}
		
		public static function isFurnitureMutexType(type:int):Boolean
		{
			if(type >= 33 && type <= 35)
				return true;
			return false;
		}
		
		public static function isFurnitureMovable(type:int):Boolean
		{
			if(type >= 31 && type <= 32)
				return true;
			return false;
		}
	}
}