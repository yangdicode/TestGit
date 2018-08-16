package mmo.loader {
	
	import flash.events.Event;
	
	public class CustomLoaderEvent extends Event {
		
		/**
		 * 单个文件下载完成
		 **/
		public static const onLoadedFile = "onLoadedFile";
		
		/**
		 * 所有文件下载完成
		 **/
		public static const onLoadCompleted = "onLoadCompleted"
		
		/**
		 * 用户取消
		 **/
		public static const onCancel = "onCancel";
		
		/**
		 * 下载错误
		 **/
		public static const onError = "onError";
		
		/**
		 * 文档类实例
		 **/
		public var content:Object;
		/**
		 * 下载完成的文件名
		 **/
		public var file:String;
		
		/**
		 * 下载出错时是否取消下载，默认为真
		 * */
		public var cancel:Boolean = true;
		
		public function CustomLoaderEvent(type:String, content:Object, file:String) {
			super(type)
			this.content = content
			this.file = file;
		}

		public override function clone():Event {
			return new CustomLoaderEvent(this.type, this.content, this.file);
		}
		
		public override function toString():String {
			return formatToString("CustomLoaderEvent", "type", "bubbles", "cancelable", "eventPhase", "content")
		}
		
	}
	
}