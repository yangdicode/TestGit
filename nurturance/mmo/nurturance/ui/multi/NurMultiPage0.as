package mmo.nurturance.ui.multi
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	
	import mmo.nurturance.ui.util.NurUIUtil;
	import mmo.play.multipage.LoadPageBase;
	import mmo.play.scene.helper.abstractscene.IAbstractSceneHelper;
	import mmo.util.component.button.RadioButton;
	import mmo.util.component.button.RadioButtonEvent;
	
	public class NurMultiPage0 extends LoadPageBase
	{
		private var _radioBtn:RadioButton;
		private var _clsArr:Array = [NurMultiPage0_0, NurMultiPage0_1, NurMultiPage0_2];
		private var _subPage:INurMultiPage0SubPage;
		
		public function NurMultiPage0()
		{
			super();
		}
		
		override protected function get file():String{
			return "nurturance/nursysui/resmulti";
		}
		
		override protected function get className():String{
			return "mmo.nurturance.sysui.MutilPage" + _key;
		}
		
		override public function dispose():void{
			_radioBtn.dispose();
			_radioBtn = null;
			tryRemoveSubPage();
			super.dispose();
		}
		
		override protected function initPage():void{
			_radioBtn = new RadioButton();
			for(var i:int = 0; i < _clsArr.length; i++){
				var mcTab:MovieClip = _view["mcTab0_" + i];
				_radioBtn.addChild(new RadioButton(mcTab, i));
			}
			_radioBtn.addEventListener(RadioButtonEvent.ON_SELECT_BUTTON, onSelectButton);
			_radioBtn.select();
			NurUIUtil.initScrollPanel(MovieClip(_view["mcPage"]), MovieClip(_view["mcPage"]["mcBg"]), MovieClip(_view["mcPage"]["mcContainer"]));
			super.initPage();
		}
		
		private function onSelectButton(evt:RadioButtonEvent):void{
			tryRemoveSubPage();
			var index:int = _radioBtn.selectedIndexs[0];
			var cls:Class = _clsArr[index] as Class;
			_subPage = new cls();
			_subPage.init(MovieClip(_view["mcPage"]["mcContainer"]));
		}
		
		private function tryRemoveSubPage():void{
			if(_subPage){
				_subPage.dispose();
				_subPage = null;
			}
		}
	}
}