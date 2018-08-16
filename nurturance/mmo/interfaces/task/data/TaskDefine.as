package mmo.interfaces.task.data
{
	public class TaskDefine
	{
		private var _taskId:int;
		private var _taskName:String;
		private var _needOrder:int;
		private var _taskSteps:String;
		
		private var _type:String;
		private var _pretask:Array;
		private var _isOnline:int;
		
		private var _takeLimit:XML;
		
		public function TaskDefine(taskId:int,taskName:String,needOrder:int,taskSteps:String,type:String,
								    preTask:String,takeLimit:XML,isOnline:int)
		{
			this._taskId = taskId;
			this._taskName = taskName;
			this._needOrder = needOrder;
			this._taskSteps = taskSteps;
			this._type = type;
			this._pretask = parsePreTask(preTask);
			this._isOnline = isOnline;
			
			this._takeLimit = takeLimit;
		}
		
		/**
		 * 任务Id
		 */		
		public function get taskId():int
		{
			return this._taskId;
		}
		
		/**
		 * 任务名称
		 */		
		public function get taskName():String
		{
			return this._taskName;
		}
		
		/**
		 * 任务步骤
		 */		
		public function get taskSteps():String
		{
			return this._taskSteps;
		}
		
		/**
		 * 是否是顺序任务
		 * */
		public function isNeedOrder():Boolean
		{
			return this._needOrder == 1;
		}
		
		/**
		 * 是否是循环任务
		 **/
		public function get repeat():Boolean
		{
			return this.type == TaskType.daily || this.type == TaskType.weekly;
		}
		
		/**
		 * 任务类型
		 */		
		public function get type():String
		{
			return this._type;
		}
		
		/**
		 * 前置任务条件
		 */		
		public function get preTask():Array
		{
			return (_pretask == null) ? []:_pretask;
		}
		
		/**
		 * 是否上线
		 */
		public function get isOnline():Boolean
		{
			return this._isOnline == 1;
		}
		
		/**
		 * 任务取得限制
		 * return limitsArray = [limitObj]
		 * limitObj.type  限制类型
		 * limitObj.ext   限制参数
		 */
		public function get takeLimit():Array
		{
			if(_takeLimit == null){
				return null;
			}
			var limits:XMLList = _takeLimit.item;
			if(limits == null || limits.length() <= 0){
				return null;
			}
			var limitsArray:Array = new Array();
			for each (var item:XML in limits){
				var limitObj:Object = {"type":item.@type,"ext":item.@ext};
				limitsArray.push(limitObj);
			}
			return limitsArray;
		}
		
		/**解析前置任务**/
		private function parsePreTask(preTask:String):Array
		{
			if(preTask == ""){
				return  null;
			}
			var arr:Array = preTask.split(",");
			for(var i:int=0; i<arr.length; i++){
				arr[i] = int(arr[i]);
			}
			return arr;
		}
	}
}