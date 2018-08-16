package mmo.interfaces.servicebuilder
{
	import flash.utils.getDefinitionByName;
	
	import mmo.interfaces.IService;
	import mmo.interfaces.IServiceLocator;
	import mmo.interfaces.ServiceInfo;
	
	/**
	 * (仅)创建service对象实列
	 * @author hekehui
	 * 
	 */
	public class ServiceCreateCommand extends ServiceBuidCommand
	{
		public function ServiceCreateCommand()
		{
		}

		public override function execute(serviceInfo:ServiceInfo, service:IService
			, callback:Function, thisObject:*):void
		{
			super.execute(serviceInfo, service, callback, thisObject);
			
			// 已经创建过不再创建实例
			if(this.serviceInfo.state >= ServiceInitState.created)
			{
				this.service = this.createService(serviceInfo);
				this.executed();
				return;	
			}
			
			this.service = this.createService(serviceInfo);
			if(this.service != null)
			{
				serviceInfo.state = ServiceInitState.created;
				this.executed();
			}
			else
			{
				this.executed(false);
			}
		}
		
		/**
		 * 创建Service
		 * */
		function createService(serviceInfo:ServiceInfo):IService{
			if(serviceInfo.locator == null){
//				trace("serviceInfo.locatorType " + serviceInfo.locatorType);
				var locatorClass:Class = getDefinitionByName(serviceInfo.locatorType) as Class;
				serviceInfo.locator = new locatorClass() as IServiceLocator;
			}
			
			var service:IService = serviceInfo.locator.getInstance();
//			trace("createService" + service);
			return service;
		}		
	}
}