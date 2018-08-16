package mmo.play.material.changehelper
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.play.material.panel.MaterialGetPanel;

	public class RangersChangeObserver implements IResourceChangeObserver
	{
		private var _urIds:Array = [];
		
		public function RangersChangeObserver(){
		}
		
		public function start():void{
			SocketClient.instance.addEventListener("102_e5", onAddRanger);
		}
		
		public function stop():void{
			SocketClient.instance.removeEventListener("102_e5", onAddRanger);
		}
		
		public function restart():void{
			_urIds = [];
			SocketClient.instance.addEventListener("102_e5", onAddRanger);
		}
		
		public function showChangePanel(type:int=1):void{
			if(_urIds.length > 0){
				MaterialGetPanel.instance().showGetRangersPanel(_urIds);
			}
		}
		
		public function getChangeValue():*{
			return _urIds;
		}
		
		public function clear():void{
			_urIds = [];
		}
		
		public function isChangeValue():Boolean{
			return _urIds.length > 0;
		}
		
		private function onAddRanger(evt:SocketClientEvent):void{
			var infoList:Array = evt.params.monsters;
			for each(var info:Object in infoList){
				_urIds.push(info.umid);
			}
		}
		
	}
}