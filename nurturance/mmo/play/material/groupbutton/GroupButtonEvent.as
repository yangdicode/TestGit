package mmo.play.material.groupbutton
{
	import flash.events.Event;
	
	public class GroupButtonEvent extends Event
	{
		public static const ON_SELECTED:String = "onSelected";
		public function GroupButtonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		private var _groupButton:IGroupButton;

		public function get groupButton():IGroupButton
		{
			return _groupButton;
		}

		public function set groupButton(value:IGroupButton):void
		{
			_groupButton = value;
		}

		override public function clone():Event
		{
			var event:GroupButtonEvent = new GroupButtonEvent(type, bubbles, cancelable);
			event.groupButton = _groupButton;
			return event;
		}	
	}
}