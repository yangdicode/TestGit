package mmo.framework.domain.member
{
	public class MemberTypes
	{
		public static const NORMAL:int = 1;
		//神羽骑士
		public static const SHENYU_QISHI:int = 16;
		
		//年费神羽骑士
		public static const YEAR_SHENYU_QISHI:int = 2;//用户变量“ym”，前端在VipEnterMovie设置的数值，（0为普通，1为神羽，2为年费）
		
		//体验会员
		public static const EXPERIENCE_QISHI:int = 10086;
		public function MemberTypes()
		{
		}
	}
}