package mmo.interfaces.servicebuilder
{
	import mmo.interfaces.IDownloadInitService;
	import mmo.interfaces.IInitService;
	import mmo.interfaces.IService;
	import mmo.interfaces.InitServiceEvent;
	import mmo.interfaces.ServiceInfo;
	import mmo.interfaces.SingleLocator;
	
	/**
	 * 服务初始化，只对实现IDownloadInitService的service初始化
	 * @author hekehui
	 * 
	 */
	public class ServiceInitCommand extends ServiceBuidCommand
	{
		public function ServiceInitCommand()
		{
		}
		
		public override function execute(serviceInfo:ServiceInfo, service:IService
			, callback:Function, thisObject:*):void
		{
			super.execute(serviceInfo, service, callback, thisObject);
			
			// service是单例且已经初始化，不再进行初始化
			if(this.serviceInfo.state >= ServiceInitState.inited 
				&& this.serviceInfo.locator is SingleLocator)
			{
				this.executed();
				return;
			}
						
			if(this.service is IDownloadInitService)
			{
				var initService:IDownloadInitService = IDownloadInitService(service);
				initService.addEventListener(InitServiceEvent.onInited, onDownloadServiceInited);
				initService.init();
			}
			else
			{
				this.serviceInfo.state = ServiceInitState.inited;
				this.executed();
			}	
		}
		
		private function onDownloadServiceInited(evt:InitServiceEvent):void
		{
			var initService:IService = IService(evt.target);
			initService.removeEventListener(InitServiceEvent.onInited, onDownloadServiceInited);
			
			this.serviceInfo.state = ServiceInitState.inited;
		
			this.executed();	
		}		
	}
}