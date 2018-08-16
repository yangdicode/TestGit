package mmo.framework.domain.union.config
{
	import flash.system.ApplicationDomain;

	public class UnionTasks
	{
		private static const taskConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.union.config.UnionTaskConfig") as Class;
		
		/** 任务定义 **/
		public static function getTaskDefine( taskId:int ):UnionTaskDefine{
			var data:Object = taskConfig["data"];
			if( data.hasOwnProperty(taskId) )
				return data[taskId];
			return data["0"];//空定义
		}
		
		/** 任务胜利奖励 **/
		public static function getTaskWinBonus( taskLv:String ):String{
			var data:Object = taskConfig["WIN_BONUS"];
			if( data.hasOwnProperty(taskLv) )
				return data[taskLv];
			return data["0"];//空定义
		}
		
		/** 任务失败奖励 **/
		public static function getTaskFailBonus( ):String{
			return taskConfig["FAIL_BONUS"];
		}
		
	}
}