package mmo.framework.domain.material.gitem
{

	public class GItemTypes
	{
		//原材料（采集到的）
		public static const OriStuff:int = 1;
		
		//材料（合成出来的）
		public static const Stuff:int = 2;
		
		//宠物蛋
		public static const PetEgg:int = 3;
		
		//宠物
		public static const Pet:int = 4;
		
		//家具图章
		public static const FurnitureSeal:int = 5;
		
		//衣服图章
		public static const ClothesSeal:int = 6;
		
		//宠物精华
		public static const PetSoul:int = 7;
		//宠物袋
		public static const PetBag:int = 8;
		//鲜花
		public static const Flower:int = 9;
		//AOYA卡
		public static const AoyaCard:int = 10;
		
		//其他，任务物品
		public static const TASK:int = 11; 
		//其他, 其他物品
		public static const OTHER:int = 12;
		//精品商城代金卷
		public static const VOUCHER:int = 13;
		//不在背包显示的 收集品
		public static const VirtualGItems:int = 14;
		//特殊道具，不在背包显示
		public static const CandyCrushItem:int = 15;
		//礼物（npc好感度用）
		public static const NpcFaviorItem:int = 16;
		
		//绚梦星团用-团队用
		public static const SuperStarTeam:int = 17;
		//绚梦星团用-明星用
		public static const SuperStarSingle:int = 18;
		
		//魔幻香水
		public static const Perfume:int = 19;
		//雪奈尔商城代金卷
		public static const ShanelVoucher:int = 20;
		
		//经典花
		public static const ShanelFlower1:int = 21;
		//永生花
		public static const ShanelFlower2:int = 22;
		//单枝花
		public static const ShanelFlower3:int = 23;
		//星座花
		public static const ShanelFlower4:int = 24;
		//海洋花
		public static const ShanelFlower5:int = 25;
		//妙境花
		public static const ShanelFlower6:int = 26;
		//魔法花
		public static const ShanelFlower7:int = 27;
		
		/**
		 * 星灵
		 */		
		public static const Rangers:int = 28;
		
		//衣服礼包
		public static const ClothesGiftBag:int = 113;
		//家具礼包
		public static const FurnitureGiftBag:int = 114;
		//战斗道具礼包
		public static const BattleItemGiftBag:int = 115;
		//宠物礼包
		public static const PetGiftBag:int = 116;
		//鲜花礼包
		public static const FlowerGiftBag:int = 117;
		//其他礼包
		public static const OtherGiftBag:int = 118;
		//星梦礼包
		public static const SuperStarGiftBag:int = 119;
		//香水礼包
		public static const PerfumeGiftBag:int = 120;

		public static const ShanelGiftBag:Array = [
			ClothesGiftBag, PerfumeGiftBag, FurnitureGiftBag
		];
		
		public static const GiftBag:Array = [ClothesGiftBag, FurnitureGiftBag,
			BattleItemGiftBag, PetGiftBag, FlowerGiftBag, OtherGiftBag
		];

		public function GItemTypes()
		{
		}
		
		//大分类：鲜花
		public static const Flowers:Array = [
			Flower, ShanelFlower1, ShanelFlower2, ShanelFlower3, ShanelFlower4,ShanelFlower5,ShanelFlower6,ShanelFlower7
		];
		
		//大分类：魔法物品
		public static const MAGIC_STUFF:Array = [
			OriStuff, Stuff, PetEgg, Pet, FurnitureSeal, ClothesSeal, PetSoul,PetBag
		];
		
		//大分类：消耗物品
//		public static const EXPANDABLE:Array = [
//			
//		];
		
		//大分类：其他物品
		public static const OTHERS:Array = [
			TASK, OTHER, Flower, ShanelFlower1, ShanelFlower2, ShanelFlower3, ShanelFlower4,ShanelFlower5,ShanelFlower6,ShanelFlower7,VOUCHER,NpcFaviorItem,Perfume
		];
	}
}