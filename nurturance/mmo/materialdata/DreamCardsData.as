package mmo.materialdata
{
	import mmo.framework.domain.dreamcard.DreamCard;

	public class DreamCardsData
	{
		public function DreamCardsData()
		{
		}
		
		/**
		 * "{0}":new DreamCard({0}, "{1}", "{2}", "{3}", "{4}", "{5}", "{6}", "{7}", {8}),
		 */
		public static const data:Object = {
			"1":new DreamCard(1, "噬魂梦境卡", "夜宇", "男", "保密", "178CM", "保密", "保密", 1),
			"2":new DreamCard(2, "童心梦境卡", "梦谣", "女", "12岁", "140CM", "保密", "2002年6月1日", 1),
			"3":new DreamCard(3, "命运梦境卡", "景星", "男", "保密", "175CM", "保密", "保密", 1),
			"4":new DreamCard(4, "魅力梦境卡", "思斯", "女", "16岁", "165CM", "保密", "1998年1月1日", 1),
			"5":new DreamCard(5, "治愈梦境卡", "楚天", "男", "保密", "180CM", "保密", "保密", 1),
			"6":new DreamCard(6, "毁灭梦境卡", "无帝", "男", "保密", "182CM", "保密", "保密", 1),
			"7":new DreamCard(7, "幻想梦境卡", "旖旎", "女", "未知", "160CM", "保密", "未知", 1),
			"8":new DreamCard(8, "长夜梦境卡", "向兮", "男", "未知", "186CM", "保密", "未知", 1),
			"9":new DreamCard(9, "重生梦境卡", "梦冰", "女", "15岁", "156CM", "保密", "1999年3月10日", 1),
			"10":new DreamCard(10, "轮回梦境卡", "蕉月", "女", "12岁", "146CM", "保密", "2002年10月8日", 1),
			"11":new DreamCard(11, "永无梦境卡", "离影", "女", "未知", "168CM", "保密", "未知", 1),
			"12":new DreamCard(12, "异能梦境卡", "梵音", "女", "未知", "162CM", "保密", "未知", 1)
		};
		
		public static const bonusMap:Array = [
			[1],
			[1,2],
			[1,3],
			[1,4],
			[1,5],
			[1,6],
			[5,7],
			[5,8],
			[5,9],
			[5,10],
			[5,11],
			[5,12]
		]
		
	}
}