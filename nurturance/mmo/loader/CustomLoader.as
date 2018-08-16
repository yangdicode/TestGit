package mmo.loader
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.utils.getQualifiedClassName;
	import flash.utils.getQualifiedSuperclassName;
	
	import mmo.config.*;
	import mmo.loader.common.utils.LoaderDisplayUtils;
	import mmo.loader.loadingsprite.FullScreenLoadingSprite;
	import mmo.loader.loadingsprite.ILoadingSprite;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.loader.scheduler.ResStorageType;
	import mmo.loader.scheduler.VersManager;
	
	public class CustomLoader extends EventDispatcher {
		
		//~ fields ------------------------------------------------------------
		
		/** 下载swf列表 */
		private var loadList:Array;
		/** 所需类名列表 */
		private var nameList:Array;
		
		/** 是否已取消下载 */
		private var isCancel:Boolean = false;
		/** 下载后是否自动关闭 */
		private var autoClose:Boolean;
		
		/** 提示框 */
		private var loadingSprite:ILoadingSprite;
		
		/**加载动画的容器**/
		private var loadingSpriteContainer:Sprite;
		
		private var fileCount:int;
		private var fileIndex:int;
		
		/** 下载提示语 */
		private var message:String;
		
		/** 下载优先级 */
		private var priority:int;
		/** 是否缓存 */
		private var isCached:Boolean;
		/** CustomLoader计数器 */
		private static var counter:int = 0;
		
		private var resStorageType:ResStorageType;
		
		private var _parallel:Boolean;
		
		private var _contents:Vector.<CustomLoaderContent>;
		//~ public methods ----------------------------------------------------
		
		public function CustomLoader(loadingSpriteContainer:Sprite, priority:int = ResPriority.NORMAL, isCached:Boolean = true, resStorageType:ResStorageType = null, parallel:Boolean = true) {
			this.loadingSpriteContainer = loadingSpriteContainer;
			this.priority = priority;
			this.isCached = isCached;	
			this.resStorageType = resStorageType;
			this._parallel = parallel;
			_contents = new Vector.<CustomLoaderContent>();
		}
		
		public static function get version():String {
			trace("************** CustomLoader::version() is disqualified **************");
			return VersManager.version;
		}
		
		public static function get versionMap():Object {
			trace("************** CustomLoader::versionMap() is disqualified **************");
			return VersManager.versionMap;
		}
		
		public static function getVerURLRequest(fileName:String, extenName:String = "swf"):URLRequest {
			trace("************** CustomLoader::getVerURLRequest() is disqualified **************");
			return VersManager.getVerURLRequest(fileName, extenName);
		}
		
		/**
		 * 启动文件下载
		 * @param	loadList			要下载的文件列表
		 * @param	loadingSpritType	下载提示框类型
		 * @param	autoClose			下载完后自动关闭提示窗口，默认为true
		 * @param	message				下载提示语
		 * @param	name				下载需要获取的类名
		 **/
		public function load(loadList:Array, 
				loadingSpritType:int = LoadingSpriteType.FULL_SCREEN, 
				autoClose:Boolean = true, 
				message:String = "请稍等……",
				nameList:Array = null):void {
			var loadingSprite:ILoadingSprite = LoadingSpriteType.getLoadingSprite(loadingSpritType, this);
			this.LoadC(loadList, loadingSprite, autoClose, message, nameList);
		}
		
		 /**
		 * 启动文件下载，此方法允许自定义动画
		 * @param	loadList			要下载的文件列表
		 * @param	loadingMovie	下载提示框内显示的动画
		 * @param	autoClose			下载完后自动关闭提示窗口，默认为true
		 * @param	message				下载提示语
		 * @param	name				下载需要获取的类名
		 **/
		public function LoadM(loadList:Array, 
				loadingMovie:MovieClip, 
				autoClose:Boolean = true, 
				message:String = "请稍等……",
				nameList:Array = null):void {
			var loadingSprite:ILoadingSprite = new FullScreenLoadingSprite();
			this.LoadC(loadList, loadingSprite, autoClose, message, nameList);
		}		

		/**
		 * 启动文件下载，此方法允许自定义提示框
		 * @param	loadList			要下载的文件列表
		 * @param	loadingSprite		下载提示框
		 * @param	autoClose			下载完后自动关闭提示窗口，默认为true
		 * @param	message				下载提示语
		 * @param	name				下载需要获取的类名
		 **/
		public function LoadC(loadList:Array, 
				loadingSprite:ILoadingSprite, 
				autoClose:Boolean = true, 
				message:String = "请稍等……",
				nameList:Array = null):void {
			
			if(loadList.length == 0) {
				return;
			}

			this.fileCount = loadList.length;
			this.fileIndex = 0;
			
			this.isCancel = false;
				
			this.loadList = loadList;
			this.nameList = nameList;
			this.message = message;
			this.autoClose = autoClose;
				
			this.loadingSprite = loadingSprite;
			if(this.loadingSprite != null)
			{
				this.loadingSprite.setLoadingText(message);
				
				//去掉排序
		//		LoaderDisplayUtils.align(this.loadingSprite as Sprite);
				
//				if(counter++ == 0) {
//					LayerManager.getBaseTop().graphics.beginFill(0xFF000000, 0.6);
//					LayerManager.getBaseTop().graphics.drawRect(0, 0, LoaderContainer.stageWidth, LoaderContainer.stageHeight);
//					LayerManager.getBaseTop().graphics.endFill();
//				}
				
				loadingSprite.setProgress(0);
				loadingSpriteContainer.addChild(this.loadingSprite as Sprite);
			}
			
			this.loadFiles();
		}		
		
		/**
		 * 自定义提示窗口中取消下载时调用此方法
		 * */
		public function cancel():void {
			this.isCancel = true;
			
			for each(var content:CustomLoaderContent in _contents){
				setContentListener(content, false);
				content.close();
			}

			this.dispatchEvent(new CustomLoaderEvent(CustomLoaderEvent.onCancel, null, ""));
			this.close();
		}
		
		/**
		 * 关闭下载提示窗口，当月autoClose为false时需要调用此方法关闭
		 * */
		public function close():void {
			
			if(this.loadingSprite != null) {
//				if(--counter == 0) {
//					LayerManager.getBaseTop().graphics.clear();
//				}
				
				this.loadingSprite.dispose();
				
				LoaderDisplayUtils.stopAndRemove(this.loadingSprite as Sprite);
				
				this.loadingSprite = null; 	
			}
			_contents = null;
			this.resStorageType = null;
		}
		
		//~ private methods ---------------------------------------------------
		
		private function loadFiles():void {
			if(this.isCancel) return;
		
			if(_parallel){
				loadByParallel();
			}else{
				loadBySerial();
			}
		}
		
		private function loadByParallel():void{
			for(var i:int = 0; i < loadList.length; i ++){
				var loadingFile:String = loadList[i];
				var loadingName:*;
				if(nameList != null && i < nameList.length) {
					loadingName = nameList[i];
				}else {
					loadingName = "";
				}
				_contents.push(loadEachFile(loadingFile, loadingName));
			}
		}
		
		private function loadBySerial():void{
			var loadingFile:String = loadList.shift();
			var loadingName:*;
			if(nameList != null && nameList.length > 0){
				loadingName = nameList.shift();
			}else{
				loadingName = "";
			}
			_contents.push(loadEachFile(loadingFile, loadingName));
		}
		
		private function loadEachFile(loadingFile:String, loadingName:*):CustomLoaderContent{
			var content:CustomLoaderContent = new CustomLoaderContent();
			setContentListener(content, true);
			content.load(loadingFile, loadingName, onProgress, priority, isCached, resStorageType);
			return content;
		}
		
		private function onProgress(evt:ProgressEvent):void {
			if(this.isCancel) return;
			
			var p:Number = evt.bytesLoaded / evt.bytesTotal;
			var tp:int = (fileIndex + p) / fileCount * 100;
			if(this.loadingSprite != null){
				this.loadingSprite.setProgress(tp);
			}
		}
		
		private function onLoadedFile(evt:CustomLoaderEvent):void {
			setContentListener(evt.currentTarget as CustomLoaderContent, false);
			if(this.isCancel){ 
				return;	
			}
			fileIndex ++;
			if (this.loadingSprite != null){
				var p:int = fileIndex / fileCount * 100;
				this.loadingSprite.setProgress(p);
			}
			this.dispatchEvent(new CustomLoaderEvent(CustomLoaderEvent.onLoadedFile, evt.content, evt.file));
			if(fileIndex >= fileCount){
				dispatchEvent(new CustomLoaderEvent(CustomLoaderEvent.onLoadCompleted, evt.content, evt.file));
				
				// 自动关闭
				if(this.autoClose) {
					close();
				}
			}else if(!_parallel){
				loadBySerial();
			}
		}
		
		private function onIOError(evt:CustomLoaderEvent):void {
			trace("load file error:" + evt.file);
			cancel();
			dispatchEvent(new CustomLoaderEvent(CustomLoaderEvent.onError, null, evt.file));
		}
		
		private function setContentListener(content:CustomLoaderContent, isAdd:Boolean):void{
			if(isAdd){
				content.addEventListener(CustomLoaderEvent.onLoadedFile, onLoadedFile);
				content.addEventListener(CustomLoaderEvent.onError, onIOError);
			}else{
				content.removeEventListener(CustomLoaderEvent.onLoadedFile, onLoadedFile);
				content.addEventListener(CustomLoaderEvent.onError, onIOError);
			}
		}
		
	}
}