package mmo.framework.domain.player
{
	/**
	 * 跟随用户光效的类型。需要在mmo.play.player.sceneplayer.light.PlayerLightFactory下增加同样编号的处理器。 
	 * @author p-yangzhanxin
	 * 
	 */	
	public class PlayerLightTypes
	{
		/**
		 * 没有光效
		 */		
		public static const NONE_LIGHT:String = "0";
		/**
		 * 普通人物后部光效，代码生成、导图（代码控制飘落），类人走花落光效。
		 */		
		public static const NORMAL_LIGHT:String = "1";
		/**
		 * 跟随人物和后部光效，前部代码生成、导图（代码控制飘落）、后部跟随人物，类人走花落光效。
		 */		
		public static const FOLLOW_AND_BACK_LIGHT:String = "2";
		/**
		 * 动画跟随人物和后部光效，动画、一直存在、跟随人物，类光环光效。
		 */		
		public static const FOLLOW_MOVIE_LIGHT:String = "3";
		/**
		 * 衣服动画光效，人物停止，播放动画，类跳舞光效。
		 */		
		public static const CLOTHES_LIGHT:String = "4";
		
		/**
		 * 代码生成、动画、停留光效，类脚印光效。
		 */		
		public static const FOOT_PRINT_LIGHT:String = "5";
		
		public static const Halo_Light:String = "6";
		
		/**
		 * 衣服动画光效，人物停止，播放动画，类跳舞光效。
		 * 分前后两层
		 */		
		public static const CLOTHES_LIGHT2:String = "7";
		
		public static const Vip_Mood_Light:String = "8";
	}
}