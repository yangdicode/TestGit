package mmo.interfaces.task.data
{
	/**
	 * 用户任务类
	 * */
	
	public class UserTask
	{
		public var taskId:int;
		public var taskState:int;
		
		public function UserTask(taskId:int,taskState:int)
		{
			this.taskId = taskId;
			this.taskState = taskState;
		}
		
		public function isDoing():Boolean
		{
			return this.taskState == 0;
		}
		
		public function isFinish():Boolean
		{
			return this.taskState == 1;
		}
		
		public function setFinish():void
		{
			this.taskState = 1;
		}
		
//		//还未接取任务的状态,以下代码可能都要修改，暂时定义的
//		public function isNew():Boolean
//		{
//			return this.taskState == -1;
//		}
//		
//		/**
//		 * 进行中>new>已完成>已下线
//		 * 为方便排序，状态分别为0，1，2，3
//		 * */
//		public function getUserTaskState():int
//		{
//			if(this.isDoing()){
//				return 0;
//			}
//			if(this.isNew()){
//				return 1;
//			}
//			if(this.isFinish()){
//				return 2;
//			}
//			return 3;
//		}
	}
}