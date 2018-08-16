package mmo.framework.domain.clothesdesign
{
	import flash.system.ApplicationDomain;

	public class ClothesDesigns
	{
		
		private static const cls:Class = ApplicationDomain.currentDomain.getDefinition("mmo.clothesdesign.config.ClothesDesignsData") as Class;
		private static const mainTaskData:Object = cls["mainTask"];
		private static const subTaskData:Object = cls["subTask"];
		private static const levelData:Object = cls["level"];
		
		private static var _maxLevel:int;
		
		private static var _taskId2SubTasks:Object;
		
		public function ClothesDesigns(){
		}
		
		public static function getMainTaskById(id:int):ClothesDesignTask{
			return mainTaskData[id];
		}
		
		public static function getSubTaskById(id:int):ClothesDesignSubTask{
			return subTaskData[id];
		}
		
		public static function getMainTaskBuyType(type:String):Array{
			var arr:Array = [];
			var define:ClothesDesignTask;
			for each(define in mainTaskData){
				if(!define.isOnline){
					continue;
				}
				if(define.type != type){
					continue;
				}
				arr.push(define);
			}
			arr.sortOn("id", Array.NUMERIC);
			return arr;
		}
		
		public static function getSubTaskByMainId(mainTaskId:int):Array{
			if(_taskId2SubTasks == null){
				initTask2SubTask();
			}
			if(!_taskId2SubTasks.hasOwnProperty(mainTaskId)){
				throw new Error("没有找到大任务配置");
			}
			var arr:Array = _taskId2SubTasks[mainTaskId];
			arr.sortOn("id", Array.NUMERIC);
			return arr;
		}
		
		public static function getLevelByExp(exp:int):ClothesDesignLevel{
			var level:ClothesDesignLevel;
			var nextLevel:ClothesDesignLevel;
			for(var i:int = 1; i <= getMaxLevel(); i ++){
				nextLevel = getLevelDefineByLevel(i);
				if(exp >= nextLevel.experience){
					level =  nextLevel;
				}else{
					break;
				}
			}
			return level;
		}
		
		public static function getOnlineDiarys():Array{
			var diaryData:Object = cls["diaryData"];
			var arr:Array = [];
			var task:ClothesDesignTask;
			for each(var diary:CDDiary in diaryData){
				task = getMainTaskById(diary.taskId);
				if(task.isOnline){
					arr.push(diary);
				}
			}
			return arr;
		}
		
		public static function getDiaryById(diaryId:int):CDDiary{
			var diaryData:Object = cls["diaryData"];
			return diaryData[diaryId];
		}
		
		public static function getLevelDefineByLevel(level:int):ClothesDesignLevel{
			level = level >= _maxLevel ? _maxLevel : level;
			return levelData[level];
		}
		
		public static function getMaxLevel():int{
			if(_maxLevel <= 0){
				for(var i:int = 1; i < 1000; i ++){
					if(!levelData.hasOwnProperty(i)){
						_maxLevel = i - 1;
						break;
					}
				}
			}
			return _maxLevel;
		}
		
		public static function getEndGameTalk(rate:String):String{
			var config:Object = cls["endGameTalk"];
			var talks:Array = config[rate];
			return getRandomElement(talks);
		}
		
		public static function getAllExcData():Object{
			return cls["exchangeData"];
		}
		
		public static function getAllBuyData():Object{
			return cls["buyData"];
		}
		
		public static function getNpcDefaultClothes(npcId:int):Array{
			var data:Object = cls["npcDefaultClothes"];
			if(data.hasOwnProperty(npcId)){
				return data[npcId];
			}
			return data[0];
		}
		
		private static function getRandomElement(fromArray:Array):*
		{
			var randomInt:int = getRandomInt(fromArray.length-1, 0);
			return fromArray[randomInt];
		}
				
		private static function getRandomInt(maxValue:int, mixValue:int = 0):int
		{
			if(maxValue < mixValue)
			{
				throw new Error(">>>MaxValue is smaller then MixValue!");
			}
			return mixValue + int((maxValue - mixValue + 1) * Math.random());
		}
		
		private static function initTask2SubTask():void{
			_taskId2SubTasks = {};
			var define:ClothesDesignSubTask;
			var taskArray:Array;
			for each(define in subTaskData){
				if(_taskId2SubTasks.hasOwnProperty(define.mainTask)){
					taskArray = _taskId2SubTasks[define.mainTask];
				}else{
					taskArray = [];
					_taskId2SubTasks[define.mainTask] = taskArray;
				}
				taskArray.push(define);
			}
		}
		
		private function compile():void{
			var task:ClothesDesignTask;
			var subTask:ClothesDesignSubTask;
			var score:ClothesDesignTaskScore;
			var level:ClothesDesignLevel;
			var taskResult:ClothesDesignSubTaskResult;
			var buyItem:BuyItemDefine;
			var excItem:ExchangeItemDefine;
			var handlerType:EntranceHandlerType;
			var iHandler:IEntranceHandler;
		}
		
	}
}