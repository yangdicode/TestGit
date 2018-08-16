package mmo.framework.domain.oneoff
{
	public class OneOffKey
	{
		
		public static const SEMD_FLOWER:String = "sendflower";
		public static const FLOWER_CHARM:String = "flowercharm";
		public static const TEMP:String = "temp";
		public static const TEMP2:String = "temp2";
		/**
		 * 羽贝商品oneoff，index = goodsId;
		 */		
		public static const GOODS:String = "goods";
		
		/**
		 * 用户拥有香水
		 */		
		public static const Perfume:String = "perfume";
		
		public static const EffortBonus:String = "effortbonus";
		
		public static const NuanMatch:String = "nuannuanCompetition";
		public static const NuanMatchTop:String = "nuannuanCompetitionTop10";
		
		/**
		 * 星灵图鉴奖励
		 */		
		public static const RangerBonus:String = "lrgetseriesbonus";
		/**
		 * 拥有的星灵
		 */		
		public static const Rangers:String = "lrMonsters";
		
		/**
		 * 游戏室成长奖励
		 */
		public static const PlayRoomGrowUpBonus:String = "gamelobbygrow";
		
		/**
		 * 奇迹暖暖成就
		 */
		public static const WonderNuanEffort:String = "mnAchieve";
		
		/**
		 * 系统标识位,给前端使用,后端不使用,公开出去给前端设置的!!!
		 */
		public static const SystemFlag:String = "systemFlag";
		
		public function OneOffKey()
		{
		}
	}
}