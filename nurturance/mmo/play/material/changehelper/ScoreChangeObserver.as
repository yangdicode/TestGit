package mmo.play.material.changehelper
{
	import mmo.framework.domain.UserInfo;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.ChangeableObject;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class ScoreChangeObserver implements IResourceChangeObserver
	{
		private var _changeNum:int;
		public function ScoreChangeObserver()
		{
		}
		
		public function start():void
		{
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onScoreChanged);
		}
		
		public function stop():void
		{
			ChangeableDispatcher.instance.removeEventListener(ChangeableEvent.onObjectPropertyChanged, onScoreChanged);
		}
		
		public function restart():void
		{
			clear();
			start();
		}
		
		public function showChangePanel(type:int=1):void
		{
			stop();
			if(_changeNum > 0){
				MaterialGetPanel.instance().showMoneyPanel(_changeNum);
			}
		}
		
		public function getChangeValue():*
		{
			stop();
			return _changeNum;
		}
		public function isChangeValue():Boolean
		{
			return int(getChangeValue())>0;
		}
		
		public function clear():void
		{
			_changeNum = 0;
		}	
		
		private function onScoreChanged(evt:ChangeableEvent):void
		{
			if(evt.object != ModelInfo.getUserInfo()){
				return;
			}
			if(evt.params.property != UserInfo.SCORE){
				return;
			}
			
			var changeNum:int = int(evt.params.newValue) - int(evt.params.orgValue);
			_changeNum += changeNum;
		}	
	}
}