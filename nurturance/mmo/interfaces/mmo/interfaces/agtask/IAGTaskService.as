package mmo.interfaces.agtask
{
	import mmo.interfaces.IInitService;
	
	public interface IAGTaskService extends IInitService
	{
		function showTaskPanel():void;
		
		function finishTask(taskId:int):void;
			
		function closeTaskPanel():void;
			
	}
}