package mmo.play.dialog
{
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.loadingsprite.ILoadingSprite;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.layer.LayerEvent;
	import mmo.play.layer.LayerManager;
	
	public class ProgressLoader
	{
		private static var _isLoading:Boolean;
		private static var _defaultLoadingSprite:ILoadingSprite;
		private static var _infoList:Array = [];
		
		public static function load(file:String, callBack:Function, name:String = "", message:String = "请稍等......", resStorageType:ResStorageType = null, priority:int = 6):void{
			resStorageType = resStorageType == null ? SceneDomainResLoader.resStoryageType : resStorageType;
			addLoadContext(file, callBack, name, message, resStorageType, priority);
			if(_isLoading){
				return;
			}
			
			var cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.playres.DefaultLoadSprite") as Class;
			//_defaultLoadingSprite = new cls() as ILoadingSprite;
			setDefaultLoadingSprite(new cls() as ILoadingSprite);
			loadFile();
		}
		
		private static function setDefaultLoadingSprite(defaultLoading:ILoadingSprite):void
		{
			if (_defaultLoadingSprite == null)
			{
				_defaultLoadingSprite = defaultLoading;
			}
		}
		
		public static function close():void{
			addLayerChangeListener(false);
			if(_defaultLoadingSprite != null){
				DisplayUtil.stopAndRemove(DisplayObject(_defaultLoadingSprite));
			}
		}
		
		private static function loadFile():void{
			if(_infoList.length == 0){
				_isLoading = false;
				return;
			}
			_isLoading = true;
			LayerManager.getCurrentLayerTop().addChild(DisplayObject(_defaultLoadingSprite));
			addLayerChangeListener(true);
			var loadInfo:Object = _infoList.shift();
			_defaultLoadingSprite.setLoadingText(loadInfo.message);
			_defaultLoadingSprite.setProgress(0);
			ResScheduler.getResource(loadInfo.file, loadSucceed, loadInfo.name, null, onProgress, loadInfo.priority, true, loadInfo.resStorageType);
			function onProgress(evt:*):void{
				var p:Number = evt.bytesLoaded / evt.bytesTotal;
				if(_defaultLoadingSprite != null){
					_defaultLoadingSprite.setProgress(p * 100);
				}
			}
			function loadSucceed(content:DisplayObject):void{
				_defaultLoadingSprite.setProgress(100);
				loadInfo.callBack.apply(null, [content]);
				loadFile();
			}
		}
		
		private static function addLayerChangeListener(add:Boolean):void{
			if(add){
				LayerManager.container.addEventListener(LayerEvent.ON_LAYER_CHANGE, onLayerChange);
			}else{
				LayerManager.container.removeEventListener(LayerEvent.ON_LAYER_CHANGE, onLayerChange);
			}
		}
		
		private static function onLayerChange(evt:LayerEvent):void{
			if(_defaultLoadingSprite != null){
				LayerManager.getCurrentLayerTop().addChild(DisplayObject(_defaultLoadingSprite));
			}
		}
		
		private static function addLoadContext(file:String, callBack:Function, name:String, message:String, resStorageType:ResStorageType, priority:int):void{
			var loadContext:Object = {};
			loadContext.file = file;
			loadContext.callBack = callBack;
			loadContext.name = name;
			loadContext.message = message;
			loadContext.resStorageType = resStorageType;
			loadContext.priority = priority;
			_infoList.push(loadContext);
		}
		
	}
}