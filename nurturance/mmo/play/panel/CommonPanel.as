package mmo.play.panel
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.utils.Proxy;
	import flash.utils.flash_proxy;
	
	import mmo.play.dialog.ProgressLoader;

	dynamic public class CommonPanel extends Proxy implements IEventDispatcher
	{
		//这个注册事件主要是为了获取当前点击对象
		public static const ClickOther:String = "ClickOther";
		
		protected var _panel:Sprite;
		private var _onDispose:Function;
		private var _clickFunc:Object;
		private var _eventDispatcher:EventDispatcher;
		
		public function CommonPanel()
		{
			this._clickFunc = {};
			_eventDispatcher = new EventDispatcher();
			this.addClickFunc(ClickOther, onClickOther);
		}
		
		public function get panel():Sprite
		{
			return this._panel;
		}
		
		/**
		 * 支持多个key调用同一个函数，用逗号隔开
		 */
		public function addClickFunc(names:String, func:Function):void
		{
			if (func == null)
			{
				return;
			}
			var temp:Array = names.split(",");
			for each(var key:String in temp)
			{
				this._clickFunc[key] = func;
			}
		}
		
		public function set panelEnable(enable:Boolean):void{
			_panel.mouseChildren = _panel.mouseEnabled = enable;
		}
		
		public function removeClickFunc(name:String):void
		{
			delete this._clickFunc[name];
		}
		
		public function loadRes(panelPath:String, panelClass:String, onDispose:Function=null, onLoadedRes:Function=null, isAutoRemove:Boolean=true):void
		{
			this._onDispose = onDispose;
			ProgressLoader.load(panelPath, function(content:*):void{
				setPanel(content, isAutoRemove);
				
				if (onLoadedRes != null)
				{
					onLoadedRes.apply();
				}
				else
				{
					showPanel();
				}
				
			}, panelClass);
		}
		
		public function getMc(name:String):MovieClip
		{
			return this._panel[name];
		}
		public function getBtn(name:String):SimpleButton
		{
			return this._panel[name];
		}
		public function getSp(name:String):Sprite
		{
			return this._panel[name];
		}
		public function getDis(name:String):DisplayObject
		{
			return this._panel[name];
		}
		public function getTxt(name:String):TextField
		{
			return this._panel[name];
		}
		
		public function addEventListener(type:String, listener:Function, useCapture:Boolean=false, priority:int=0, useWeakReference:Boolean=false):void
		{
			_eventDispatcher.addEventListener(type, listener, useCapture, priority, useWeakReference);
		}
		
		public function removeEventListener(type:String, listener:Function, useCapture:Boolean=false):void
		{
			_eventDispatcher.removeEventListener(type, listener, useCapture);
		}
		
		public function dispatchEvent(event:Event):Boolean
		{
			return _eventDispatcher.dispatchEvent(event);
		}
		
		public function hasEventListener(type:String):Boolean
		{
			return _eventDispatcher.hasEventListener(type);
		}
		
		public function willTrigger(type:String):Boolean
		{
			return _eventDispatcher.willTrigger(type);
		}
		
		public function showPanel(layer:Sprite = null):void
		{
			ProgressLoader.close();
			PanelShower.showPanel(this._panel, layer);
		}
		
		public function closePanel():void
		{
			PanelShower.closePanel(this._panel);
		}
		
		private function setPanel(panel:Sprite, isAutoRemove:Boolean):void
		{
			this._panel = panel;
			this._panel.addEventListener(MouseEvent.CLICK, onClickPanel);
			if (isAutoRemove)
			{
				this._panel.addEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			}
		}
		
		private function onClickPanel(evt:MouseEvent):void
		{
			var name:String = evt.target.name;
			var func:Function;
			if (this._clickFunc.hasOwnProperty(name))
			{
				func = this._clickFunc[name];
				func.apply();
			}
			else
			{
				func = this._clickFunc[ClickOther];
				func.apply(null, [evt.target]);
			}
		}
		
		private function onClickOther(target:DisplayObject):void
		{
		}
		
		private function onRemoveFromStage(evt:Event):void
		{
			disposePanel();
		}
		
		public function disposePanel():void{
			_panel.removeEventListener(Event.REMOVED_FROM_STAGE, onRemoveFromStage);
			_eventDispatcher = null;
			if (this._onDispose != null){
				this._onDispose.apply();
				this._onDispose = null;
			}
			this._clickFunc = null;
			_panel.removeEventListener(MouseEvent.CLICK, onClickPanel);
			_panel = null;
		}
		
		override flash_proxy function getProperty(name:*):* {
			return _panel[name];
		}
	}
}