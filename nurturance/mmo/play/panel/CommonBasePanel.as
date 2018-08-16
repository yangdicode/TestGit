package mmo.play.panel
{
	import flash.display.InteractiveObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.getQualifiedClassName;
	
	import mmo.common.panel.PanelEvent;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.dialog.ProgressLoader;

	public class CommonBasePanel
	{
		private var _view:Sprite;
		private var _layer:Sprite;
		
		public function CommonBasePanel()
		{
		}
		
		/**	显示面板 **/		
		final public function show(layer:Sprite = null):void
		{
			_layer = layer;
			ProgressFullSprite.show();
			preloadResource();
		}
		
		/** 下载资源之前做事情 如获取后端数据 这个重写之后需要super一下的 **/
		protected function preloadResource():void
		{
			ProgressFullSprite.close();
			startLoad();
		}
		
		/** 下载资源完成之后做事情 如初始化面板  **/
		protected function initPanelAfterLoaded():void
		{			
		}
		
		/** 面板显示之后做事情 如播放个动画之类的  **/
		protected function initAfterPanelShow():void
		{			
		}
		
		/** 释放资源 **/
		protected function dispose():void
		{			
		}
		
		protected function get panelPath():String
		{
			return null;
		}
		
		protected function get panelClass():String
		{
			return null;
		}
		
		/** 关闭面板 不要把view置为null **/
		protected function closeMe():void
		{		
			if (_view == null) //吃掉误操作的报错
			{
				//throw new Error("panel为空的时候dispose，类为" + getQualifiedClassName(this));
				trace("panel为空的时候dispose，类为" + getQualifiedClassName(this));
				return;
			}
			PanelShower.closePanel(_view);			
		}
		
		/**  设置关闭按钮 **/
		final protected function setCloseButton(btn:InteractiveObject):void
		{
			btn.addEventListener(MouseEvent.CLICK, onClickClose);
		}
		
		/***  面板view **/
		final protected function get view():Sprite
		{
			return _view;
		}
		
		private function startLoad():void
		{
			ProgressLoader.load(panelPath, onLoadedRes, panelClass);
		}
		
		private function onLoadedRes(view:Sprite):void
		{
			_view = view;			
			initPanelAfterLoaded();		
			ProgressLoader.close();
			
			initPanel();
			showPanel();
			_view.addEventListener(PanelEvent.REMOVED,onDispose);
			
			initAfterPanelShow();
		}
		
		protected function showPanel():void{
			PanelShower.showPanel(_view,_layer);
		}
		
		private function initPanel():void
		{
		}
		
		private function onDispose(evt:PanelEvent):void{
			dispose();
			_view.removeEventListener(PanelEvent.REMOVED,onDispose);
			_view = null;
		}
		
		private function onClickClose(evt:MouseEvent):void
		{
			closeMe();
		}
		
	}
}