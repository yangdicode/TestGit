package mmo.play.material.changehelper
{
	import flash.utils.Dictionary;
	
	import mmo.framework.comm.SocketClient;
	import mmo.framework.comm.SocketClientEvent;
	import mmo.framework.domain.halos.HalosClient;
	import mmo.play.material.panel.MaterialGetPanel;
	
	public class UserHaloChangeObserver implements IResourceChangeObserver
	{
		private var _userHalosChange:Dictionary;
		public function UserHaloChangeObserver()
		{
			_userHalosChange = new Dictionary();
		}
		
		public function start():void
		{
			SocketClient.instance.addEventListener(HalosClient.EVT_ADD_NEW_HALOS, onAddNewHalos);
		}
		
		public function stop():void
		{
			SocketClient.instance.removeEventListener(HalosClient.EVT_ADD_NEW_HALOS, onAddNewHalos);
		}
		
		public function restart():void
		{
			clear();
			start();
		}
		
		public function showChangePanel(type:int=1):void
		{
			stop();
			for(var userHaloId:* in _userHalosChange){
				var objData:Object = _userHalosChange[userHaloId];
				if( objData == null )
					continue;
				MaterialGetPanel.instance().showUserHaloPanel( objData );
			}
		}
		
		public function getChangeValue():*
		{
			return _userHalosChange;
		}
		
		public function clear():void
		{
			stop();
			_userHalosChange = new Dictionary();
		}
		
		public function isChangeValue():Boolean
		{
			return false;
		}
		
		private function onAddNewHalos(evt:SocketClientEvent):void{
			var objData:Object = evt.params["halo"];
			var userHaloId:int = objData["haloNumber"];
			
			_userHalosChange[userHaloId] = objData;
		}
		
	}
}