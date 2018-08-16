package mmo.framework.domain.material.gitem
{
	/**
	 * 物品点击使用类型
	 * 
	 * */
	public class GItemUseTypes
	{
		/**
		 * 不可用类型
		 * */
		public static const USELESS:int = -1;
		/**
		 * 宠物幼仔
		 * */
		public static const PET:int = 1;
		/**
		 * 万圣节宝箱 
		 */
		public static const wanBox:int = 2;
		/**
		 * 洗点药 
		 */		
		public static const PROP_CHANGE_ITEM:int = 3;
		/**
		 * 宠物袋 
		 */	
		public static const PET_BAG:int = 4;
		/**
		 * 宝箱 
		 */		
		public static const TREASURE_BOX:int = 5;
		
		/**
		 * 战宠宠物带袋 
		 */		
		public static const BATTLE_BAG:int = 6;
		
		public function GItemUseTypes()
		{
		}
	}
}