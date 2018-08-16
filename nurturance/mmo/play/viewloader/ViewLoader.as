package mmo.play.viewloader{
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.IOErrorEvent;
	import flash.system.ApplicationDomain;
	
	import mmo.loader.CustomLoader;
	import mmo.loader.CustomLoaderEvent;
	import mmo.loader.LoadingSpriteType;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.layer.LayerManager;
	
	public class ViewLoader {
		
		private static var _instance:ViewLoader;			
		public function ViewLoader() {
			if(_instance != null) {
				throw new Error("ViewLoader is implemented as Singleton!!");
				return;
			}
		}
		
		public static function get instance():ViewLoader {
			if(_instance == null) {
				_instance = new ViewLoader();
			}
			return _instance;
		}
		
		public function getViewCustom(className:String, fileName:String, width:Number = 0, height:Number = 0, waitingMovie:Sprite = null, 
									   resStorageType:ResStorageType = null,backFun:Function = null,funObject:Object = null, setMiddle:Boolean = true, setScale:Boolean = true):ViewContainer {
			var vc:ViewContainer = ViewContainer.creatView(width, height, waitingMovie);
			ResScheduler.getResource(fileName, onGetView, className, onGetError, null, ResPriority.NORMAL, true, resStorageType);
			function onGetView(view:*):void
			{
				vc.setView(view as DisplayObject, setMiddle, setScale);
				if (backFun != null)
				{
					backFun.apply(null, [view, funObject]);
				}
			}
			function onGetError(evt:IOErrorEvent):void
			{
				trace("load view file error.file:" + fileName + " class:" + className);		
			}
			return vc;
		}
	}
}