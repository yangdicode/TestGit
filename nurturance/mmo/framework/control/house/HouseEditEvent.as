package mmo.framework.control.house
{
	import flash.events.Event;
	
	public class HouseEditEvent extends Event
	{
		public static const onEditHouse:String = "onEditHouse";
		public function HouseEditEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		private var _isEdit:Boolean;

		public function get isEdit():Boolean
		{
			return _isEdit;
		}

		public function set isEdit(value:Boolean):void
		{
			_isEdit = value;
		}
	}
}