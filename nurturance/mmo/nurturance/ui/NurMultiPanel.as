package mmo.nurturance.ui
{
	import mmo.nurturance.ui.multi.NurMultiPage0;
	import mmo.nurturance.ui.multi.NurMultiPage1;
	import mmo.play.eventdispatcher.CommonEvent;
	import mmo.play.eventdispatcher.CommonEventDispatcher;
	import mmo.play.multipage.MultiPageManager;
	import mmo.play.panel.MovieLayerPanel;
	import mmo.util.component.button.RadioButton;
	import mmo.util.component.button.RadioButtonEvent;

	public class NurMultiPanel
	{
		private var _map:Object = {
			"0":NurMultiPage0,
			"1":NurMultiPage1
		}
		private var _mlp:MovieLayerPanel;
		private var _mpm:MultiPageManager;
		private var _radioBtn:RadioButton;
		
		private var _defaultPage:int;
		
		public function NurMultiPanel()
		{
		}
		
		public function show(defaultPage:int = 0):void{
			_defaultPage = defaultPage;
			_mlp = new MovieLayerPanel();
			_mlp.loadRes("nurturance/nursysui/resmulti", "mmo.nurturance.sysui.MultiPanel", onDispose, onLoadedRes);
		}
		
		private function onDispose():void{
			CommonEventDispatcher.instance.removeEventListener(CommonEvent.ClosePanelInfo, onClosePanel);
			_radioBtn.dispose();
			_radioBtn = null;
			_mpm = null;
			_mlp = null;
		}
		
		private function onLoadedRes():void{
			_radioBtn = new RadioButton();
			_mpm = new MultiPageManager(_mlp.getSp("mcContainer"));
			for(var key:String in _map){
				_radioBtn.addChild(new RadioButton(_mlp.getMc("mcTab" + key), int(key)));
				_mpm.addPage(key, _map[key]);
			}
			_radioBtn.addEventListener(RadioButtonEvent.ON_SELECT_BUTTON, onSelectButton);
			CommonEventDispatcher.instance.addEventListener(CommonEvent.ClosePanelInfo, onClosePanel);
			_radioBtn.select();
			_mlp.showPanel();
		}
		
		private function onClosePanel(evt:CommonEvent):void{
			if(evt.params.key == "NurMultiPanel"){
				_mlp.closePanel();
			}
		}
		
		private function onSelectButton(evt:RadioButtonEvent):void{
			var index:int = _radioBtn.selectedIndexs[0];
			_mpm.showPage(index);
		}
	}
}