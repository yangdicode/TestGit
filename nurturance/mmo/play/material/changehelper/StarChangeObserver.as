package mmo.play.material.changehelper
{
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.play.material.changehelper.IResourceChangeObserver;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class StarChangeObserver implements IResourceChangeObserver
	{
		private static const EVT_ADD_STAR_BASIC_INFO:String = "91_e1";
		
		private var _sids:Array = [];
		
		public function StarChangeObserver(){
		}
		
		public function start():void{
			SocketClient.instance.addEventListener(EVT_ADD_STAR_BASIC_INFO, onAddStar);
		}
		
		public function stop():void{
			SocketClient.instance.removeEventListener(EVT_ADD_STAR_BASIC_INFO, onAddStar);
		}
		
		public function restart():void{
			_sids = [];
			SocketClient.instance.addEventListener(EVT_ADD_STAR_BASIC_INFO, onAddStar);
		}
		
		public function showChangePanel(type:int=1):void{
			if(_sids.length > 0){
				MaterialGetPanel.instance().showGetSuperStarPanel(_sids);
			}
		}
		
		public function getChangeValue():*{
			return _sids;
		}
		
		public function clear():void{
			_sids = [];
		}
		
		public function isChangeValue():Boolean{
			return _sids.length > 0;
		}
		
		private function onAddStar(evt:SocketClientEvent):void{
			_sids.push(evt.params.binfo.sid);
		}
		
	}
}