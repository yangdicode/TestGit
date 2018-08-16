package mmo.loader.scheduler.data {
	import flash.system.ApplicationDomain;

	public class ResCallbackInfo {
		/** 类名list**/
		public var nameList:Array;

		/** 回调event **/
		public var event:Function;

		/** IOError回调 */
		public var IOErrorHandle:Function;

		/** Progress回调 */
		public var progressHandle:Function;

		public function ResCallbackInfo(nameList:Array, event:Function, IOErrorHandle:Function, progressHandle:Function) {
			this.nameList = nameList;
			this.event = event;
			this.IOErrorHandle = IOErrorHandle;
			this.progressHandle = progressHandle;
		}
	}
}