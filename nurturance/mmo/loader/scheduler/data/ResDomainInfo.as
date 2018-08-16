package mmo.loader.scheduler.data {
	import flash.display.LoaderInfo;
	import flash.events.TimerEvent;
	import flash.system.ApplicationDomain;
	import flash.utils.Timer;

	public class ResDomainInfo {
		private var domain:ApplicationDomain;
		private var callbackList:Vector.<ResCallbackInfo>;

		public function ResDomainInfo(domain:ApplicationDomain) {
			this.domain = domain;
			this.callbackList = new Vector.<ResCallbackInfo>();
		}

		public function getDomain():ApplicationDomain {
			return domain;
		}

		public function isEmpty():Boolean {
			return callbackList.length == 0;
		}

		public function getCallbackCount():int {
			return callbackList.length;
		}

		public function addCallback(callback:ResCallbackInfo):void {
			callbackList.push(callback);
		}

		public function removeCallback(callbackEvent:Function):void {
			for (var i:int = callbackList.length - 1; i >= 0; i--) {
				if (callbackList[i].event == callbackEvent) {
					callbackList.splice(i, 1);
				}
			}
		}

		public function runCompleteCallback(loaderInfo:LoaderInfo, url:String):void {
			var cla:Class;
			for (var i:int = 0; i < callbackList.length; i++) {
				var instanceList:Array = [];
				var nameList:Array = callbackList[i].nameList;
				
				parseNameDataInList(nameList, instanceList, loaderInfo, url);

				if (callbackList[i].event != null) {
					try {
						callbackList[i].event.apply(null, instanceList);
					} catch (e:Error) {
						//针对匿名回调方法的报错，输出文件名
						e.message = "Error定位：文件file:" + url + " 下载完成之后的回调函数有报错！\n " + e.message;
						throwErrorNextTime(e);
					}
				}				
			}
		}
				
		private function parseNameDataInList( nameList:Array, instanceList:Array, loaderInfo:LoaderInfo, url:String):void{
			var cla:Class;
			for each (var resNameData:* in nameList) {
				if( resNameData is String ){
					if (resNameData == "") {
						cla = null;
						instanceList.push(loaderInfo.content);
					} else {
						if (loaderInfo.applicationDomain.hasDefinition(resNameData)) {
							cla = loaderInfo.applicationDomain.getDefinition(resNameData) as Class;
						} else {
							throw new Error("resourceReflectError: " + resNameData + " url: " + url);
						}
						instanceList.push(new cla());
					}
				}else if( resNameData is Array ){
					var tempList:Array = [];
					parseNameDataInList(resNameData, tempList, loaderInfo, url);
					instanceList.push(tempList);
				}				
			}
		}
		
		//把错误放到下一帧再抛出来，防止打断下一个callback调用。
		private function throwErrorNextTime(e:Error):void {
			var err:Error = e;
			var timer:Timer = new Timer(1, 1);
			timer.addEventListener(TimerEvent.TIMER_COMPLETE, function() {
					throw err;
				});
			timer.start();
		}

		public function runProgressCallback(params:Array):Boolean {
			var isRunCallBack:Boolean = false;
			for each (var callbackInfo:ResCallbackInfo in callbackList) {
				if (callbackInfo.progressHandle != null) {
					callbackInfo.progressHandle.apply(null, params);

					isRunCallBack = true;
				}
			}
			return isRunCallBack;
		}

		public function runIOErrorCallback(params:Array):Boolean {
			var isRunCallBack:Boolean = false;
			for each (var callbackInfo:ResCallbackInfo in callbackList) {
				if (callbackInfo.IOErrorHandle != null) {
					callbackInfo.IOErrorHandle.apply(null, params);

					isRunCallBack = true;
				}
			}
			return isRunCallBack;
		}
	}
}