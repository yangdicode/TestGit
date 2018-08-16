package mmo.play.layer {
	
	import flash.events.Event;

	/**
	 * 层次切换事件
	 */
	public class LayerEvent extends Event {
		
		//~ constants ---------------------------------------------------------
		
		/** 层次被隐藏 */
		public static const HIDE:String = "onLayerHide";
		/** 层次重新显示 */
		public static const SHOW:String = "onLayerShow";
		
		/** 层次被从显示列表移除 */
		public static const REMOVE:String = "onLayerRemove";
		/** 层次被重新加入显示列表 */
		public static const ADD:String = "onLayerAdd";
		
		/** 层次被销毁 */
		public static const DESTROY:String = "onLayerDestroy";
		/** 层次被重建 */
		public static const CONSTRUCT:String = "onLayerConstruct";
		
		
		public static const ON_LAYER_CHANGE:String = "OnLayerChange";
		
		//~ fields ------------------------------------------------------------ 
		
		//~ public methods ----------------------------------------------------
		
		public function LayerEvent(type:String) {
			super(type);
		}
		
	}
}