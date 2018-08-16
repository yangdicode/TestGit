package mmo.framework.domain.union.config
{
	public class UnionTaskDefine
	{
		private var _taskId:int;
		private var _taskType:String;
		private var _clientType:int;
		private var _taskName:String;
		private var _taskDesc:String;
		private var _taskDiffLv:String;
		private var _taskExt:int; 
		
		public function UnionTaskDefine( taskId:int, taskType:String, clientType:int, taskName:String, taskDesc:String, taskDiffLv:String,taskExt:int )
		{
			_taskId = taskId;
			_taskType = taskType;
			_clientType = clientType;
			_taskName = taskName;
			_taskDesc = taskDesc;
			_taskDiffLv = taskDiffLv;
			_taskExt = taskExt;
		}
		
		public function get taskId():int
		{
			return _taskId;
		}
		
		/**
		 *	任务类型 
		 * <br/>1、 "battle":通缉悬赏（战斗）
		 * 
		 */		
		public function get taskType():String
		{
			return _taskType;
		}
		
		public function get taskName():String
		{
			return _taskName;
		}
		
		/**
		 * 用于显示战斗怪物图
		 */		
		public function get clientTypeIndex():int
		{
			return _clientType;;
		}
		
		public function get taskDesc():String
		{
			return _taskDesc;
		}
		
		/**
		 * 任务难度
		 * <br/>S、A、B、C
		 */		
		public function get taskDiffLv():String
		{
			return _taskDiffLv;
		}
		
		/**
		 * 额外参数，战斗用于战斗id
		 * 
		 */		
		public function get taskExt():int
		{
			return _taskExt;
		}
		
	}
}