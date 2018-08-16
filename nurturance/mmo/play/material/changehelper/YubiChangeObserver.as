package mmo.play.material.changehelper
{
	import mmo.framework.domain.UserInfo;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class YubiChangeObserver extends MaterialChangeObserverBase
	{
		public function YubiChangeObserver()
		{
		}
		
		public override function showChangePanel(type:int=1):void
		{
			stop();
			if(_changeNum > 0){
				MaterialGetPanel.instance().showYubiPanel(_changeNum);
			}
		}
		
		protected override function onScoreChanged(evt:ChangeableEvent):void
		{
			if(evt.object != ModelInfo.getUserInfo()){
				return;
			}
			if(evt.params.property != UserInfo.Yubi){
				return;
			}
			
			var changeNum:int = int(evt.params.newValue) - int(evt.params.orgValue);
			_changeNum += changeNum;
		}	
	}
}