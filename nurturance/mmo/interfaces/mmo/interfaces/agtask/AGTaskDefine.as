package mmo.interfaces.agtask
{
	public class AGTaskDefine
	{
		private var _taskId:int;
		private var _taskName:String;
		private var _content:String;
		private var _isOnLine:int;
		private var _clientWriteAble:int;
		private var _bonus:Object;
		private var _dailyTaskId:int;
		private var _version:int;
		public function AGTaskDefine(taskId:int, taskName:String, content:String, isOnLine:int,
									 clientWriteAble:int, bonus:XML, dailyTask:String,version:int=0)
		{
			_taskId = taskId;
			_taskName = taskName;
			_content = content;
			_isOnLine = isOnLine;
			_clientWriteAble = clientWriteAble;
			
			_bonus = parseBonusXml(bonus);
			_dailyTaskId = parseDailyTask(dailyTask);
			
			_version = version;
		}
		
		public function get taskId():int
		{
			return _taskId;
		}
		
		public function get taskName():String
		{
			return _taskName;
		}
		
		public function get content():String
		{
			return _content;
		}
		
		public function get isOnLine():Boolean
		{
			return _isOnLine == 1;
		}
		
		public function get clientWriteAble():Boolean
		{
			return _clientWriteAble == 1;
		}
		
		public function get bonus():Object
		{
			return _bonus;
		}
		
		public function get dailyTaskId():int
		{
			return _dailyTaskId;
		}
		public function get version():int
		{
			return _version;
		}
		private function parseBonusXml(bonus:XML):Object
		{
			var obj:Object = new Object();
			for each(var b:XML in bonus)
			{
				if(b.@type == "score")
				{
					obj.score = b.@num;
				}
			}
			
			return obj;
		}
		
		private function parseDailyTask(str:String):int
		{
			if(str == "")
				return -1;
			
			var tstr:Array = str.split("-");
			if(tstr[0] == "每日任务")
				return int(tstr[1]);
			else
				return -1;
		}
	}
}