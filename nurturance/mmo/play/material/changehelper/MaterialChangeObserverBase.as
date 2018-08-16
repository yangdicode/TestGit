package mmo.play.material.changehelper
{
	import mmo.framework.domain.UserInfo;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.framework.model.changeable.ChangeableObject;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class MaterialChangeObserverBase implements IResourceChangeObserver
	{
		protected var _changeNum:int;
		
		public function MaterialChangeObserverBase()
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
		
		public function showChangePanel(type:int=1):void
		{
			stop();
			//			if(_changeNum > 0){
			//				MaterialGetPanel.instance().showMoneyPanel(_changeNum);
			//			}
			throw new Error("you must custom your own mathod:showChangePanel");
		}
		
		protected function onScoreChanged(evt:ChangeableEvent):void
		{
//			if(evt.object != ModelInfo.getUserInfo()){
//				return;
//			}
//			if(evt.params.property != UserInfo.Yubi){
//				return;
//			}
//			
//			var changeNum:int = int(evt.params.newValue) - int(evt.params.orgValue);
//			_changeNum += changeNum;
			throw new Error("you must custom your own mathod:showChangePanel");
		}	
	}
}