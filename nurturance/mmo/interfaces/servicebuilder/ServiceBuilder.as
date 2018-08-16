package mmo.interfaces.servicebuilder
{
	import flash.events.EventDispatcher;
	
	import mmo.interfaces.IService;
	import mmo.interfaces.ServiceInfo;
	
	public class ServiceBuilder extends EventDispatcher
	{
		private var _serviceInfo:ServiceInfo;
		private var service:IService;		
		private var commands:Array = [];
		
		private var callback:Function;
		private var thisObject:*;
		private var params:Object;
		
		public function ServiceBuilder()
		{
		}
		
		/**
		 * getService流程，认为所有依赖项已经存在，只做创建和注入操作 
		 * @return 
		 * 
		 */
		public static function getNormalBuilder():ServiceBuilder
		{
			var builder:ServiceBuilder = new ServiceBuilder();
			// 创建
			builder.commands.push(ServiceCreateCommand);
			// 注入
			builder.commands.push(ServiceInjectCommand);
			
			return builder;
		}
		
		/**
		 * tryGetService流程 
		 * @return 
		 * 
		 */
		public static function getDownloadBuilder():ServiceBuilder
		{
			var builder:ServiceBuilder = new ServiceBuilder();
			// 依赖文件
			builder.commands.push(ServiceRefFileCommand);
			// 下载
			builder.commands.push(ServiceDownloadCommand);
			// 创建
			builder.commands.push(ServiceCreateCommand);
			// 注入
			builder.commands.push(ServiceInjectCommand);
			// 初始化
			builder.commands.push(ServiceInitCommand);
			
			return builder
		}

		public function build(serviceInfo:ServiceInfo, callback:Function, thisObject:*
			, params:Object):IService
		{
			this._serviceInfo = serviceInfo;
			this.callback = callback;
			this.thisObject = thisObject;
			this.params = params;
			//trace("----  start build service:" + this._serviceInfo.id + " \r    commands:" + this.commands);
			
			this.nextCommand();
			return this.service;
		}
		
		private function nextCommand():void
		{
			if(this.commands.length == 0)
			{
				this.allExecuted(true);
				return;
			}
			
			var type:Class = this.commands.shift() as Class;
			var command:ServiceBuidCommand = ServiceBuidCommand(new type());
			
			//trace("********** sub command executing:" +  command 
			//	+ " service: " + this.service + " name: " + this._serviceInfo.id
			//	+ " state: " + this._serviceInfo.state);			
			command.execute(this._serviceInfo, this.service, this.onSubCommandExecuted, this);
		}
		
		private function allExecuted(success:Boolean):void
		{
			//trace("----  end build service:" + this._serviceInfo.id + " success:" + success);
			if(!success)
			{
				this.callback.apply(this.thisObject, [null, this.params]);
				return;
			}
			
			try
			{
				this.service["params"] = params;
			}
			catch(e:Error){}
			this.callback.apply(thisObject, [this.service, this.params]);
		}
		
		private function onSubCommandExecuted(success:Boolean, service:IService):void
		{			
			//trace("********** sub command executed:" +   " success:" + success 
			//	+ " service: " + service );
			if(success)
			{
				this.service = service;
				this.nextCommand();
			}
			else
			{
				this.allExecuted(false);
			}
		}
		
		public function dispose():void
		{
			this._serviceInfo = null;
			this.callback = null;
			this.thisObject = null;
			this.service = null;
			this.params = null;			
		}
	}
}