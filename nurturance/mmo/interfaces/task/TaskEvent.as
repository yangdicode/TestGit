package mmo.interfaces.task
{
	import flash.events.Event;

	public class TaskEvent extends Event
	{
		public static const ON_USER_STEP_UPDATE:String = "ON_USER_STEP_UPDATE";
		public static const ON_USER_TASK_ADD:String = "ON_USER_TASK_ADD";
		public static const ON_USER_TASK_FINISH:String = "ON_USER_TASK_FINISH";

		/**
		 * taskStepId
		 * */
		public static const ON_CLIENT_STEP:String = "ON_CLIENT_STEP";

		/**
		 * taskId
		 * */
		public static const ON_CLIENT_START:String = "ON_CLIENT_START";
		public static const ON_CLIENT_FINISH:String = "ON_CLIENT_FINISH";
		
		/**
		 * 向服务端提交完成任务信息，可以开始记录物品获得
		 */
		public static const ON_TASK_BEFORE_FINISH:String = "ON_TASK_BEFORE_FINISH";
		
		/**
		 * NPC初始化全部完成 
		 */
		public static const ON_INITED_NPC:String = "ON_INITED_NPC";
		
		/**
		 * 场景中初始化某个NPC,返回{npcId}
		 */		
		public static const ON_ADD_NPC:String = "ON_ADD_NPC";
		
		/**
		 *执行任务中间的特定操作（如播放动画，打怪等）
		 * 对象属性名：action 
		 */
		public static const ON_TASK_ACTION:String = "ON_TASK_ACTION";
		
		/**
		 * 任务信息面板全部关闭后的事件
		 * 属性：isTaskStart:Boolean  是否是任务开始
		 *       taskId:int
		 *       
		 * */
		public static const ON_INFO_CLOSE:String = "ON_INFO_CLOSE";
		
		
		/**
		 *任务结束，用户关闭所有奖励后的事件
		 *  属性： taskId:int
		 * */
		public static const ON_BONUS_CLOSE:String = "ON_BONUS_CLOSE";
		
		/**
		 * 重置任务
		 * 属性：taskId:int
		 * */
		public static const ON_TASK_RESET:String = "ON_TASK_RESET";
		
		private var _params:Object;

		public function TaskEvent(type:String, params:Object)
		{
			super(type);
			this._params = params;
		}

		public function get params():Object
		{
			return this._params;
		}

		public override function clone():Event
		{
			return new TaskEvent(this.type, this.params);
		}


		public override function toString():String
		{
			return formatToString("TaskEvent", "type", "bubbles", "cancelable", "eventPhase", "params");
		}

	}
}