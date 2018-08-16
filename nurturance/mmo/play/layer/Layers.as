package mmo.play.layer {
	
	/**
	 * 层次信息
	 */
	public final class Layers {
		
		//~ constancts --------------------------------------------------------
		
		/** 场景 */ 
		public static const BASE_SCENE:int = 0;
		/** 工具栏 */
		public static const BASE_CONTROL:int = 1;
		/** 左上角图标 */
		public static const BASE_ICONS:int = 2;
		/** 任务图标 */
		public static const BASE_APPS:int = 3;
		/** 基本层次最高层 */
		public static const BASE_TOP:int = 4;
		/** Tips层 */
		public static const BASE_TIPS:int = 5;
		/** 任务动画掩盖层
		 * (例如：新手任务动画蒙蔽一切之类的使用) */
		public static const BASE_TaskTip:int = 6;
		
		/** 游戏 */
		public static const FIGHTING_SCENE:int = 0;
		/** 工具栏 */
		public static const FIGHTING_CONTROL:int = 1;
		/** 战斗层次最高层 */
		public static const FIGHTING_TOP:int = 2;
		/** Tips */
		public static const FIGHTING_TIPS:int = 3;
		
		/**
		 * 动画播放层 
		 */
		public static const MOVIE_PLAY:int = 0;
		
		//~ public methods ----------------------------------------------------
		
		public function Layers() {
		}

	}
}