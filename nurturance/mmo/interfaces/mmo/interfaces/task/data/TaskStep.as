package mmo.interfaces.task.data
{
	public class TaskStep
	{
		public var taskStepId:int;
		public var type:int;
		public var title:String;
		public var extData:String;

		public function TaskStep(taskStepId:int, type:int, title:String, extData:String)
		{
			this.taskStepId = taskStepId;
			this.type = type;
			this.title = title;
			this.extData = extData;
		}
	}
}