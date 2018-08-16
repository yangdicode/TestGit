package mmo.loader.scheduler {

	import flash.display.LoaderInfo;
	import flash.system.ApplicationDomain;
	
	import mmo.loader.scheduler.data.ResCallbackInfo;
	import mmo.loader.scheduler.data.ResDomainInfo;
	
	public class ResInfo {
		/** 下载优先级 */
		private var _priority:int = -1;
		
		/** 资源路径 */
		private var _url:String;
		
		private var domainList:Vector.<ResDomainInfo>;
		
		public var isDownloading = false;
		public var isDomainLoading = false;
		public var ioErrorCount:int = 0;
		
		public function ResInfo(url:String, priority:int) {
			this._url = url;
			this._priority = priority;
			this.domainList = new Vector.<ResDomainInfo>();
		}
		
		public function get url():String {
			return _url;
		}
		
		public function get priority():int {
			return _priority;
		}
		
		public function getResDomainListCopy():Vector.<ResDomainInfo> {
			return domainList.concat();
		}
		
		public function removeCallback(event:Function):void {
			for (var i:int = this.domainList.length - 1; i >= 0; i--) {
				var domainInfo:ResDomainInfo = this.domainList[i] as ResDomainInfo;
				domainInfo.removeCallback(event);
				if (domainInfo.isEmpty()) {
					domainList.splice(i, 1);
				}
			}
		}
		
		public function isEmpty():Boolean {
			return domainList.length <= 0;
		}
		
		public function getCallbackCount():int {
			var res:int = 0;
			for (var i:int = 0; i < domainList.length; i++) {
				res += domainList[i].getCallbackCount();
			}
			return res;
		}
		
		public function addCallback(callbackInfo:ResCallbackInfo, domain:ApplicationDomain):void {
			var resDomainInfo:ResDomainInfo = getResDomainInfo(domain);
			if (resDomainInfo == null) {
				resDomainInfo = new ResDomainInfo(domain);
				domainList.push(resDomainInfo);
			}
			resDomainInfo.addCallback(callbackInfo);
		}
		
		private function getResDomainInfo(domain:ApplicationDomain):ResDomainInfo {
			for (var i:int = 0; i < domainList.length; i++) {
				if (domain == domainList[i].getDomain()) {
					return domainList[i];
				}
			}
			return null;
		}
		
		public function updatePriority(priority:int):Boolean {
			if (priority > this._priority) {
				this._priority = priority;
				return true;
			}
			return false;
		}
		
		public function getFirstResDomainInfo():ResDomainInfo {
			if (isEmpty()) {
				return null;
			}
			return domainList[0];
		}
		
		private function shiftResDomainInfo():ResDomainInfo {
			if (isEmpty()) {
				return null;
			}
			return domainList.shift();
		}
		
		/**
		 * 传递副本数组里的对象作为验证,防止回调途中增加或删除了新的DomainInfo导致下标不对应
		 * 回调同时删除，确保回调只触发一次。 
		 * */
		public function runCompleteCallback(resDomainInfo:ResDomainInfo, loaderInfo:LoaderInfo):void {
			var index:int = domainList.indexOf(resDomainInfo);
			if (index >= 0) {
				domainList.splice(index, 1);
				resDomainInfo.runCompleteCallback(loaderInfo, this._url);
			}
		}
		
		
		/**
		 *  执行下载进度callback
		 * @param params
		 * @return
		 *
		 */
		public function runProgressCallback(params:Array):Boolean {
			var isRunCallBack:Boolean = false;
			for each (var resDomainInfo:ResDomainInfo in domainList) {
				if (resDomainInfo.runProgressCallback(params)) {
					isRunCallBack = true;
				}
			}
			
			return isRunCallBack;
		}
		
		/**
		 *  执行IO错误方法
		 * @param params
		 * @return
		 *
		 */
		public function runIOErrorCallback(params:Array):Boolean {
			var isRunCallBack:Boolean = false;
			for each (var resDomainInfo:ResDomainInfo in domainList) {
				if (resDomainInfo.runIOErrorCallback(params)) {
					isRunCallBack = true;
				}
			}
			
			return isRunCallBack;
		}
	}
}