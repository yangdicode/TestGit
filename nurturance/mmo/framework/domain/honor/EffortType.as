package mmo.framework.domain.honor
{
	

	public class EffortType
	{
		public static const TOTAL:String = "总成就";
		public static const FIGHT:String = "战斗类";
		public static const TASK:String = "任务类";
		public static const LIFE:String = "生活类";
		public static const SOCIALITY:String = "社交类";	
		public static const PAST:String = "绝版成就";
		
		public static const Nuannuan:String = "魔法变身日记";
		
		public static const EffectData:Array = [TOTAL, FIGHT, TASK, LIFE, SOCIALITY, PAST];
		
		/**
		 * 不弹出成就动画的成就类型
		 */		
		private static const NotShowMovieTypes:Array = [Nuannuan];
		
		
		/**
		 * subType
		 * 暖暖套装成就
		 */		
		public static const Sub_Nuan_OwnItem:String = "套装成就";
		/**
		 * subType
		 * 暖暖闯关成就
		 */	
		public static const Sub_Nuan_Record:String = "闯关成就";
		
		/**
		 * 获取成就编号
		 * @param typeStr 成就字符串
		 * @return 
		 */		
		public static function getEffectTypeNo(typeStr:String):int
		{
			return EffectData.indexOf(typeStr);
		}
		
		public static function needShow(type:String):Boolean{
			return NotShowMovieTypes.indexOf(type) < 0;
		}
		
	}
}