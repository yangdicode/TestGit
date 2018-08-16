package mmo.interfaces
{
	import flash.utils.getQualifiedClassName;
	
	import mmo.interfaces.servicebuilder.ServiceInitState;

	public class ServiceInfo
	{
		public var id:String;
		public var interfaceType:String;
		public var serviceType:String;
		public var swf:String;
		public var locatorType:String;
		
		public var injectObjects:Array = null;
		public var refFiles:Array = null;
		
		public var locator:IServiceLocator;
		
		public var state:int = ServiceInitState.none;
		
		/**
		 * Service配置信息
		 * 	id 服务标识
		 * 	iservice 实现的接口(字符串或Class)
		 * 	serviceType 实现类
		 * 	swf 所在swf
		 * 	locator 实现类的定位器(字符串或Class)，默认为DefaultLocator
		 * 	injectObjects 构造参数
		 * */
		public function ServiceInfo(id:String, iservice:*, serviceType:String
			, swf:String, locator:* = null, refFiles:Array = null, injectObjects:Array = null)
		{
			this.id = id;
			this.serviceType = serviceType;
			this.swf = swf;
			this.injectObjects = injectObjects;
			if(this.injectObjects == null)
			{
				this.injectObjects = [];;
			}
			this.refFiles = refFiles;
			if(this.refFiles == null)
			{
				this.refFiles = [];
			}
			
			var iserviceType:String = typeof iservice;
			if(iserviceType == "string"){
				this.interfaceType = String(iservice);
			}else{
				this.interfaceType = getQualifiedClassName(Class(iservice));
			}
			
			// 指定默认定位器
			if(locator == null){
				this.locator = new DefaultLocator(this);
			}
			else{
				var locatorType:String = typeof locator;
				if(locatorType == "string"){
					this.locatorType = String(locator);
				}else{
					this.locatorType = getQualifiedClassName(Class(locator));
				}
				
				if(this.locatorType == "mmo.interfaces.SingleLocator"){
					this.locator = new SingleLocator(this);
				}
			}
		}

	}
}