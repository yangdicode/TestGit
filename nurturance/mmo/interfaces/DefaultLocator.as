package mmo.interfaces
{
	import flash.system.ApplicationDomain;
	
	public class DefaultLocator implements IServiceLocator
	{
		private var serviceInfo:ServiceInfo;
		public function DefaultLocator(serviceInfo:ServiceInfo){
			this.serviceInfo = serviceInfo;
		}
		
		public function getInstance():IService{
			var serviceClass:Class;
			//try{
				serviceClass = ApplicationDomain.currentDomain.getDefinition(this.serviceInfo.serviceType) as Class;
			//}
			//catch(err:Error){
			//	trace("serviceClass not find:" + this.serviceInfo.serviceType);				
			//	return null;
			//}
			
			//trace("serviceClass" + serviceClass);
			return new serviceClass() as IService;
		}
	}
}