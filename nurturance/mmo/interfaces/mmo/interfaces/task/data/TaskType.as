package mmo.interfaces.task.data
{
	/**
	 * 任务类型
	 * @author liyawei
	 */	
	public class TaskType
	{
		/**
		 * 主线任务
		 * */
		public static const main:String = "main";
		
		/**
		 * 支线任务 
		 */		
		public static const branch:String = "branch";
		
		/**
		 * 日常任务 
		 */	
		public static const daily:String = "daily";
		
		/**
		 * 周常任务 
		 */	
		public static const weekly:String = "weekly";
		
		public function TaskType()
		{
		}
	}
}