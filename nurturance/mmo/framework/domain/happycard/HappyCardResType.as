package mmo.framework.domain.happycard
{
	public class HappyCardResType
	{
		public static const PWD_OK:int = 0;
		/**
		 * yayale最大次数超过限制
		 */		
		public static const YAYALE_TIMES_ERROR:int = -1;
		/**
		 * 系统错误
		 */		
		public static const SYSTEM_ERROR:int = -2;
		/**
		 * 已经使用过
		 */		
		public static const PWD_HAD_USED:int = -4;
		/**
		 * 不匹配
		 */		
		public static const PROP_NOT_MATCH:int = -5;
		/**
		 * 不存在密码
		 */		
		public static const CODE_NOT_FOUND:int = -6;
		
		/**
		 * 每日次数超过限制
		 */
		public static const DAY_MAX_TIMES_ERROR:int = -7;
		
		/**
		 *	总兑换达到上限 
		 */		
		public static const MAX_TIMES_ERROR:int = -8;
		
		public static function getErrorTips(ret:int):String
		{
			var tips:String = "";
			switch(ret)
			{
				case YAYALE_TIMES_ERROR:
					tips = "最大次数超过了限制~";
					break;
				case SYSTEM_ERROR:
					//tips = "系统错误，请重新尝试。";
					tips = "此兑换码错误，请认真核实！";
					break;
				case PWD_HAD_USED:
					tips = "这个兑换码已经被使用过了哦~";
					break;
				case CODE_NOT_FOUND:
					tips = "不存在的兑换码。";
					break;
				case DAY_MAX_TIMES_ERROR:
					tips = "今天兑换的次数太多了，明天再来吧~";
					break;
				case MAX_TIMES_ERROR:
					tips = "兑换的总次数太多了~";
					break;
			}
			return tips;
		}

		public function HappyCardResType()
		{
		}
	}
}