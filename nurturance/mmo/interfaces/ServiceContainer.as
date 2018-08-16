package mmo.interfaces
{
	import flash.display.Sprite;
	import flash.utils.getQualifiedClassName;
	
	import mmo.interfaces.servicebuilder.ServiceBuilder;
	import mmo.interfaces.servicebuilder.ServiceInitState;
	
	/**
	 * Service容器
	 * */
	public class ServiceContainer extends Sprite
	{
		CompileInterfaces.compileMe();
		
		private static var _instance:ServiceContainer;
		private var serviceIdMap:Object = {};
		private var serviceInterfaceMap:Object = {};
		private var serviceTypeMap:Object = {};
		/**
		 * 正在创建的Service 
		 */
		private var initingServices:Array = [];
		/**
		 * 排队中的Service 
		 */
		private var waitingMap:Object = {};
		/**
		 * 加载services文件的所在层次
		 */
		private var layerContainer:Sprite;
			
		public function ServiceContainer()
		{		
			
			var services:Array = ServiceConfig.services;
			for each(var serviceInfo:ServiceInfo in services){
				serviceIdMap[serviceInfo.id] = serviceInfo;
				serviceInterfaceMap[serviceInfo.interfaceType] = serviceInfo;
				serviceTypeMap[serviceInfo.serviceType] = serviceInfo;
			}
			
		}
		
		public static function get instance():ServiceContainer{
			return _instance ||= new ServiceContainer();
		}
		
		/** 别调用，登陆init的service的时候设置的标记状态 **/
		public function setServiceBootLoadInit( value:* ):void{
			var serviceInfo:ServiceInfo = this.getServiceInfo(value);
			if(serviceInfo != null){
				serviceInfo.state = ServiceInitState.inited;
			}
		}
		
		//play加载完设置载入层
		public function setLayerContainer(layer:Sprite):void{
			this.layerContainer = layer;
		}
		
		public function getLayerContainer():Sprite{
			return this.layerContainer;
		}
		
		public function getServiceFiles(serviceId:Array):Array{
			var files:Array = [];
			for each(var id:String in serviceId){
				files.push(ServiceInfo(serviceIdMap[id]).swf);
			}
			
			return files;
		}		
		/**
		 * 获取指定的Service
		 * */
		public static function getService(value:*):IService{
			return instance.getService(value);
		}
				
		/**
		 * 获取指定的Service
		 * */
		public function getService(value:*, params:Object = null):IService{
			trace("get service:" + value);
			var serviceInfo:ServiceInfo = this.getServiceInfo(value);
			if(serviceInfo == null){
				throw new Error("无法找到Service: " + value + " 的配置信息！");
			}
			
			// 正在下载Service
			if(this.initingServices.indexOf(serviceInfo.id) != -1){
				throw new Error("不能直接获取正在初始化的Service，改用tryGetService！！！");
			}			
			
			var callback:Function = function(service:IService, params:Object)
			{
				if(service == null)
				{
					throw new Error("getService:" + value + "失败");
				}
			}				
			var serviceBuilder:ServiceBuilder = ServiceBuilder.getNormalBuilder();
			var service:IService = serviceBuilder.build(serviceInfo, callback, this, params);
			serviceBuilder.dispose();
			
			return service;
		}
		
		private function getServiceInfo(value:*):ServiceInfo{
			var serviceInfo:ServiceInfo = null;
			if(typeof value == "string"){
				serviceInfo = this.serviceIdMap[value];
			}
			else{
				var className:String = getQualifiedClassName(value);
				serviceInfo = this.serviceInterfaceMap[className];				
			}
			
			return serviceInfo;		
		}		
				
		/**
		 * 获取实现接口的所有Service
		 * */
		public function getServices(itype:Class):Array{
			var services:Array = new Array();//应该是ServiceConfig.services吧
			
			var interfaceType:String = getQualifiedClassName(itype);
			for each(var serviceInfo:ServiceInfo in services){ //这个services应该是错的，应该是ServiceConfig.services吧？
				if(serviceInfo.interfaceType == interfaceType){
					var service:IService = this.getService(serviceInfo.id);
					services.push(service);
				}
			}	
			
			return services;		
		}
				
		
		/**
		 * 获取指定的Service如果没下载过将尝试下载
		 * 
		 * @param value 要获取的serviceName或接口
		 * @param callback 可选回调函数, 如果传入callback(service:IService, params:Object){}创建完后回调
		 * 		, 否则触发ServiceContainerEvent.onGetService事件  
		 * @param thisObject 可选参数,this上下文
		 * @param params 可选参数,如果要获取的service存在params属性，将在创建成功能赋值给params
		 * @return 
		 * 
		 */
		public function tryGetService(value:*, callback:Function = null, thisObject:* = null
			, params:Object = null):IService{
			var serviceInfo:ServiceInfo = this.getServiceInfo(value);
			if(serviceInfo == null){
				throw new Error("无法找到Service: " + value + " 的配置信息！");
			}
				
			trace("try get service:" + value);
			if(this.initingServices.indexOf(serviceInfo.id) != -1){
				this.addWaitingService(serviceInfo, callback, thisObject, params);
				trace("return, is buiding service");
				return null;
			}
			
			return this._tryGetService(serviceInfo, callback, thisObject, params);
		}	
		
		private function _tryGetService(serviceInfo:ServiceInfo, callback:Function = null
			, thisObject:* = null, params:Object = null):IService{
			var serviceBuilder:ServiceBuilder = ServiceBuilder.getDownloadBuilder();					
			var mycallback:Function = function(service:IService, params:Object):void
			{
				var index:int = initingServices.indexOf(serviceInfo.id);
				this.initingServices.splice(index, 1);
				
				if(service == null)
				{
					throw new Error("tryGetService:" + serviceInfo.id + "[" 
						+ serviceInfo.serviceType + "] 失败");
					return;
				}
				if(callback != null){
					callback.apply(thisObject, [service, params]);
				}
				this.dispatchEvent(new ServiceContainerEvent(ServiceContainerEvent.onGetService
					, serviceInfo.id, service, params));	//这个事件没人监听？
				serviceBuilder.dispose();
				this.onBuildedService(serviceInfo);
			}	
			var service:IService = serviceBuilder.build(serviceInfo, mycallback, this, params);
			return service;
		}
		
		private function addWaitingService(serviceInfo:ServiceInfo, callback:Function = null
			, thisObject:* = null, params:Object = null)
		{
			var waitings:Array = this.waitingMap[serviceInfo.id];
			if(waitings == null){
				waitings = [];
			}
			waitings.push({"si":serviceInfo, "cb": callback, "to": thisObject, "ps":params});
		}
		
		private function onBuildedService(serviceInfo:ServiceInfo):void
		{
//			trace("onBuildedService");
			var watings:Array = this.waitingMap[serviceInfo.id];
			if(watings == null || watings.length == 0){
				return;
			}
			
			for each(var waitingInfo:Object in watings){
				var serviceInfo:ServiceInfo = waitingInfo["si"];
				var callback:Function = waitingInfo["cb"];
				var thisObject:* = waitingInfo["to"];
				var params:Object = waitingInfo["ps"];
				
				this._tryGetService(serviceInfo, callback, thisObject, params);
			}
			
			this.waitingMap[serviceInfo.id] = [];
		}
	}
}