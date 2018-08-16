package mmo.interfaces.task.data
{
	/**
	 * 任务群类别，显示面板用
	 * @author liyawei
	 */	
	
	public class TaskGroupType
	{
		/**
		 * 0-100 为主线任务(小类不用设定，0为序章，1为第一章，依此类推)
		 * 特殊 100为新手任务
		 */		
		public static const MainTask:int = 0;
		
		/**
		 * 新手任务
		 */		
		public static const XinShou:int = 100;
		
		/**
		 * 支线任务类型 101以上
		 */
		
		/**
		 * 冒险故事(原王国故事,被拆解成各个羽龄限制)
		 */		
		public static const MaoXian:int = 101;

		/**
		 * 成长指南(原种族故事)
		 */
		public static const Chengzhang:int = 102;
		/**
		 * 英雄历程
		 */
		public static const Hero:int = 103;
		
		/**
		 * 日常任务 
		 */	
		public static const DailyTask:int = 104;
		
		/**
		 * 王国故事(即将开启锁住的)
		 */		
//		public static const LockWangGuo:int = 105;
		
		
		/**
		 * 配置羽龄限制数组(共用冒险故事面板area101)
		 */		
		private static const LevelTypeLimits:Array = [Level5to7,Level8to19,Level20to38,Level39to50];
		
		/**
		 * 羽龄2～7
		 */		
		public static const Level5to7:int = 106;
		
		/**
		 * 羽龄8～19
		 */		
		public static const Level8to19:int = 107;
		
		/**
		 * 羽龄20～38
		 */		
		public static const Level20to38:int = 108;
		
		/**
		 * 羽龄39～50
		 */		
		public static const Level39to50:int = 109;
		
		
		/**
		 * 检查是否是羽龄限制类型 
		 */		
		public static function checkIsLevelType(typeId:int):Boolean
		{
			return LevelTypeLimits.indexOf(typeId) >= 0;
		}	
		
		/**
		 * 精彩短片
		 */
		public static const JingCaiDuanPian:int = 110;
		
		/**
		 * 热点任务类型 201以上
		 */		
		/**
		 * 热点活动
		 */		
		public static const HotTaskType:int = 201;
		
		/**
		 * 经典推荐，这里原来的注释的最新剧情，但是明明就是不是最新剧情，是经典推荐啊啊啊啊啊
		 */
		public static const NewTaskType:int = 202;
		
		/**
		 * 进行中
		 */		
		public static const DoingTaskType:int = 203;
		
		/**
		 * 最新剧情，应产品要求新加任务面板显示的任务集当前的最新主线任务所有任务
		 */
		public static const NewMainTaskType:int = 204;
		
		//以下为左边面板编号使用
		/**
		 * 主线任务 
		 */		
		private static const MainTaskTip:int = 1001;
		
		/**
		 * 支线任务(成长之路)
		 */		
		private static const BranchTaskTip:int = 1002;
		
		/**
		 *  推荐任务
		 */
		private static const TuiJianTaskTip:int = 1003;
	}
}