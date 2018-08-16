package mmo.interfaces.servicebuilder
{
	import flash.events.EventDispatcher;
	
	import mmo.interfaces.IService;
	import mmo.interfaces.ServiceInfo;
	
	class ServiceBuidCommand extends EventDispatcher
	{				
		protected var serviceInfo:ServiceInfo;
		protected var service:IService;
		
		private var callback:Function;
		private var thisObject:*;
		
		public function ServiceBuidCommand()
		{
		}
	
		public function execute(serviceInfo:ServiceInfo, service:IService
			, callback:Function, thisObject:*):void
		{
			this.serviceInfo = serviceInfo;
			this.service = service;			
			this.callback = callback;
			this.thisObject = thisObject;
		}	
		
		protected function executed(success:Boolean = true):void
		{
			this.callback.apply(thisObject, [success, this.service]);
			
			this.serviceInfo = null;
			this.service = null;		
			this.callback = null;
			this.thisObject = null;	
		}
	}
}