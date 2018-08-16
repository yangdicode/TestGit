package mmo.interfaces.task.ext
{
	import mmo.interfaces.IInitService;
	
	public interface ITaskExtManager extends IInitService
	{
		/**
		 * 初始化
		 * 
		 */
		function initTask():void;
		/**
		 * 清除任务 
		 * 
		 */
		function clearTask():void;
	}
}