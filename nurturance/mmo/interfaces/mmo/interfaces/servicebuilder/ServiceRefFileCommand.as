package mmo.interfaces.servicebuilder
{
	import mmo.interfaces.IService;
	import mmo.interfaces.ServiceInfo;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	
	/**
	 * 依赖下载 
	 * @author hekehui
	 * 
	 */
	public class ServiceRefFileCommand extends ServiceBuidCommand
	{
		private var downloadCount:int
		
		public function ServiceRefFileCommand()
		{
		}
		
		
		public override function execute(serviceInfo:ServiceInfo, service:IService
			, callback:Function, thisObject:*):void
		{
			super.execute(serviceInfo, service, callback, thisObject);
			
			this.downloadCount = 0;		
			this.next();
		}
		
		private function next():void
		{
			// 已经下载过该service的依赖项
			if(this.serviceInfo.state >= ServiceInitState.downloadRefs)
			{
				this.executed();
				return;
			}
			
			if(this.downloadCount == this.serviceInfo.refFiles.length)
			{
				this.serviceInfo.state = ServiceInitState.downloadRefs;
				this.executed();
				return;
			}
			
			
			var file:String = this.serviceInfo.refFiles[this.downloadCount];
			ResScheduler.getResource(file, this.onGetResource, "", null, null, ResPriority.HIGHEST, false);
		}
		
		private function onGetResource(content:*):void
		{
			this.downloadCount ++;
			this.next();
		}
	}
}