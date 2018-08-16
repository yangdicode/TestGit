package mmo.framework.domain.member
{
	import flash.events.Event;
	
	public class UserMemberEvent extends Event
	{
		
		public static const ON_MEMBER_INFO_CHANGE:String = "onMemberInvoChange";
		
		public function UserMemberEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}