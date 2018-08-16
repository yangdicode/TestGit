package mmo.interfaces.resource
{
	import flash.events.Event;

	public class ResourceServiceEvent extends Event
	{
		/**
		 * 资源处理完成 
		 */
		public static const onLoaded:String = "onLoaded";
		
		public function ResourceServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}