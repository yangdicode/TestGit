package mmo.framework.domain.logindataclient
{
	import flash.events.EventDispatcher;

	public class LoginDataClient extends EventDispatcher
	{
		public function LoginDataClient(){
		}
		
		public function addDataListener():void{
		}
		
		final protected function onDataInited():void{
			LoginDataIniter.instance.onInitedEachData();
		}
		
	}
}