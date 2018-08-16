package mmo.framework.control
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class AoyaEventDispatcher extends EventDispatcher
	{
		public function AoyaEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}
	}
}