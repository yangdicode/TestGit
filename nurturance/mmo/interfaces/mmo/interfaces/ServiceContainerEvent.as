package mmo.interfaces
{
	import flash.events.Event;
	
	public class ServiceContainerEvent extends Event
	{
		public static const onGetService = "onGetService";
		public var params:Object;
		public var serviceName:String;
		public var service:IService;
		
		public function ServiceContainerEvent(type:String, serviceName:String, service:IService, params:Object)
		{
			super(type)
			this.params = params;
			this.serviceName = serviceName;
			this.service = service;
		}
		
		public override function clone():Event
		{
			return new ServiceContainerEvent(this.type, this.serviceName, this.service, this.params)
		}
		
		
		public override function toString():String
		{
			return formatToString("ServiceContainerEvent"
				, "type", "bubbles", "cancelable", "eventPhase", "params");
		}
	}
}