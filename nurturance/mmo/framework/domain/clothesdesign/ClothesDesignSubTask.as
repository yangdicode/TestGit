package mmo.framework.domain.clothesdesign
{
	import com.adobe.utils.StringUtil;

	public class ClothesDesignSubTask
	{
		private var _id:int;
		private var _name:String;
		private var _mainTask:int;
		private var _type:String;
		private var _level:int;
		private var _costRest:int;
		private var _recomendSuits:Array;
		private var _limits:Array;
		private var _defaultCloIds:Array;
		
		public function ClothesDesignSubTask(id:int, name:String, mainTaskId:int, type:String, level:int, cost:int, recomendSuit:String, limits:Array = null, defaultCloIds:Array = null)
		{
			_id = id;
			_name = name;
			_mainTask = mainTaskId;
			_type = type;
			_level = level;
			_costRest = cost;
			_limits = limits == null ? [] : limits;
			_defaultCloIds = defaultCloIds == null ? [] : defaultCloIds;
			_recomendSuits = [];
			if(!StringUtil.isEmpty(recomendSuit)){
				_recomendSuits = recomendSuit.split(",");
			}
		}

		public function get id():int
		{
			return _id;
		}

		/**
		 * 大任务id
		 */		
		public function get mainTask():int
		{
			return _mainTask;
		}

		public function get name():String
		{
			return _name;
		}

		/**
		 * 难度
		 */		
		public function get level():int
		{
			return _level;
		}

		/**
		 * 消耗
		 */		
		public function get costRest():int
		{
			return _costRest;
		}

		/**
		 * 任务类型
		 */		
		public function get type():String
		{
			return _type;
		}

		/**
		 * 任务限制
		 */		
		public function get limits():Array
		{
			return _limits;
		}

		public function get recomendSuits():Array
		{
			return _recomendSuits.concat();
		}

		public function get defaultCloIds():Array
		{
			return _defaultCloIds;
		}


	}
}