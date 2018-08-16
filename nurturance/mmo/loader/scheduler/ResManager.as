package mmo.loader.scheduler {
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.ByteArray;
	
	import mmo.loader.scheduler.data.ResCallbackInfo;
	import mmo.loader.scheduler.download.DownloadManager;

	class ResManager {
		//重新下载随着次数增加的成功率：95%(1次)，%79(2次)，45%(3次)，后面没有统计了，目前使用5次重新下载，超过5次就不下载了。
		private static const MAX_IO_ERROR_COUNT:int = 6;

		private var resInfoList:Vector.<ResInfo> = new Vector.<ResInfo>();
		private var downloadManager:DownloadManager;
		private static var _instance:ResManager;

		public function ResManager() {
			if (_instance != null) {
				throw new Error("ResManager is singleton!");
			}
			this.downloadManager = new DownloadManager(onLoadComplete, onIOError, onProgress);
		}

		public static function get instance():ResManager {
			if (_instance == null) {
				_instance = new ResManager();
			}
			return _instance;
		}

		/**
		 *  下载资源(传resType)
		 * @param url
		 * @param priority
		 * @param callbackInfo
		 * @@param resType: 资源下载后所属的应用程序域， 默认为主应用程序域即ResStorageType.PERSISTENT;
		 *
		 */
		public function loadResourceByType(url:String, priority:int, callbackInfo:ResCallbackInfo, resStorageType:ResStorageType = null):void {
			if(resStorageType == null)
			{
				resStorageType = ResStorageType.PERSISTENT;
			}
			loadResourceByDomain(url, priority, callbackInfo, resStorageType.applicationDomain );
		}
		
		/**
		 *  下载资源（传domain）
		 * @param url
		 * @param priority
		 * @param callbackInfo
		 * @param domain
		 */
		public function loadResourceByDomain(url:String, priority:int, callbackInfo:ResCallbackInfo, domain:ApplicationDomain ):void {
						
			for each (var tempResInfo:ResInfo in this.resInfoList) {
				if (tempResInfo.url == url) {
					tempResInfo.addCallback(callbackInfo, domain);
					if (tempResInfo.updatePriority(priority)) {
						this.resInfoList.sort(ResPriority.compareable);
						downloadManager.sort();
					}
					return;
				}
			}
			
			var resInfo:ResInfo = new ResInfo(url, priority);
			resInfo.addCallback(callbackInfo, domain);
			
			this.resInfoList.push(resInfo);
			this.resInfoList.sort(ResPriority.compareable);
			
			tryLoad(resInfo);
		}
		
		/**
		 *  取消url的下载
		 * @param url
		 * 当有且只有一个下载请求时有效
		 */
		public function cancelURL(url:String):void {
			var resInfo:ResInfo = getUniqueResInfoIndex(url);
			if (resInfo == null) {
				return;
			}
			if (resInfo.getCallbackCount() <= 1) {
				var isLoading:Boolean = downloadManager.removeLoaderByUrl(url);
				//TODO 这里要移除唯一那个callback，否则如果正在加载，还会触发事件
				removeResInfo(resInfo);
				if (isLoading) {
					nextDownload();
				}
			}
		}
		
		/**
		 *  取消某个对象对某个资源的下载
		 * @param url
		 * @param event
		 *
		 */
		public function cancel(url:String, event:Function):void {
			removeResInfoCallback(url, event);
			if (downloadManager.clearNoCallbackLoader()) {
				nextDownload();
			}
		}
			
		public function nextDownload():void {
			for (var i:int = 0; i < this.resInfoList.length; i++) {
				var resInfo:ResInfo = this.resInfoList[i] as ResInfo;
				if (!resInfo.isDomainLoading && !resInfo.isDownloading) {
					downloadManager.tryLoad(resInfo);
					break;
				}
			}
		}
		
		/////   ～～　private ～～～～～～～～～
		private function tryLoad(resInfo:ResInfo):void {
			//现在没有本地缓存
		//	var byteArray:ByteArray = LocalCache.getByteLocal(resInfo.url);
		//	if (byteArray == null) {
				nextDownload();
		//		return;
		//	}
		//	loadByte(resInfo, byteArray);
		}

		private function onLoadComplete(resInfo:ResInfo, byteArray:ByteArray):void {
			loadByte(resInfo, byteArray);

			nextDownload();
		}

		private function onProgress(evt:ProgressEvent, resInfo:ResInfo):void {
			resInfo.runProgressCallback([evt]);

		//	LoaderDebugUIManager.instance.updateProgress(resInfo.url, evt.bytesLoaded, evt.bytesTotal, resInfo.priority);
		}

		private function onIOError(evt:IOErrorEvent, resInfo:ResInfo):void {
			resInfo.ioErrorCount++;
			if (resInfo.ioErrorCount < MAX_IO_ERROR_COUNT) {
				nextDownload();
			} else {
				
			//	InspectorErrorWatch.instance.addIOErrorLog(evt.type + "第" + resInfo.ioErrorCount + "次下载资源失败[" + resInfo.url + ".swf?]");
				
				removeResInfo(resInfo);
				nextDownload();
				var isRunIOError:Boolean = resInfo.runIOErrorCallback([evt]);
				if (!isRunIOError) { //如果没有处理IOERROR，在函数处理完后再抛出错误，不影响其他下载
					throw new IOErrorEvent(evt.type, evt.bubbles, evt.cancelable, evt.text);
				}
			}
		}

		private function loadByte(resInfo:ResInfo, byteArray:ByteArray) {
			var domainLoader:DomainLoader = new DomainLoader(resInfo, byteArray);
			domainLoader.addEventListener(Event.COMPLETE, onLoadByteComplete);
			domainLoader.load();
		}

		private function onLoadByteComplete(evt:Event) {
			var domainLoader:DomainLoader = evt.target as DomainLoader;
			var resInfo:ResInfo = domainLoader.getResInfo();
			removeResInfo(resInfo);
		}

		private function removeResInfo(resInfo:ResInfo):Boolean {
			var index:int = resInfoList.indexOf(resInfo);
			if (index != -1) {
				resInfoList.splice(index, 1);
				return true;
			}
			return false;
		}


		/**
		 * 取唯一 url=输入url 的resInfo，有多个时，也返回null(改版后按url区分resInfo，不会出现多个的情况)
		 * */
		private function getUniqueResInfoIndex(url:String):ResInfo {
			var res:ResInfo = null
			for (var i:int = this.resInfoList.length - 1; i >= 0; i--) {
				var resInfo:ResInfo = this.resInfoList[i] as ResInfo;
				if (resInfo.url == url) {
					if (res != null) {
						return null;
					}
					res = resInfo;
				}
			}
			return resInfo;
		}

		private function removeResInfoCallback(url:String, event:Function):void {
			for (var i:int = this.resInfoList.length - 1; i >= 0; i--) {
				var resInfo:ResInfo = this.resInfoList[i] as ResInfo;
				if (resInfo.url == url) {
					resInfo.removeCallback(event);
					if (resInfo.isEmpty()) {
						removeResInfo(resInfo);
					}
				}
			}
		}




	}
}