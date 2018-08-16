package mmo.loader.scheduler.download
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	
	import mmo.loader.scheduler.ResInfo;
	import mmo.loader.scheduler.ResPriority;

	public class DownloadManager
	{
		/**
		 * 虽然测试到线程数可以开到6个同时在下载，但pjf外部已经有preLoadManager减少下载次数，多线程使complete事件更快的优势不再
		 * 线程多的优势可能也就在与用户其他下载竞争了
		 * */
		private static const NORMAL_MAX_LOADER_THREAD:int = 4;
				
		private var _listLoaders:Array = [];
		
		private var completeHandler:Function;
		private var IOErrorHandler:Function;
		private var progressHandler:Function;
		
		public function DownloadManager(completeHandler:Function, IOErrorHandler:Function, progressHandler:Function)
		{			
			this.completeHandler = completeHandler;
			this.IOErrorHandler = IOErrorHandler;
			this.progressHandler = progressHandler;
		}
		
		//虽然都已经在下载了，但是抢占下载是最后一个打断，所以还是要保证顺序
		public function sort():void
		{
			this._listLoaders.sortOn("priority", Array.NUMERIC | Array.DESCENDING);
		}
		
		/**
		 * 现代浏览器都有断点续传，即使打断也是会续传的
		 * TODO 所以打断策略可以做更狠一些，比如高级直接打断低级。目前只有最高级会打断其他或最低级被其他打断
		 * TODO 还可以更狠些，有最高级时，直接停掉其他级下载，只下载最高级。确保带宽不被平分
		 * */
		public function tryLoad(resInfo:ResInfo):void {
			//有要及时下载的内容时，为防止带宽被占，中断所有预加载
			if (resInfo.priority > ResPriority.PRELOAD) {
				removeLoaders(ResPriority.PRELOAD);
			}
			else if (resInfo.priority == ResPriority.PRELOAD) {  //只有当所有资源都已经下载完才进行预下载
				if (this._listLoaders.length > 0 && (this._listLoaders[0] as BinaryLoader).priority > ResPriority.PRELOAD) {
					return;
				}
			}
			
			if (this._listLoaders.length < NORMAL_MAX_LOADER_THREAD) {
				load(resInfo);
				return;
			}
			
			//抢占式下载
			var loader:BinaryLoader = this._listLoaders[this._listLoaders.length - 1] as BinaryLoader;
			if (resInfo.priority == ResPriority.HIGHEST && loader.priority < ResPriority.HIGHEST) {
				removeLoader(loader);
				load(resInfo);
				return;
			}
			
			if(resInfo.priority >  ResPriority.LOWEST){
				if(loader.priority ==  ResPriority.LOWEST){
					removeLoader(loader);
					load(resInfo);
					return;
				}
			}
		}

		private function load(resInfo:ResInfo):void {
			var resLoader:BinaryLoader = new BinaryLoader();
			resLoader.addEventListener(Event.COMPLETE, onLoadComplete);
			resLoader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			resLoader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
			
			this._listLoaders.push(resLoader);
			this.sort();
			
			//LoaderDebugUIManager.instance.addFile(resInfo);			
			resLoader.load(resInfo);
		}
		
		private function onLoadComplete(evt:Event):void
		{
			var loader:BinaryLoader = evt.target as BinaryLoader;
			var resInfo:ResInfo = loader.resInfo;
			removeLoader(loader);
			completeHandler.apply(null, [resInfo, loader.getByteArray()]);
			
		}
		
		private function onIOError(evt:IOErrorEvent):void
		{
			var loader:BinaryLoader = evt.target as BinaryLoader;
			var resInfo:ResInfo = loader.resInfo;
			removeLoader(loader);
			IOErrorHandler.apply(null, [evt,resInfo]);
		}
		
		private function onProgress(evt:ProgressEvent):void
		{
			var loader:BinaryLoader = evt.target as BinaryLoader;
			var resInfo:ResInfo = loader.resInfo;
			progressHandler.apply(null, [evt,resInfo]);
		}
		
		private function removeLoader(loader:BinaryLoader):void {
			if(removeValueFormArray(this._listLoaders,loader)) {
				//LoaderDebugUIManager.instance.removeFile(loader.resInfo.url);
				loader.removeEventListener(Event.COMPLETE, onLoadComplete);
				loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
				loader.destroy();				
			}
		}
		
		private function removeLoaders(priority:int):void {
			for (var i:int = this._listLoaders.length - 1; i >= 0; i--) {
				var loader:BinaryLoader = this._listLoaders[i] as BinaryLoader;
				if (loader.priority == priority) {
					removeLoader(loader);
				}
			}
		}
		
		public function removeLoaderByUrl(url:String):Boolean{
			for(var i:int = this._listLoaders.length - 1;i >= 0;i--){
				var resLoader:BinaryLoader = this._listLoaders[i];
				if(resLoader.resInfo.url == url){
					removeLoader(resLoader);
					return true;
				}
			}
			return false;
		}
		
		public function clearNoCallbackLoader():Boolean {
			var hasRemove:Boolean = false;
			for(var i:int = this._listLoaders.length - 1;i >= 0;i--){
				var resLoader:BinaryLoader = this._listLoaders[i] as BinaryLoader;
				var resInfo:ResInfo = resLoader.resInfo;
				if(resInfo.isEmpty()){
					removeLoader(resLoader);
					hasRemove = true;
				}
			}
			return hasRemove;
		}
		
		private function removeValueFormArray(array:Array,value:Object):Boolean{
			var index:int = array.indexOf(value);
			if(index != -1){
				array.splice(index,1);
				return true;
			}
			return false;
		}
		
		//for test
		private function outputList(msg:String):void
		{
			var s:String = "";
			for (var i:int = 0 ;i < _listLoaders.length; i++)
			{
				s += BinaryLoader(_listLoaders[i]).resInfo.url + " ";
			}
			trace(msg + " loading : " + s)
		}
	}
}