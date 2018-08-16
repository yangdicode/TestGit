package mmo.interfaces.tasktbranch
{
	import flash.display.Sprite;
	
	import mmo.interfaces.IDownloadInitService;
	
	public interface ITasktBranchService extends IDownloadInitService
	{
		function showUI():void;
		
		function closeUI():void;
		
		/**
		 * 显示任务分支面板
		 * 面板中的选择项命名规则--btnItem0,btnItem1...
		 * @params:
		 * taskId:任务id
		 * taskStep:任务步骤id
		 * file:面板文件路径
		 * cb:选择了分支之后的回调函数
		 * cls:面板导出类
		 * index:分支在任务步骤中的下标
		 **/
		function showBranchPanel(taskId:int, taskStep:int, file:String, cb:Function = null, cls:String = null, index:int = 0, params:Object = null):void;
		
		/**
		 * 强制从后端获取所有任务分支节点
		 **/
		function getTasksBranchNode(tasks:Array, cb:Function):void;
		
		/**
		 * 获取当前章节玩家的养成信息
		 **/
		function getTaskGroupCurProperty():Object;
		
		/**
		 * 获得节点选择信息
		 **/
		function getTaskBranchNodeValue(key:String):int;
		
		/**
		 * 向后端发送分支节点信息
		 **/
		function sendTaskBranchNode(taskId:int, taskStep:int, index:int, value:int, cb:Function):void;
		
		/**
		 * 用于其他面板中显示玩家主线养成属性信息
		 **/
		function showPropertyPanelHelper(panel:Sprite):void;
	}
}