package mmo.framework.domain.logindataclient
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	
	import mmo.framework.domain.UserInfoClient;
	import mmo.framework.domain.oneoff.OneOffClient;
	import mmo.framework.domain.property.UserPropertyClient;

	public class LoginDataIniter extends EventDispatcher
	{
		public static const ON_DATA_INITED:String = "onDataInited";
		private var _initSymble:int;
		private var _clientList:Vector.<LoginDataClient> = new Vector.<LoginDataClient>();
		private var _allInited:Boolean;
		private static var _instance:LoginDataIniter = new LoginDataIniter();
		
		public function LoginDataIniter(){
			_clientList.push(UserPropertyClient.instance);
			_clientList.push(UserInfoClient.instance);
			_clientList.push(OneOffClient.instance);
		}
		
		public static function get instance():LoginDataIniter{
			return _instance;
		}
		
		public function startListenData():void{
			for each(var client:LoginDataClient in _clientList){
				client.addDataListener();
			}
		}
		
		public function get allInited():Boolean{
			return _allInited;
		}
		
		function onInitedEachData():void{
			_initSymble ++;
			if(_clientList.length == _initSymble){
				_allInited = true;
				this.dispatchEvent(new Event(ON_DATA_INITED));
				_clientList = null;
			}
		}
		
	}
}