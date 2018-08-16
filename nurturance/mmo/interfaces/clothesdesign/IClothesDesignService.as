package mmo.interfaces.clothesdesign
{
	import mmo.interfaces.IDownloadInitService;
	import mmo.interfaces.IService;

	public interface IClothesDesignService extends IDownloadInitService{
		
		function showMainUI(entranceHandlerType:int = 0):void;
		
		function get level():int;
		
		/**
		 * @return 3：S； 2：A; 1:B; 0:C; -1:D; -2:E; -3:F
		 */		
		function getTaskResult(subTaskId:int):int;
		
		/**
		 * 完成某个大任务的小任务数量
		 */		
		function getTaskFinishNum(mainTaskId:int):int;
		
	}
}