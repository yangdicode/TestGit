package mmo.play.panel.tab
{

	import flash.display.Sprite;
	import flash.system.ApplicationDomain;

	import mmo.play.dialog.ProgressLoader;
	import mmo.play.panel.CommonPanel;
	import mmo.play.panel.MovieLayerPanel;
	import mmo.util.component.button.RadioButton;
	import mmo.util.component.button.RadioButtonEvent;

	/**
	 * @author xuguowei
	 * 创建时间：2016-1-31 下午1:51:23
	 * 功能：通用的带tab切换的界面
	 */
	public class CommonTabPanel
	{

		private var _radio:RadioButton;
		private var _panels:Object = {};
		private var _currentView:ITabView;
		private var _panel:MovieLayerPanel;
		private var _panelConfic:Object;
		private var _resUrl:String;
		private var _resClass:String;
		private var _initFun:Function;
		private var _tabNum:int;	
		private var _firstIndex:int;

		public function CommonTabPanel()
		{

		}


		public function init(confic:Object,//
			resUrl:String,//
			resCla:String,//
			tabNum:int, //
			index:int = 0,//
			initFun:Function = null):void{

			_panelConfic = confic;
			_resUrl = resUrl;
			_resClass = resCla;
			_tabNum = tabNum;
			_initFun = initFun;
			_firstIndex = index;
			show();			
		}


		private function show():void{
			_panel = new MovieLayerPanel;
			_panel.loadRes(_resUrl,//
				_resClass,onDispose,onLoadRes);
		}

		private function onDispose():void{

			for each(var view:ITabView in _panels){
				view.dispose();
			}
			_panels = null;

			_currentView = null;
			_panel = null;
			_radio.removeEventListener(RadioButtonEvent.ON_SELECT_BUTTON,onRadioChange);
			_radio = null;
		}

		private function onLoadRes():void{
			if(_initFun){
				_initFun(initView)
			}else{
				initView();
			}
			function initView():void{
				initRadion();
				_panel.showPanel();
			}

		}

		private function initRadion():void{
			_radio = new RadioButton();
			for(var i:int = 0; i < _tabNum; i++){
				var radio:RadioButton = new RadioButton(_panel.getMc("mcTab" + i),i);
				_radio.addChild(radio);
			}
			_radio.addEventListener(RadioButtonEvent.ON_SELECT_BUTTON,onRadioChange);
			_radio.select([_firstIndex]);
		}

		private function onRadioChange(e:RadioButtonEvent):void{
			var index:int = _radio.curSelectIndex;
			var view:ITabView; 
			if(_panels.hasOwnProperty(index)){
				view = 	_panels[index];
			}else{
				var data:CommonTabData = _panelConfic[index];
				function callBack(content:*):void{
					ProgressLoader.close();
					_panels[index] = view = content;
					loadEnd();
				}
				ProgressLoader.load(data.path,callBack,//
					data.cla);
			}
			loadEnd();			
			function loadEnd():void{
				if(_currentView){
//					_panel.panel.removeChild(_currentView.getPanel());
					_currentView.getPanel().visible = false;
				}

				if(view){
					_currentView = view;
					_panel.panel.addChild(_currentView.getPanel());
					_currentView.getPanel().visible = true;
				}
			}
		}

		public function get panel():MovieLayerPanel{
			return _panel;
		}


	}
}

