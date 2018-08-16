package mmo.play.eventdispatcher
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class GiftsEventDispatcher extends EventDispatcher
	{
		private static var _instance:GiftsEventDispatcher;
		
		public static function get instance():GiftsEventDispatcher
		{
			if( !_instance )
			{
				_instance = new GiftsEventDispatcher();
			}
			
			return _instance;
		}
		public function GiftsEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}