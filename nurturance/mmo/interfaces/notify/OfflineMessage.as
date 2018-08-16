package mmo.interfaces.notify
{
	public class OfflineMessage
	{
		public var msgType:int;
		public var sender:String;
		public var content:String;
		public var msgDate:String;
		public var ext:String;
		
		public function OfflineMessage(msgType:int, sender:String, content:String, msgDate:String, ext:String="")
		{
			this.msgType = msgType;
			this.sender = sender;
			this.content = content;
			this.msgDate = msgDate;
			this.ext = ext;
		}
	}
}