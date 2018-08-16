package mmo.common.panel {
	
	import flash.events.Event;

	/**
	 * 浮动面板事件
	 */
	public final class PanelEvent extends Event {
		
		//~ constants ---------------------------------------------------------
		
		/** 面板已弹出 */
		public static const ADDED:String = "onPanelAdded";
		
		/** 面板已关闭 */
		public static const REMOVED:String = "onPanelRemoved";
		
		//~ public methods ----------------------------------------------------
		
		public function PanelEvent(type:String) {
			super(type);
		}
		
	}
}