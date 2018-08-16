package mmo.framework.domain.closefriend
{
	import flash.events.Event;
	
	public class CloseFriendEvent extends Event
	{
		public static const MakeFriend:String = "makeFriend";
		public static const BreakFriend:String = "breakFriend";
		
		public function CloseFriendEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}