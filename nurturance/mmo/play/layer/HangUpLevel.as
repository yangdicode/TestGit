package mmo.play.layer {
	
	/**
	 * 层次挂起级别
	 */
	public class HangUpLevel {
		
		//~ constancts --------------------------------------------------------
		
		/** 隐藏 */
		public static const HIDE:int = 0;
		
		/** 从显示类表移除 */
		public static const REMOVE:int = 1;
		
		/** 从显示类表移除，并销毁 */
		public static const DESTROY:int = 2;
		
		//~ public methods ----------------------------------------------------
		
		public function HangUpLevel() {
		}

	}
}