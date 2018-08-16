package mmo.framework.domain.palace
{
	import flash.events.Event;
	
	public class PalaceEvent extends Event
	{
		public static const onRefreshMailBoxMsgCount:String = "onRefreshMailBoxMsgCount";
		public static const onUpdateChatMsg:String = "onUpdateChatMsg";
		public static const onRefreshChatNewMsgCount:String = "onRefreshChatNewMsgCount";
		
		private var _params:Object;
		
		public function PalaceEvent(type:String, params:Object=null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this._params = params;
		}
		
		public function get params():Object
		{
			return this._params;
		}
	}
}