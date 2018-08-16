package mmo.loader
{
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;

	public class CustomLoaderContent extends EventDispatcher
	{
		private var _fileName:String;
		
		public function CustomLoaderContent(){
		}
		
		public function load(url:String,  
							 loadingName:*, 
							 progressHandle:Function = null,
							 priority:int = ResPriority.NORMAL, 
							 isCache:Boolean = true, 
							 resStorageType:ResStorageType = null):void{
			_fileName = url;
			if(loadingName is String) {
				ResScheduler.getResource(_fileName, onLoadSuccess, loadingName, onIOError, progressHandle, priority, isCache, resStorageType);
			}else {
				ResScheduler.getResourceList(_fileName, onLoadSuccess, loadingName, onIOError, progressHandle, priority, isCache, resStorageType);
			}
		}
		
		public function close():void{
			ResScheduler.cancelURL(_fileName);
		}
		
		private function onLoadSuccess(content:*):void {
			dispatchEvent(new CustomLoaderEvent(CustomLoaderEvent.onLoadedFile, content, _fileName));
		}
		
		private function onIOError(evt:IOErrorEvent):void {
			dispatchEvent(new CustomLoaderEvent(CustomLoaderEvent.onError, null, _fileName));
		}
		
	}
}