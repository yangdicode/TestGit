package mmo.play.dialog{
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.filters.DropShadowFilter;
	import flash.geom.Rectangle;
	
	import mmo.interfaces.IDispose;
	import mmo.loader.LoaderContainer;
	import mmo.play.layer.LayerManager;
	
	public class PanelProxy implements IDispose {
		
		//~ fields ------------------------------------------------------------
		
		/** 代理的窗口 */
		private var _window:DisplayObject;
		/** 当前被拖动的窗口 */
		private var _movingWindow:Sprite;
		
		/** 拖动区域 */
		private var _dragArea:DisplayObject;
		
		/** 记录上一帧鼠标位置 */
		private var _oldMouseX:int;
		private var _oldMouseY:int;
		
		/** 是否已拖动窗口 */
		private var _isDrag:uint;
		
		//~ public methods ----------------------------------------------------
		
		public function PanelProxy(window:DisplayObject, dragArea:DisplayObject = null) {
			this._window = window;
			
			this._dragArea = dragArea;
		}
		
		public function get window():DisplayObject
		{
			return this._window;
		}
		
		public function init():void {
			if(this._dragArea != null) {
				this._dragArea.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			}
			this._window.addEventListener(MouseEvent.MOUSE_DOWN, onMouseClickWindow);
			this._window.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
		}
		
		public function dispose():void {
			if(this._isDrag > 0) {
				onMouseUp(null);
			}
			
			if(this._dragArea != null) {
				this._dragArea.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				this._dragArea = null;
			}
			
			if(this._window != null) {
				this._window.removeEventListener(MouseEvent.MOUSE_DOWN, onMouseClickWindow);
				this._window.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
				if(this._window is IDispose){
					IDispose(this._window).dispose();
				}
				this._window = null;
			}
		}
		
		//~ protected methods -------------------------------------------------
		
		protected function removePanel(window:DisplayObject):void {
		}
		
		//~ private methods ---------------------------------------------------
		
		private function onRemoveFromStage(e:Event):void {
			var window:DisplayObject = e.target as DisplayObject;
			removePanel(window);
			dispose();
		}
		
		private function onMouseDown(e:MouseEvent):void {
			
			/*if(this._movingWindow != null) {
			this._movingWindow.stopDrag();
			DisplayUtil.stopAndRemove(this._movingWindow);
			this._movingWindow = null; 
			}
			*/
			this._oldMouseX = LoaderContainer.instance.stage.mouseX;
			this._oldMouseY = LoaderContainer.instance.stage.mouseY;
			
			this._isDrag = 0;
			
			LoaderContainer.instance.stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			LoaderContainer.instance.stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
		
		private function onMouseClickWindow(e:MouseEvent):void {
			if(this._window == null){
				return;
			}
			var parent:DisplayObjectContainer = _window.parent;
			if(parent == null){
				return;
			}
			parent.setChildIndex(_window, parent.numChildren - 1);
		}
		
		private function onMouseMove(e:MouseEvent):void {
			this._isDrag++;
			if(this._isDrag == 1) {
				// 2010.6.9 取消背景变暗效果
				//				LayerManager.getBaseTop().graphics.beginFill(0xFF000000, 0.5);
				//				LayerManager.getBaseTop().graphics.drawRect(0, 0, LoaderContainer.stageWidth, LoaderContainer.stageHeight);
				//				LayerManager.getBaseTop().graphics.endFill();
				
				//this._movingWindow = new Sprite();
				
				//	var b:Bitmap = DisplayUtil.cacheAsBitmap(this._window);
				//	b.alpha = 0.9;
				
				//	this._window.visible = false;
				
				var shadow:DropShadowFilter = new DropShadowFilter(8, 45, 0x000000, 1, 18, 18);
				Sprite(this._window).filters = [shadow];
				
				this._window.x = this._window.x + LoaderContainer.instance.stage.mouseX - this._oldMouseX;
				this._window.y = this._window.y + LoaderContainer.instance.stage.mouseY - this._oldMouseY;
				
				//this._movingWindow.addChild(b);
				/*	
				var layer:Sprite;
				if(LayerManager.getCurrentLayer() == LayerManager.BASE_LAYER) {
				layer = LayerManager.getBaseTop();
				}
				else {
				layer = LayerManager.getFightingTop();
				}
				*/
				//	layer.addChild(this._movingWindow);
				
				//				this._movingWindow.startDrag(false, 
				//						new Rectangle(-this._window.width * 0.75, -this._window.height * 0.75, 
				//						LoaderContainer.stageWidth + this._window.width * 0.5, 
				//						LoaderContainer.stageHeight +this._window.height * 0.5));
				Sprite(this._window).startDrag(false, 
					new Rectangle(0, 0, 
						LoaderContainer.stageWidth  - this._dragArea.width,
						LoaderContainer.stageHeight - this._dragArea.height));
			}
		}
		
		private function onMouseUp(e:MouseEvent):void {
			LoaderContainer.instance.stage.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			LoaderContainer.instance.stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			
			if(this._isDrag > 0) {
				if(e != null) {
					e.stopImmediatePropagation();
					e.stopPropagation();
				}
				
				// 2010.6.9 取消背景变暗效果
				//				LayerManager.getBaseTop().graphics.clear();
				/*
				if(this._movingWindow != null) {
				this._movingWindow.stopDrag();
				DisplayUtil.stopAndRemove(this._movingWindow);
				
				this._window.x = this._movingWindow.x;
				this._window.y = this._movingWindow.y;
				
				this._movingWindow = null; 
				}
				*/
				Sprite(this._window).stopDrag();
				this._window.filters = [];
			}
		}
		
	}
}