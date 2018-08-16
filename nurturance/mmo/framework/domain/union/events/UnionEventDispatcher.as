package mmo.framework.domain.union.events
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class UnionEventDispatcher extends EventDispatcher
	{
		public static const instance:UnionEventDispatcher = new UnionEventDispatcher();
		
		public function UnionEventDispatcher(){
			super();
		}
	}
}