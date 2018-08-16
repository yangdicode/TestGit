package mmo.framework.control
{
	import flash.events.Event;

	public class Observer
	{
		private var _context:Object;
		private var _listener:Function;
		public function Observer()
		{
		}
		
		public function set context(value:Object):void
		{
			_context = value;
		}	
		
		public function set listener(value:Function):void
		{
			_listener = value;
		}	
			
		public function invoke(evt:Event):void
		{
			_listener.apply(_context, [evt]);
		}	
	}
}