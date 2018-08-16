package mmo.interfaces.notify
{
	import flash.events.Event;
	
	public class OfflineMsgServiceEvent extends Event
	{
		public static const onGetMessage = "onGetMessage";
		
		public var msg:OfflineMessage;
		
		private var msgTye:MessageType;
		public function OfflineMsgServiceEvent(type:String, msg:OfflineMessage)
		{
			super(type)
			this.msg = msg;
		}
		
		public override function clone():Event
		{
			return new OfflineMsgServiceEvent(this.type, this.msg)
		}
		
		
		public override function toString():String
		{
			return formatToString("OfflineMsgServiceEvent"
				, "type", "bubbles", "cancelable", "eventPhase", "msg");
		}
	}
}