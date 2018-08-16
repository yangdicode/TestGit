package mmo.interfaces
{
	import flash.events.Event;
	
	public class InitServiceEvent extends Event
	{
		public static const onInited = "onInited";
		public var params:Object;
		
		public function InitServiceEvent(type:String, params:Object)
		{
			super(type)
			this.params = params;
		}
		
		public override function clone():Event
		{
			return new InitServiceEvent(this.type, this.params)
		}
		
		
		public override function toString():String
		{
			return formatToString("InitServiceEvent"
				, "type", "bubbles", "cancelable", "eventPhase", "params");
		}
	}
}