package mmo.interfaces.task
{
	import mmo.interfaces.IInitService;
	/**
	 * TaskFlowService接口 
	 * @author lihuilong
	 * 
	 */	
	public interface ITaskFlowService extends IInitService
	{
		/**
		 * 执行任务流程 （对应ITaskExtService init时调用）
		 * @param taskId 任务ID
		 * @param data 任务流程数据
		 * 
		 */		
		public function excute(taskId:int, data:*):void;
		/**
		 * 销毁任务流程 （对应ITaskExtService clear时调用）
		 * @param taskId 任务ID
		 * 
		 */		
		public function cancel(taskId):void;
	}
}