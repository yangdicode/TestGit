package mmo.loader.scheduler {
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedSuperclassName;
	
	import mmo.loader.scheduler.data.ResCallbackInfo;

	/**
	 * 资源下载管理调度
	 */
	public class ResScheduler extends Dictionary {

		public function ResScheduler(){				
		}
		
		private function compileMe():void{
		}
			
		/**
		 * 使用临时域获得资源 
		 * @param url				文件路径
		 * @param onGetResource		下载成功回调方法
		 * @param clsName			文件类名
		 * @param domain			资源所下载到的应用程序域
		 * 
		 */		
		public static function getResourceInTemporaryDomain(url:String, onGetResource:Function, clsName:String = "", domain:ApplicationDomain = null):void
		{
			var resStorageType:ResStorageType;
			if (domain == null)
			{
				resStorageType = ResStorageType.TEMPORARY;
			}
			else
			{
				resStorageType = new ResStorageType(domain);
			}
			getResource(url, onGetResource, clsName, null, null, ResPriority.NORMAL, true, resStorageType);
		}
		
		/**
		 *	下载资源 
		 * @param url
		 * @param event：回调方法 function(context:*) context为获取到的资源
		 * @param name：当要获取特定类型资源时，需要传入类名，默认返回文档类
		 * @param IOErrorHandle 
		 * @param progressHandle
		 * @param priority: 优先级ResPriority
		 * @param isCache 废弃参数，只为兼容旧的调用
		 * @param resType: 资源下载后所属的应用程序域， 默认为主应用程序域即ResStorageType.PERSISTENT;
		 */
		public static function getResource(url:String, 
				event:Function, 
				name:String = "", 
				IOErrorHandle:Function = null, 
				progressHandle:Function = null,
				priority:int = ResPriority.NORMAL, 
				isCache:Boolean = true, 
				resStorageType:ResStorageType = null):void
		{			
			if(resStorageType == null){
				resStorageType = ResStorageType.PERSISTENT;
			}	
			if(name && name != "" && resStorageType.applicationDomain 
				&& resStorageType.applicationDomain.hasDefinition(name))
			{
				var resClass:Class = resStorageType.applicationDomain.getDefinition(name) as Class;
				event.apply(null, [getInstanceFromClass(resClass)]);
				return;
			}				

			var callbackInfo:ResCallbackInfo = new ResCallbackInfo([name], event, IOErrorHandle, progressHandle);
			ResManager.instance.loadResourceByType(url, priority, callbackInfo, resStorageType);
			
		}
		
		/**
		 * 下载资源，并获得若干个类
		 * 
		 * @param	url
		 * @param	event
		 * @param	names
		 * @param	priority
		 * @param	isCache 废弃参数，只为兼容旧的调用
		 * @param resType: 资源下载后所属的应用程序域， 默认为主应用程序域即ResStorageType.PERSISTENT;
		 */
		public static function getResourceList(url:String, 
				event:Function, 
				names:Array, 
				IOErrorHandle:Function = null, 
				progressHandle:Function = null,
				priority:int = ResPriority.NORMAL, 
				isCache:Boolean = true,
				resStorageType:ResStorageType = null):void 
		{
			if(resStorageType == null){
				resStorageType = ResStorageType.PERSISTENT;
			}	
			
			
			if(names && names.length > 0 && resStorageType.applicationDomain 
				&& resStorageType.applicationDomain.hasDefinition(names[0]))
			{
				var resArr:Array = [];
				for(var i:int = 0; i < names.length; i++)
				{
					var resClass:Class = resStorageType.applicationDomain.getDefinition(names[i]) as Class;
					resArr.push(getInstanceFromClass(resClass));
				}
				event.apply(null, [resArr]);
				return;
			}	
			
			var callbackInfo:ResCallbackInfo = new ResCallbackInfo([names], event, IOErrorHandle, progressHandle);
			ResManager.instance.loadResourceByType(url, priority, callbackInfo, resStorageType);
			
		}
		
		/**
		 * 取消某个对象对某个资源的下载
		 * 
		 * @param	url
		 * @param	event
		 */
		public static function cancel(url:String, event:Function):void {
			ResManager.instance.cancel(url, event);
		}

		/**
		 * <del> 取消url的下载</del>
		 * <br/>请尽量使用cancel方法
		 * <br/>如果没有调getResource或getBinaryResource,就千万别调这个方法，可能误删其他地方的下载
		 * <br/>当有且只有一个下载请求时有效，有其他地方下载同url时无法cancel，防止误杀
		 */
		public static function cancelURL(url:String):void {
			ResManager.instance.cancelURL(url);
		}
			
		private static function getInstanceFromClass(classRef:*):*
		{
			if(classRef) {
				if(classRef is BitmapData) {
					return new Bitmap(classRef as BitmapData);
				}
				else if(isBitmapDataClass(classRef)){
					return new classRef(0, 0);
				}else
				{	
					return new classRef();
				}
			}
			return null
		}	
		
		private static function isBitmapDataClass(cla:Class):Boolean
		{
			if(getQualifiedSuperclassName(cla) == "flash.display::BitmapData")
			{
				return true;
			}
			return false;
		}	
		
		////////////// 旧方法残留区 //////////////////
		
		/** 不要调用这个方法，此方法为空
		 * <br/><del> 取消所有资源的下载 </del> 
		 * <br/>请使用cancel方法
		 */
		public static function cancelAll():void {
		}		
		/** 不要调用这个方法，此方法为空 **/
		public static function play():void{			
		}		
		/** 不要调用这个方法，此方法为空 **/
		public static function stop():void{			
		}
	}
}