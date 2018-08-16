package mmo.play.material.changehelper
{
	import flash.utils.Dictionary;
	
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.fairy.FairysClient;
	import mmo.framework.domain.fairy.UserFairy;
	import mmo.play.material.changehelper.IResourceChangeObserver;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class FairyChangeObserver implements IResourceChangeObserver
	{
		private var _fairyChange:Dictionary;
		public function FairyChangeObserver()
		{
			_fairyChange = new Dictionary();
		}
		
		public function start():void
		{
			SocketClient.instance.addEventListener(FairysClient.onAddFairys, onFairyChange);
		}
		
		public function stop():void
		{
			SocketClient.instance.removeEventListener(FairysClient.onAddFairys, onFairyChange);
		}
		
		public function restart():void
		{
			clear();
			start();
		}
		
		public function showChangePanel(type:int=1):void
		{
			stop();
			for(var fairyId:* in _fairyChange){
				var changeNum:int = _fairyChange[fairyId];
				if(changeNum <= 0)
					continue;
				MaterialGetPanel.instance().showFairyPanel(fairyId, changeNum);
			}
		}
		
		public function getChangeValue():*
		{
			return _fairyChange;
		}
		
		public function clear():void
		{
			stop();
			_fairyChange = new Dictionary();
		}
		
		public function isChangeValue():Boolean
		{
			return false;
		}
		
		private function onFairyChange(evt:SocketClientEvent):void{
			var changes:Array = evt.params.bags;
			for each(var changeInfo:Object in changes){
				var fairyId:int = UserFairy.parse(changeInfo).fairyId;
				if(_fairyChange.hasOwnProperty(fairyId)){
					_fairyChange[fairyId] ++;
				}else{
					_fairyChange[fairyId] = 1;
				}
			}
		}
	}
}