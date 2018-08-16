package mmo.interfaces.task
{	
	import mmo.interfaces.IInitService;
	import mmo.interfaces.task.data.TaskDefine;
	import mmo.interfaces.task.data.TaskGroup;
	import mmo.interfaces.task.data.TaskStep;
	import mmo.interfaces.task.data.UserTask;
	import mmo.interfaces.task.data.UserTaskStep;
	
	public interface ITaskService extends IInitService
	{
		/**
		 * 获取用户任务状态
		 **/
		function getUserTask(taskId:int):UserTask;
		/**
		 * 用户任务是否正在做
		 **/
		function isUserTaskDoing(taskId:int):Boolean;
		/**
		 * 用户任务是否完成
		 **/
		function isUserTaskFinish(taskId:int):Boolean;
		
		/**
		 * 获取用户任务步骤状态
		 **/
		function getUserTaskStep(stepId:int):UserTaskStep;
		/**
		 * 用户任务步骤是否正在做
		 **/
		function isUserTaskStepDoing(stepId:int):Boolean;
		/**
		 * 用户任务步骤是否完成
		 **/
		function isUserTaskStepFinish(stepId:int):Boolean;
		
		/**
		 * 获取所有任务定义
		 **/
		function getTaskDefinesObject():Object;
		/**
		 * 获取特定任务定义
		 **/
		function getTaskDefine(taskId:int):TaskDefine;
		/**
		 * 获取特定任务步骤定义
		 **/
		function getTaskStep(taskStepId:int):TaskStep;
		
		/**
		 * 获取某种类型的任务步骤,返回step数组
		 **/
		function getTaskStepsByType(type:int):Array;

		/**
		 * 获取一个任务做到哪个子步骤，返回stepId，无则抛错误
		 * 注意: 任务未在进行中,返回 -1,
		 *       全部完成步骤的任务返回 0,
		 * 		 并列任务返回第一个步骤id
		 * */
		function getTaskDoingStep(taskId:int):int;
		
		/**
		 * 获取一个并列任务正在做的几个子步骤id。
		 * 返回 stepIdArray
		 * 全部完成步骤的任务返回 null
		 * */
		function getNoOrderTaskDoingSteps(taskId:int):Array;
		
		/**
		 * 任务是否能开始
		 * */
		function isTaskCanStart(taskId:int):Boolean;
		
		/**
		 * 完成某一步骤
		 * @param taskStepId
		 */			
		function onClientStep(taskStepId:int):void;
		
		/**
		 * 开始任务
		 * @param taskId
		 */			
		function onClientStart(taskId:int):void;
		
		/**
		 * 完成任务
		 * @param taskId
		 */		
		function onClientFinish(taskId:int):void;
			
		/**
		 * 正在进行的所有任务步骤Id
		 */
		function getDoingTaskStepIds():Array;
		
		/**
		 * 任务是否能完成
		 * */
		function isTaskCanFinish(taskId:int):Boolean;
		
		/**
		 * 根据任务步骤获取任务Id
		 * 返回 taskId
		 * */
		function getTaskIdFromStepId(taskStepId:int):int;
		
		/**
		 * 获取所有任务集 
		 */	
		function getTaskGroupData():Object;
			
		/**
		 * 根据id获取某一特定任务集
		 * */
		function getTaskGroupById(groupId:int):TaskGroup;
		
		/**
		 * 获取某一特定类型的任务集(类别)
		 */		
		function getTaskGroupByType(typeId:int):Array;
		
		/**
		 * 获取任务集正在进行的状态
		 * 未接取(不可接) -2
		 * 未接取(可接取) -1
		 * 已完成   		 0
		 * 进行中   	 	 正在进行的任务Id
		 * */
		function getTaskGroupState(groupId:int):int;
		
		/**
		 * 获取任务集正在做的任务集合
		 */
		function getTaskGroupDoingTasks(groupId:int):Array	;
		
		/**
		 * 根据任务Id找到任务集Id
		 */	
		function getGroupIdByTaskId(taskId:int):int;
		
		/**
		 * 显示任务面板
		 * @param taskId 任务Id
		 */		
		function showTaskPanel(taskId:int = -1):void;
		
		/**
		 * 获取主线任务顺序
		 */
		function getMainTaskOrder():Array;
		
		/**
		 * 获取支线任务顺序
		 */	
		function getBranchTaskOrder():Array;
		
		/**
		 * 获取推荐任务顺序
		 */		
		function getHotTaskOrder():Array;
		
		/**
		 * 获取taskPanel面板数据
		 */		
		function getTaskPanelRes(taskId:int):Object;
		
		/**
		 * 获取任务的解锁信息
		 */	
		function getTaskLimitMsg(taskId:int):String;
		
		/**
		 * 任务面板类型是否显示加锁,
		 * 目前只有热点推荐内的主线任务加锁显示
		 */	
		function checkIsShowLockType(taskGroup:TaskGroup):Boolean;
			
		/**
		 * 任务是否被禁止
		 * @showMsg 是否显示禁止信息
		 * (例如组队进行中不能进行任务)
		 */
		function isTaskStop(showMsg:Boolean = false):Boolean;
			
		/**
		 * 获得未完成的每日任务数 
		 */		
		function getUndoDailyTask():int;
			
		/**
		 * 显示每日任务面板
		 */		
		function showDailyTaskPanel():void;
			
		/**
		 * @param arr 不需要显示开始动画的任务id队列。
		 */			
		function addNoShowStartTasks(arr:Array):void;
			
		/**
		 * 是否完成新手任务
		 */			
		function isFinishStartTask():Boolean;
		
		function isStartTask(taskId:int):Boolean;
		/**
		 * 获取任务ID包含的任务步骤数组 
		 * @param taskId 任务ID
		 * @return 任务步骤数组，没步骤的任务将返回没有元素的空数组[]
		 * 
		 */			
		function getTaskSteps(taskId:int):Array;
		
		/**
		 * 获取当章节中可以做的第一个任务
		 * params  index:在当章节中的下标，taskId：任务ID
		 * */
		function getFirstCanDoTask():Object;
		
		/**
		 * 获取最新章节的主线的所有任务
		 * */
		function getMainGroupTask():Array;
			
		/**
		 * 获取指定章节的主线的所有任务
		 * */
		function getPreMainGroupTask(partId:int):Array;
	}
}