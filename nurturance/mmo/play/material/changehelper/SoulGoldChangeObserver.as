package mmo.play.material.changehelper
{
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.UserInfo;
	import mmo.framework.domain.UserInfoClient;
	import mmo.framework.model.changeable.ChangeableDispatcher;
	import mmo.framework.model.changeable.ChangeableEvent;
	import mmo.play.info.ModelInfo;
	import mmo.play.material.changehelper.IResourceChangeObserver;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class SoulGoldChangeObserver implements IResourceChangeObserver
	{
		private var _changeNum:int = 0;
		private var _extChangeNum:int = 0;
		public function SoulGoldChangeObserver()
		{
		}
		
		public function start():void
		{
			ChangeableDispatcher.instance.addEventListener(ChangeableEvent.onObjectPropertyChanged, onSoulGoldChanged);
			UserInfoClient.instance.addEventListener(UserInfoClient.onExtCurrencyUpdated, onExtSoulGoldUpdated);
		}
		
		public function stop():void
		{
			ChangeableDispatcher.instance.removeEventListener(ChangeableEvent.onObjectPropertyChanged, onSoulGoldChanged);
			UserInfoClient.instance.removeEventListener(UserInfoClient.onExtCurrencyUpdated, onExtSoulGoldUpdated);
		}
		
		public function restart():void
		{
			clear();
			start();
		}
		
		public function showChangePanel(type:int=1):void
		{
			if(_changeNum > 0){
				MaterialGetPanel.instance().showExpPanel(_changeNum, null, _extChangeNum);
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
			_extChangeNum = 0;
		}	
		
		private function onSoulGoldChanged(evt:ChangeableEvent):void
		{
			if(evt.object != ModelInfo.getUserInfo()){
				return;
			}
			if(evt.params.property != UserInfo.SGold){
				return;
			}
			
			var changeNum:int = int(evt.params.newValue) - int(evt.params.orgValue);
			_changeNum += changeNum;
		}
		
		private function onExtSoulGoldUpdated(evt:SocketClientEvent):void
		{
			_extChangeNum += int(evt.params["extSoulGold"]);
		}
	}
}