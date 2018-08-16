package mmo.loader.scheduler {
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.utils.ByteArray;
	
	import mmo.loader.scheduler.data.ResDomainInfo;

	public class DomainLoader extends EventDispatcher {
		private var resInfo:ResInfo;
		private var byteArray:ByteArray;
		private var resDomainInfo:ResDomainInfo;
		private var loaders:Vector.<Loader>;
		private var domainListCopy:Vector.<ResDomainInfo>;
		private var count:int;

		public function DomainLoader(resInfo:ResInfo, byteArray:ByteArray) {
			this.resInfo = resInfo;
			this.byteArray = LocalCache.encryptBytes(byteArray);
		}

		public function getResInfo():ResInfo {
			return this.resInfo;
		}

		public function load():void {
			resInfo.isDomainLoading = true;
			count = 0;
			loaders = new Vector.<Loader>();
			domainListCopy = resInfo.getResDomainListCopy(); //使用copy，防止中途新增或删除
			if (domainListCopy.length == 0) {//防止无domain时，不加载，导致resInfo永远处于isDomainLoading
				loadByteEnd();
				return;
			}
			for (var i:int = 0; i < domainListCopy.length; i++) {
				var loader:Loader = createLoader();
				var resDomainInfo:ResDomainInfo = domainListCopy[i];
				//var domain:ApplicationDomain = resDomainInfo.getDomain() != null ? resDomainInfo.getDomain() : ApplicationDomain.currentDomain;
				var domain:ApplicationDomain =  resDomainInfo.getDomain();
				loader.loadBytes(byteArray, new LoaderContext(false, domain));
			}
		}

		private function createLoader():Loader {
			var loader:Loader = new Loader();
			loaders.push(loader);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onLoadByteComplete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onLoadByteError);
			return loader;
		}

		private function disposeLoader(loader:Loader):void {
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, onLoadByteComplete);
			loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, onLoadByteError);
		}

		private function onLoadByteComplete(evt:Event):void {
			var loaderInfo:LoaderInfo = evt.target as LoaderInfo;
			var loader:Loader = loaderInfo.loader;
			disposeLoader(loader);

			//防内存提取
			for (var i:int = 0; i < 9; i++) {
				loaderInfo.bytes[i] = Math.random() * 255;
			}

			var index:int = loaders.indexOf(loader);
			resInfo.runCompleteCallback(domainListCopy[index], loaderInfo);//见方法注释
			

			count++;
			if (count >= domainListCopy.length) {
				if (!resInfo.isEmpty()) { //加载过程中或回调中加入了新的callback
					this.load();
				} else {
					loadByteEnd();
				}
			}
		}

		private function loadByteEnd():void {
		//	LocalCache.setByteLocal(resInfo.url, byteArray);
			this.dispatchEvent(new Event(Event.COMPLETE));
			dispose();
		}

		private function onLoadByteError(evt:IOErrorEvent):void {
		//	LocalCache.clearLocal(resInfo.url);
			trace("loadByteError:" + resInfo.url);
			dispose();
			//resInfo还在队列，需要重新下载，触发下载队列。亲测有效
			ResManager.instance.nextDownload();
		}

		private function dispose():void {
			resInfo.isDomainLoading = false;
			for (var i:int = 0; i < loaders.length; i++) {
				disposeLoader(loaders[i]);
			}

		}


	}
}