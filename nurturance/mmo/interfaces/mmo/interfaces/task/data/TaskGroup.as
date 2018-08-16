package mmo.interfaces.task.data
{
	/**
	 * 任务集定义类
	 * @author liyawei
	 */	
	public class TaskGroup
	{
		private var _taskGroupId:int;
		private var _groupName:String;
		
		private var _tasks:Array;
		
		private var _typeId:int;
		
		public function TaskGroup(groupId:int,groupName:String,tasks:String,typeId:int)
		{
			this._taskGroupId = groupId;
			this._groupName = groupName;
			this._tasks = tasks.split(",");
			
			this._typeId = typeId;
		}
		
		/**
		 * 任务集Id
		 */		
		public function get taskGroupId():int
		{
			return this._taskGroupId;
		}
		
		/**
		 * 任务集名称
		 */
		public function get groupName():String
		{
			return this._groupName;
		}
		
		/**
		 * 任务集包含任务id
		 */	
		public function get tasks():Array
		{
			return this._tasks;
		}
		
		/**
		 * 任务集所属类型
		 * 0-100为主线，就是所属章节
		 * 101以上为支线，就是所属类别
		 */
		public function get typeId():int
		{
			return this._typeId;
		}
	}
}