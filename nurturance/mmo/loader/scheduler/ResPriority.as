package mmo.loader.scheduler {
	
	/**
	 * 资源优先级
	 */
	public class ResPriority {
		
		//~ constants ---------------------------------------------------------
		
		/** 最高优先级 */
		public static const HIGHEST:int = 10;
		
		/** 较高优先级 */
		public static const HIGH:int = 8;
		
		/** 正常优先级 */
		public static const NORMAL:int = 6;
		
		/** 较低优先级 */
		public static const LOW:int = 4;
		
		/** 最低优先级 */
		public static const LOWEST:int = 2;
		
		/** 预加载*/
		public static const PRELOAD:int = 1;
		
		/**　抢占标准 */
		public static const PREEMPTIVE_LEVEL:int = 4;
		
		//~ public methods ----------------------------------------------------
		
		public function ResPriority() {
		}
		
		public static function compareable(a:*, b:*):int{
			return b.priority - a.priority;
		}
	}
}