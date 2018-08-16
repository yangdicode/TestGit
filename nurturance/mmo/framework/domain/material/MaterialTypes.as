package mmo.framework.domain.material
{
	public class MaterialTypes
	{
		/**
		 * 奥光, 不是同一个体系的，但是某些地方可以以此区分
		 * 兑换的分隔号为“-”，所以不能使用这个
		 * */
		public static const SOUL_GOLD:int = -1;
		/**
		 * 钱, 不是同一个体系的，但是某些地方可以以此区分
		 * */
		public static const SCORE:int = 0;
		/**
		 * 收集物
		 */
		public static const GITEM:int = 1;			//收集物
		/**
		 * 衣服 
		 */
		public static const CLOTHES:int = 2;		//衣服
		/**
		 * 家具 
		 */
		public static const FURNITURE:int = 3;	//家具
		
		/**
		 * 卡片
		 */		
		public static const CARDITEM:int = 4;    //卡片
		
		/**
		 * 战斗物品
		 * */
		public static const BATTLEITEM:int = 5;
		
		/**
		 * 友情书 
		 */		
		public static const BUDDYTREE:int = 6;
		
		/**
		 * 宠物道具
		 */
		public static const PETITEM:int = 7;
		
		/**
		 * 装备卡 
		 */		
		public static const EQUIPCARDITEM:int = 8;
		
		/**
		 * 农场种植
		 */		
		public static const PLANTITEM:int = 9;
		
		/**
		 * 超市
		 */		
		public static const SUPERMARKET:int = 10;

//		/**
//		 * 小助手 
//		 */
//		public static const ROBOT:int = 3;		//小助手
//		
//		/**
//		 * 射击卡片 
//		 */
//		public static const SHOOT_CARD = 4;		//射击卡片
//		
//		/**
//		 * 宠物蛋
//		 */
//		public static const PETEGG = 5;		//射宠物蛋
		
//			//以下是非Material的，用个ID标识
//		public static const MONEY:int = 100;
//		public static const EXP:int = 101;
//		public static const PET_EGG:int = 102;
//		public static const BADGE:int = 104;
		
	//------------------    分割线  ------------------------------------------------------	
		//以下是非Material的，用个ID标识，目前只用来处理兑换面板图标读取。
		// (2014年3月13日15:45:57 add by hanjun )
		/** 
		 * 虚拟代币标识类型，目前内部小分类为：1-奥光；2-金币
		 * */
		public static const VIRTUAL_MATER_TYPE:int = 10085;
		
		/**
		 * 精灵空间精灵
		 * */
		public static const NO_MATER_FAIRY:int = 10086;
		
		/**
		 * 战斗小伙伴NPC
		 * */
		public static const NO_MATER_BATTLE_NPC:int = 10087;
		
		/**
		* 绚梦星团明星
		* */
		public static const NO_MATER_STAR:int = 10088;
		
		
	}
}