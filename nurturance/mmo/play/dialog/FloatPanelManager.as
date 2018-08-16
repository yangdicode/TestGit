package mmo.play.dialog{
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;
	
	import mmo.common.DisplayUtil;
	import mmo.common.effect.fade.FadeInEffect;
	import mmo.common.effect.fade.FadeOutEffect;
	import mmo.common.effect.popup.PopDownEffect;
	import mmo.common.effect.popup.PopUpEffect;
	import mmo.common.panel.PanelEffect;
	import mmo.common.panel.PanelEvent;
	import mmo.interfaces.IDispose;
	import mmo.loader.LoaderContainer;
	import mmo.play.layer.LayerManager;
	
	/**
	 * 浮动窗口管理器
	 * 提供点击最上层显示，鼠标拖动等效果
	 */
	public class FloatPanelManager extends Dictionary {
		
		//~ fields ------------------------------------------------------------
		
		private static var _instance:FloatPanelManager;
		
		/** 窗口列表 */
		private var _windowTable:Dictionary;
		
		/** dragArea列表 */
		private var _dragAreaTable:Dictionary;
		
		//~ public methods ----------------------------------------------------
		
		public function FloatPanelManager() {
			if(_instance != null) {
				throw new Error("FloatPanelWindow is implemented as Singleton!");
				return;
			}
			
			this._windowTable = new Dictionary();
			this._dragAreaTable = new Dictionary();
		}
		
		public static function getInstance():FloatPanelManager {
			if(_instance == null) {
				_instance = new FloatPanelManager();
			}
			return _instance;
		}
		
		/**
		 * 添加浮动显示窗口
		 * 
		 * @param	window		窗口
		 * @param	x			窗口坐标，默认在窗口中心显示
		 * @param	y
		 * @param	dragArea	鼠标点击可拖动区域，默认为全窗口可拖动
		 * @param	effect		窗口动画效果，默认为无效果
		 * 
		 * @return	是否添加成功
		 */
		public function addFloatPanel(window:DisplayObject, 
									  x:int = -1, y:int = -1, 
									  dragArea:DisplayObject = null,
									  effect:int = PanelEffect.NONE):Boolean {
			
			// 暂时去掉弹出特效
			effect = PanelEffect.NONE;
			// 若当前激活的层次为战斗层，则忽略浮动窗口的显示
			// 战斗层可显示模态对话框
			if(LayerManager.getCurrentLayer() == LayerManager.FIGHTING_LAYER) {
				return false;
			}
			
			if(this._windowTable[window] != null && this._windowTable[window] != undefined) {
				return false;
			}
			this._windowTable[window] = window;
			this._dragAreaTable[window] = dragArea;
			
			if(x == -1) {
				x = (LoaderContainer.stageWidth - window.width) * 0.5;
			}
			window.x = x;
			if(y == -1) {
				y = (LoaderContainer.stageHeight - window.height) * 0.5;
			}
			window.y = y;
			
			var layer:Sprite = LayerManager.getCurrentLayerTop();
//			var currentLayer:String = LayerManager.getCurrentLayer();
//			if(currentLayer == LayerManager.FIGHTING_LAYER) {
//				layer = LayerManager.getBaseTop();
//			}
//			else {
//				layer = LayerManager.getFightingTop();
//			}
			
			if(effect == PanelEffect.POP) {
				this._windowTable[window] = new PopUpEffect(layer,
					window,
					window.x + window.width * 0.45, window.y + window.height * 0.45,
					window.x, window.y, 
					0.3, onPanelAdded); 
			}
			else if(effect == PanelEffect.FADE) {
				this._windowTable[window] = new FadeInEffect(layer,
					window,
					window.x, window.y, 
					0.2, onPanelAdded); 
			}
			else {
				layer.addChild(window);
				onPanelAdded(window);
				setDialogClose(window);
			}
			
			return true;
		}
		
		/**
		 * 关闭浮动显示窗口
		 * 
		 * @param	window		待关闭的浮动窗口
		 * @param	effect		动画效果，默认为弹出效果
		 */
		public function removeFloatPanel(window:DisplayObject, effect:int = PanelEffect.FADE):Boolean {
			effect = PanelEffect.NONE;
			
			if(this._windowTable[window] == null) {
				return false;
			}
			
			this._dragAreaTable[window] = null;
			delete this._dragAreaTable[window];
			
			(this._windowTable[window] as IDispose).dispose();
			
			// 屏蔽一种变态操作，还没执行onPanelAdded，就removeFloatPanel的
			if(!(this._windowTable[window] is PanelProxy)) {
				this._windowTable[window] = null;
				delete this._windowTable[window];
				return true;
			}
			
			this._windowTable[window] = null;
			delete this._windowTable[window];
			
			if(effect == PanelEffect.POP) {
				new PopDownEffect(window, 
					window.x + window.width * 0.45, window.y + window.height * 0.45,
					0.25, onPanelRemoved);
			}
			else if(effect == PanelEffect.FADE) {
				new FadeOutEffect(window, 0.25, onPanelRemoved);
			}
			else {
				DisplayUtil.stopAndRemove(window);
				onPanelRemoved(window);
			}
			
			return true;
		}
		
		/**
		 * 关闭所有浮动窗口
		 */
		public function clearAll():void {
			trace(this + " clearAll");
			for each(var item:Object in this._windowTable) {
				trace("item:" + item);
				var window:DisplayObject = item as DisplayObject;
				if(window == null)
				{
					
				}
				if(item is PanelProxy){
					window = PanelProxy(item).window;
				}
				if(item is PopUpEffect){
					window = PopUpEffect(item).window
				}
				
				removeFloatPanel(window, PanelEffect.NONE);
			}
			
			this._windowTable = new Dictionary();
			this._dragAreaTable = new Dictionary();			
		}
		
		//~ private methods ---------------------------------------------------
		
		/**
		 * 一个面板已被添加
		 */
		private function onPanelAdded(window:DisplayObject):void {
			this._windowTable[window] = new PanelProxy(window, this._dragAreaTable[window]);
			(this._windowTable[window] as PanelProxy).init();
			
			window.dispatchEvent(new PanelEvent(PanelEvent.ADDED));
		}
		
		/**
		 * 一个面板已被移除
		 */
		private function onPanelRemoved(window:DisplayObject):void {
			window.dispatchEvent(new PanelEvent(PanelEvent.REMOVED));
		}
		
		/**
		 * 设置close按钮关闭功能
		 */		
		private function setDialogClose(window:DisplayObject):void{
			var closeDialog:Function = function(evt:MouseEvent):void
			{
				var name:String = DisplayObject(evt.target).name;
				if (name == "btnClose" || name == "btnCancel")
				{
					window.removeEventListener(MouseEvent.CLICK,arguments.callee);
					FloatPanelManager._instance.removeFloatPanel(window);
				}
			}
			
			window.addEventListener(MouseEvent.CLICK,closeDialog);	
		}
	}
}