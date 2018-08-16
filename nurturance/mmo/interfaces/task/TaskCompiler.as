package mmo.interfaces.task
{
	import mmo.interfaces.task.data.FighterStepDefine;
	import mmo.interfaces.task.data.GatherStepDefine;
	import mmo.interfaces.task.data.TaskDefine;
	import mmo.interfaces.task.data.TaskGlobalData;
	import mmo.interfaces.task.data.TaskGroup;
	import mmo.interfaces.task.data.TaskGroupType;
	import mmo.interfaces.task.data.TaskStep;
	import mmo.interfaces.task.data.TaskStepType;
	import mmo.interfaces.task.data.TaskType;
	import mmo.interfaces.task.data.UserTask;
	import mmo.interfaces.task.data.UserTaskStep;
	import mmo.interfaces.task.ext.ITaskExtManager;
	import mmo.interfaces.task.ext.ITaskExtService;
	import mmo.interfaces.task.ext.TaskExtManagerEvent;
	import mmo.interfaces.task.ext.TaskExtServiceEvent;

	public class TaskCompiler
	{
		public function TaskCompiler()
		{
			var te:TaskEvent;
			var ted:TaskEventDispatcher;
			
			var td:TaskDefine;
			var ts:TaskStep;
			var tst:TaskStepType;
			var ut:UserTask;
			var uts:UserTaskStep;
			var fsd:FighterStepDefine;
			var gsd:GatherStepDefine;
			
			var tg:TaskGroup;
			var tgt:TaskGroupType;
			
			var tis:ITaskExtService;
			var tise:TaskExtServiceEvent;
			var tim:ITaskExtManager;
			var time:TaskExtManagerEvent;
			
			var taskpanel:ITaskPanel;
			var taskStep:ITaskStep;
			var taskType:TaskType;
			
			var taskGloData:TaskGlobalData;
		}
	}
}