package mmo.interfaces.servicebuilder
{
	import mmo.interfaces.IService;
	import mmo.interfaces.InjectObject;
	import mmo.interfaces.ServiceContainer;
	import mmo.interfaces.ServiceInfo;
	import mmo.interfaces.SingleLocator;
	
	/**
	 * 接口注入，如果Servic为自己实现的单例，即：locater不是SingleLocater时，发生多次注入
	 * @author hekehui
	 * 
	 */
	public class ServiceInjectCommand extends ServiceBuidCommand
	{
		/**
		 * 已经完成注入数 
		 */
		private var injectCount:int = 0;
		/**
		 * 当前注入操作已经完成的service下载数(对于Array的注入) 
		 */
		private var downloadServices:Array;
		
		public function ServiceInjectCommand()
		{
		}
		
		public override function execute(serviceInfo:ServiceInfo, service:IService
			, callback:Function, thisObject:*):void
		{
			super.execute(serviceInfo, service, callback, thisObject);
			
//			trace("reject state:"+ (this.serviceInfo.state >= ServiceInitState.injected) + ","
//				+ (this.serviceInfo.locator is SingleLocator));
			// 单例且已经注入过，不再进行注入
			if(this.serviceInfo.state >= ServiceInitState.injected
				&& this.serviceInfo.locator is SingleLocator)
			{
				this.executed();
				return;
			}			
			
			this.next();
		}
		
		private function next():void
		{			
			if(this.injectCount == this.serviceInfo.injectObjects.length)
			{
				this.serviceInfo.state = ServiceInitState.injected;
				this.executed();
				return;
			}
			
			// 下载本次注入需要的所有servcies
			this.downloadServices = [];
			for each(var serviceName:String in this.curInjectObject.serviceNames)
			{
				var onGetService:Function = function onGetService(service:IService, params:Object)
				{			
					this.downloadServices.push(serviceName);
					// 本次注入需要的servie全部下载完成，执行注入操作，并开始下一个
					if(this.downloadServices.length == this.curInjectObject.serviceNames.length)
					{
						this.inject();
						this.next();
					}
				}				
				ServiceContainer.instance.tryGetService(serviceName, onGetService, this);
			}
		}
		
		private function get curInjectObject():InjectObject
		{
			return this.serviceInfo.injectObjects[this.injectCount] as InjectObject;
		}		
		
		/**
		 * 注入操作，分为单一实例和数组两种方式 
		 * 
		 */
		private function inject():void
		{
			if(this.service[this.curInjectObject.property] is Array)
			{
				var services:Array = [];
				for each(var serviceName:String in this.curInjectObject.serviceNames)
				{
					services.push(ServiceContainer.getService(serviceName));
				}
				
				this.service[this.curInjectObject.property] = services;				
			}
			else
			{
				this.service[this.curInjectObject.property] = ServiceContainer.getService(
					this.curInjectObject.serviceNames[0]);				
			}
			this.injectCount ++;
		}
	}
}