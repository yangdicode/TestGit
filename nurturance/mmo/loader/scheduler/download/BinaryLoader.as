package mmo.loader.scheduler.download {
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLLoader;
	import flash.net.URLLoaderDataFormat;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	
	import mmo.loader.scheduler.ResInfo;
	import mmo.loader.scheduler.VersManager;

	class BinaryLoader extends EventDispatcher {
		private static const MAX_ENCRYPT_COUNT:int = 20;
		private static var DECODER:Object;

		private var loader:URLLoader;

		private var _resInfo:ResInfo;
		
		private var byteArray:ByteArray;

		public function BinaryLoader() {
			super();
			this.loader = new URLLoader();
			this.loader.dataFormat = URLLoaderDataFormat.BINARY;
			this.loader.addEventListener(Event.COMPLETE, onComplete);
			this.loader.addEventListener(ProgressEvent.PROGRESS, onProgress);
			this.loader.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		}

		public function get priority():int {
			if (this._resInfo != null) {
				return this._resInfo.priority;
			}
			return -1;
		}

		public function get resInfo():ResInfo {
			return this._resInfo;
		}
		
		public function getByteArray():ByteArray {
			return this.byteArray;
		}

		public function load(resInfo:ResInfo):void {
			this._resInfo = resInfo;
			this._resInfo.isDownloading = true;
			var urlRequest:URLRequest = VersManager.getVerURLRequest(resInfo.url);
			this.loader.load(urlRequest);
		}

		public function destroy():void {
			if (this._resInfo) {
				this._resInfo.isDownloading = false;
				this._resInfo = null;
			}

			if (this.loader != null) {
				this.loader.removeEventListener(Event.COMPLETE, onComplete);
				this.loader.removeEventListener(ProgressEvent.PROGRESS, onProgress);
				this.loader.removeEventListener(IOErrorEvent.IO_ERROR, onIOError);
				try {
					this.loader.close();
				} catch (e:Error) {
				}
				this.loader = null;
			}
		}

		private function onComplete(evt:Event):void {
			this.byteArray = loader.data;
			dispatchEvent(evt);
		}

		private function onProgress(evt:ProgressEvent):void {
			dispatchEvent(evt);
		}

		private function onIOError(evt:IOErrorEvent):void {
			dispatchEvent(evt);
		}
	}
}