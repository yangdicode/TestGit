package mmo.interfaces.task.ext
{
	import flash.events.Event;

	/**
	 * 任务初始化事件 
	 * @author hekehui
	 * 
	 */
	public class TaskExtServiceEvent extends Event
	{
		public static const onInited:String = "onInited";
		
		public function TaskExtServiceEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}