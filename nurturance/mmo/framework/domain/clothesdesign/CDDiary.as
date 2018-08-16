package mmo.framework.domain.clothesdesign
{
	public class CDDiary
	{
		private var _id:int;
		private var _deblockDesc:String;
		private var _taskId:int;
		
		public function CDDiary(id:int, deblockDesc:String, taskId:int){
			_id = id;
			_deblockDesc = deblockDesc;
			_taskId = taskId;
		}

		public function get id():int
		{
			return _id;
		}

		public function get deblockDesc():String
		{
			return _deblockDesc;
		}

		public function get taskId():int
		{
			return _taskId;
		}


	}
}