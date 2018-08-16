package mmo.framework.domain.clothesdesign
{
	public class ClothesDesignTask
	{
		
		public static const NORMAL_TASK:String = "常规";
		public static const COMMUNITY_TASK:String = "活动";
		
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _preTask:int;
		private var _type:String;
		private var _isOnline:Boolean;
		private var _needOrder:Boolean;
		private var _needPreTaskFinNum:int;
		private var _npcId:int;
		
		public function ClothesDesignTask(id:int, name:String, desc:String, preTask:int, type:String, isOnline:int, needOrder:int, needPreTaskFinNum:int = 0, npcId:int = 0){
			_id = id;
			_name = name;
			_desc = desc;
			_preTask = preTask;
			_type = type;
			_isOnline = isOnline == 1;
			_needOrder = needOrder == 1;
			_needPreTaskFinNum = needPreTaskFinNum;
			_npcId = npcId;
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		public function get desc():String
		{
			return _desc;
		}

		/**
		 * 任务类型
		 */		
		public function get type():String
		{
			return _type;
		}

		/**
		 * 前置任务
		 */		
		public function get preTask():int
		{
			return _preTask;
		}

		public function get isOnline():Boolean
		{
			return _isOnline;
		}

		public function get needOrder():Boolean
		{
			return _needOrder;
		}

		public function get needPreTaskFinNum():int
		{
			return _needPreTaskFinNum;
		}

		public function get npcId():int
		{
			return _npcId;
		}


	}
}