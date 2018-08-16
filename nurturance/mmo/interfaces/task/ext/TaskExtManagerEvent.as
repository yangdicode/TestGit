package mmo.interfaces.task.ext
{
	import flash.events.Event;

	public class TaskExtManagerEvent extends Event
	{
		/**
		 * 当前场景的所有任务初始化完成 
		 */
		public static const onAllTaskInited:String = "onAllTaskInited";
		
		public function TaskExtManagerEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
	}
}