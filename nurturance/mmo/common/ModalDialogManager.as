package mmo.common
{

	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;
	
	import mmo.common.effect.fade.FadeInEffect;
	import mmo.common.effect.fade.FadeOutEffect;
	import mmo.common.effect.popup.PopDownEffect;
	import mmo.common.effect.popup.PopUpEffect;
	import mmo.common.panel.PanelEffect;
	import mmo.common.panel.PanelEvent;

	public class ModalDialogManager
	{
		private static var instances:Dictionary = new Dictionary();
		
		public static var defaultLayer:Sprite = new Sprite();
		//~ fields ------------------------------------------------------------
		/** 窗口列表 */
		private var _windowTable:Array;
		/**模态框所处的层次**/
		private var _currentLayer:Sprite;

		//~ public methods ----------------------------------------------------

		public function ModalDialogManager(_currentLayer:Sprite)
		{
			this._currentLayer = _currentLayer;
			this._windowTable = [];
		}

		public static function getInstance(layer:Sprite):ModalDialogManager
		{
			if(layer == null)
			{
				layer = defaultLayer;
			}	
			var _instance:ModalDialogManager = instances[layer] as ModalDialogManager;
			if (_instance == null)
			{
				_instance = new ModalDialogManager(layer);
				instances[layer] = _instance;
			}
			return _instance;
		}

		/**
		 * 添加模态对话框
		 *
		 * @param	window		窗口
		 * @param	alignType	位置。none时可用x,y调整坐标
		 * @param	x			窗口坐标，alignType为none时有效
		 * @param	y
		 * @param	effect		窗口动画效果，默认为弹出效果
		 * @param	effect		窗口动画效果，默认为弹出效果
		 * @param	grayBackground 是否显示灰色底色。false时为透明底
		 * @return	是否添加成功
		 */
		public function addModalDialog(window:DisplayObject,
			alignType:int = 4,
			effect:int = 0,
			grayBackground:Boolean = true,
			x:int = -1,
			y:int = -1):Boolean
		{
			if (this._windowTable.indexOf(window) >= 0)
			{
				return false;
			}
			
			var stage:Stage = this._currentLayer.stage;
			// 调整显示位置
			DisplayUtil.align(window, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight), alignType);
			
			//如果有特定x,y，特定的x，y调整位置
			
			if (x != -1){
				window.x = x;
			}
			if (y != -1){
				window.y = y;
			}

//			var layer:Sprite;
//			var currentLayer:String = LayerManager.getCurrentLayer();
//			if (currentLayer == LayerManager.BASE_LAYER)
//			{
//				layer = LayerManager.getBaseTop();
//			}
//			else
//			{
//				layer = LayerManager.getFightingTop();
//			}
			var windowContainer:Sprite = new ModalDialogContainer(_currentLayer, grayBackground);
			
			if (this._windowTable.length == 0)
			{
				disableLayers();
			}
			this._windowTable.push(window);

			if (effect == PanelEffect.POP)
			{
				new PopUpEffect(windowContainer, window, window.x + window.width * 0.45, window.y + window.height * 0.45, window.x, window.y, 0.3, onPanelAdded);
			}
			else if (effect == PanelEffect.FADE)
			{
				new FadeInEffect(windowContainer, window, window.x, window.y, 0.22, onPanelAdded);
			}
			else
			{
				trace("window: " + window + "  "+ windowContainer)
				windowContainer.addChild(window);
				onPanelAdded(window);
			}

			return true;
		}

		/**
		 * 关闭浮动显示窗口
		 *
		 * @param	window		待关闭的浮动窗口
		 * @param	effect		动画效果，默认为弹出效果
		 */
		public function removeModalDialog(window:DisplayObject, effect:int = 0):Boolean
		{			
//			effect = PanelEffect.NONE;
			var index:int = this._windowTable.indexOf(window);
			if (index < 0)
			{
				return false;
			}

			this._windowTable.splice(index, 1);

			if(window.parent == null){
				return false;
			}
			
			if (this._windowTable.length == 0)
			{
				enableLayers();
			}

			if (effect == PanelEffect.FADE)
			{
				new FadeOutEffect(window, 0.2, onPanelRemoved);
			}
			else if (effect == PanelEffect.POP)
			{
				new PopDownEffect(window, window.x + window.width * 0.45, window.y + window.height * 0.45, 0.25, onPanelRemoved);
			}
			else
			{
//				if(window is IDispose){
//					IDispose(window).dispose();
//				}				
				onPanelRemoved(window);
			}

			return true;
		}

		/**
		 * 关闭所有浮动窗口
		 */
		public function clearAll():void
		{
//			for each(var window:DisplayObject in this._windowTable)
//			{				
//				removeModalDialog(window);	
//				ModalDialog.removeDialogFromtable(window);
//			}
			
			var len:int = this._windowTable.length;
			var window:DisplayObject;
			for(var i:int = len - 1; i>=0; i--){
				window = this._windowTable[i];
				removeModalDialog(window);	
				ModalDialog.removeDialogFromtable(window);
			}
			
		}

		//~ private methods ---------------------------------------------------

		/**
		 * 一个面板已被添加
		 */
		private function onPanelAdded(window:DisplayObject):void
		{
			window.dispatchEvent(new PanelEvent(PanelEvent.ADDED));
		}

		/**
		 * 一个面板已被移除
		 */
		private function onPanelRemoved(window:DisplayObject):void
		{
			DisplayUtil.stopAndRemove(window.parent);
			window.dispatchEvent(new PanelEvent(PanelEvent.REMOVED));
		}

		private function disableLayers():void
		{
//			var layers:Array = getLayers();

			for each (var disObj:Sprite in _currentLayer)
			{
				disObj.mouseChildren = false;
				disObj.mouseEnabled = false;
			}
		}

		private function enableLayers():void
		{
//			var layers:Array = getAllLayers();

			for each (var disObj:Sprite in _currentLayer)
			{
				disObj.mouseChildren = true;
				disObj.mouseEnabled = true;
			}

//			LayerManager.getBaseTop().graphics.clear();
//			LayerManager.getFightingTop().graphics.clear();
		}

//		private function getAllLayers():Array
//		{
//			var layers:Array = [];
//			layers.push(LayerManager.getBaseScene());
//			layers.push(LayerManager.getBaseControl());
//			layers.push(LayerManager.getBaseApp());
//			layers.push(LayerManager.getBaseIcons())
//			layers.push(LayerManager.getBaseTips());
//			layers.push(LayerManager.getFightingScene());
//			layers.push(LayerManager.getFightingControl());
//			layers.push(LayerManager.getFightingTips());
//			return layers;
//		}

//		private function getLayers():Array
//		{
//			var layers:Array = [];
//			var currentLayer:String = LayerManager.getCurrentLayer();
//			if (currentLayer == LayerManager.BASE_LAYER)
//			{
//				layers.push(LayerManager.getBaseScene());
//				layers.push(LayerManager.getBaseControl());
//				layers.push(LayerManager.getBaseApp());
//				layers.push(LayerManager.getBaseIcons())
//				layers.push(LayerManager.getBaseTips());
//			}
//			else
//			{
//				layers.push(LayerManager.getFightingScene());
//				layers.push(LayerManager.getFightingControl());
//				layers.push(LayerManager.getFightingTips());
//			}
//			return layers;
//		}

	}
}