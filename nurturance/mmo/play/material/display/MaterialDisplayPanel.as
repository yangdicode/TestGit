package mmo.play.material.display
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.common.panel.PanelEvent;
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.UserMaterial;
	import mmo.play.dialog.NewDialog;
	import mmo.play.layer.LayerManager;
	import mmo.play.material.MaterialFacade;
	import mmo.play.material.filter.UserMaterialFilter;
	import mmo.play.material.visitor.UserMaterialVisitor;
	import mmo.play.tips.TipsManager;
	import mmo.util.component.page.PageComponent;
	import mmo.util.component.page.PageManagerEvent;
	
	/**
	 * 显示用户拥有的各种物品的面板
	 * 
	 * */
	public class MaterialDisplayPanel extends EventDispatcher
	{
		private var _view:Sprite;
		private var _config:MaterialDisplayConfig;
		
		private var _tabs:Array;
		private var _curTab:MovieClip;
		private var _hasChangeTab:Boolean;
		
		private var _displayers:Array;
		private var _pageComponent:PageComponent;
		public function MaterialDisplayPanel(view:Sprite, config:MaterialDisplayConfig)
		{
			_view = view;
			_config = config;
			
			initTabs();
			initDisplayers();
		}
		
		public function get view():Sprite
		{
			return _view;
		}	
		
		public function show(x:Number, y:Number):void
		{
			NewDialog.show(_view, LayerManager.getBaseTop(), x, y, true);	
			_view.addEventListener(PanelEvent.REMOVED, onRemoved);
		}	
		
		public function switchType(key:String):void
		{
			var typeInfo:Object = _config.getTypeInfo(key);
			var type:int = typeInfo["type"];
			var typeArr:Array = typeInfo["subType"] as Array;
			var umArr:Array = UserMaterialFilter.applyFilters(MaterialFacade.getFacade(type).accept(new UserMaterialVisitor()), typeInfo["filters"] as Array);
			_curTab = _view[typeInfo["tabName"]];
			_curTab.gotoAndStop(1);
			
			_pageComponent.data = umArr;
			_pageComponent.gotoPage(1);
		}	
		
		public function dispose():void
		{
			for each(var dis:MaterialDisplayer in _displayers)
			{
				dis.removeEventListener(MaterialDisplayEvent.ON_CHOOSE_MATERIAL, transEvent);
				dis.dispose();
			}
			_displayers = null;
			
			_pageComponent.removeEventListener(PageManagerEvent.PAGE_CHANGED, onPageChanged);
			_pageComponent.dispose();
			_pageComponent = null;
			
			DisplayUtil.stopAndRemove(_view);
			this.dispatchEvent(new MaterialDisplayEvent(MaterialDisplayEvent.ON_CLOSED));
		}	
		
		private function onRemoved(evt:PanelEvent):void
		{
			_view.removeEventListener(PanelEvent.REMOVED, onRemoved);
			dispose();
		}	
		
		private function initTabs():void
		{
			_tabs = [];
			var typeConfig:Object = _config.getTypeConfig();
			var info:Object;
			var tab:MovieClip;
			for (var key:String in typeConfig)
			{
				info = typeConfig[key];
				tab = _view[info["tabName"]] as MovieClip;
				TipsManager.getInstance().addTips(tab, info["desc"]);
				tab.gotoAndStop(2);
				tab.buttonMode = true;
				tab.addEventListener(MouseEvent.CLICK, onSwitchTab);
				_tabs.push(tab);
			}	
		}	
		
		private function initDisplayers():void
		{
			_displayers = [];
			var count:int = _config.diplayerCount;
			var displayer:MaterialDisplayer;
			for (var i:int = 0; i < count; i++)
			{
				displayer = new MaterialDisplayer(_view["dis" + i] as Sprite);
				displayer.addEventListener(MaterialDisplayEvent.ON_CHOOSE_MATERIAL, transEvent);
				_displayers.push(displayer);
			}	
			
			_pageComponent = new PageComponent(null, count, _view["btnNext"] as SimpleButton, _view["btnPrev"] as SimpleButton
				, _view["txtPage"] as TextField, _view["txtTotal"] as TextField);
			_pageComponent.addEventListener(PageManagerEvent.PAGE_CHANGED, onPageChanged);
		}	
		
		private function onPageChanged(evt:PageManagerEvent):void
		{
			var pageItems:Array = evt.pageItems;
			updateDisplayers(pageItems);
		}	
		
		private function updateDisplayers(items:Array):void
		{
			var displayer:MaterialDisplayer;
			var um:UserMaterial;
			for (var i:int; i < _displayers.length; i++)
			{
				displayer = _displayers[i] as MaterialDisplayer;
				um = items[i] as UserMaterial;
				displayer.update(um);
			}	
		}
		
		private function onSwitchTab(evt:MouseEvent):void
		{
			var curTab:MovieClip = evt.currentTarget as MovieClip;
			if(curTab == _curTab)
			{
				return;
			}	
			updateTab(curTab);
			switchType(_config.getTypeKeyByTab(curTab.name));
		}	
		
		private function updateTab(curTab:MovieClip):void
		{
			for each(var tab:MovieClip in _tabs)
			{
				tab.gotoAndStop(2);
			}
			if(_curTab == curTab)
			{
				_hasChangeTab = false;
			}else
			{
				_hasChangeTab = true;
			}	
			_curTab = curTab;
			_curTab.gotoAndStop(1);
		}	
		
		private function transEvent(evt:MaterialDisplayEvent):void
		{
			this.dispatchEvent(evt.clone());
		}	
	}
}