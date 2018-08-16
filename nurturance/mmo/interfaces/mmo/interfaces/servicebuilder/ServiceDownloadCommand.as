package mmo.interfaces.servicebuilder
{
	import mmo.interfaces.IService;
	import mmo.interfaces.ServiceContainer;
	import mmo.interfaces.ServiceInfo;
	import mmo.loader.CustomLoader;
	import mmo.loader.CustomLoaderEvent;
	import mmo.loader.LoadingSpriteType;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResStorageType;
	
	/**
	 * 下载 
	 * @author hekehui
	 * 
	 */
	public class ServiceDownloadCommand extends ServiceBuidCommand
	{
		public function ServiceDownloadCommand()
		{
		}

		public override function execute(serviceInfo:ServiceInfo, service:IService
			, callback:Function, thisObject:*):void
		{
			super.execute(serviceInfo, service, callback, thisObject);
			
			// 已经下载过该service的swf文件
			if(this.serviceInfo.state >= ServiceInitState.download)
			{
				this.executed();
				return;
			}
			
			this.loadServiceSwf();
		}
		
		private function loadServiceSwf():void{			
			var loader:CustomLoader = new CustomLoader(ServiceContainer.instance.getLayerContainer(), ResPriority.NORMAL, true, ResStorageType.PERSISTENT);
			loader.addEventListener(CustomLoaderEvent.onLoadCompleted, onLoadedService);
			loader.addEventListener(CustomLoaderEvent.onError, onLoadServiceError);
			loader.load([serviceInfo.swf], LoadingSpriteType.NONE);
		}
		
		private function onLoadedService(evt:CustomLoaderEvent):void{
			var loader:CustomLoader = evt.target as CustomLoader;
			loader.removeEventListener(CustomLoaderEvent.onLoadCompleted, onLoadedService);
			loader.removeEventListener(CustomLoaderEvent.onError, onLoadServiceError);
			loader.close();
			
			// 完成下载
			serviceInfo.state = ServiceInitState.download;
			this.executed();
		}		
		
		private function onLoadServiceError(evt:CustomLoaderEvent):void{
			serviceInfo.state = ServiceInitState.none;
			
			var loader:CustomLoader = evt.target as CustomLoader;
			loader.removeEventListener(CustomLoaderEvent.onLoadCompleted, onLoadedService);
			loader.removeEventListener(CustomLoaderEvent.onError, onLoadServiceError);
			loader.close();
			
			trace("load service error:" + evt.file);
			this.executed(false);
		}			
	}
}