package mmo.framework.domain.collegeprofession
{
	import flash.system.ApplicationDomain;

	public class CollegeProfessionDefines
	{
		private static const CPConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.collegeprofession.config.CollegeProfessionDataConfig") as Class;
		private static const CPLvConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.collegeprofession.config.CollegeProfessionLvConfig") as Class;
		private static const CPTaskConfig:Class = ApplicationDomain.currentDomain.getDefinition("mmo.collegeprofession.config.CollegeProfessionTaskConfig") as Class;
		
		private static var maxLvData:Object;
		private static var cpLvExpData:Object;
		
		public function CollegeProfessionDefines()
		{
		}
		
		public static function getCollegeProfessionTitleName(proId:int,titId:int):String
		{
			return "无";
		}
		
		public static function getCollegeProfessionById(id:int):CollegeProfessionDefine
		{
			var data:Object = CPConfig["data"];
			if (!data.hasOwnProperty(id))
			{
				//throw new Error("没有此职业：" + id);
				return data[0];
			}
			return data[id];
		}
		
		public static function hasOpenCollegeProfession(id:int):Boolean{
			var data:Object = CPConfig["data"];			
			return data.hasOwnProperty(id)
		}
		
		public static function getCollegeProfessionLvDefine(id:int, lv:int):CollegeProfessionLvDefine{
			var data:Object = CPLvConfig["data"];
			var key:String = id + "_" + lv;
			if (!data.hasOwnProperty(key))
			{
				//throw new Error("没有此职业等级定义：" + id + "_" + lv);
				return data["0_0"];
			}
			return data[key];
		}
		
		public static function getCollegeProfessionLvByExp(id:int,exp:int):int
		{			
			initLvExpMap();
			var arrayExp:Array = cpLvExpData[id];
						
			for( var i:int =0;i<arrayExp.length;i++ )
			{
				if( exp < arrayExp[i] )
					return i;
			}
			return arrayExp.length;
		}
		
		public static function getToNextLvNeedExp(id:int, lv:int):int{
			if(lv >= getMaxLv(id)){
				return getCollegeProfessionLvDefine(id, getMaxLv(id)).limitExp;
			}
			return getCollegeProfessionLvDefine(id, lv+1).limitExp;
		}
		
		public static function getMaxExp(id:int):int{
			initMaxLv();
			return getCollegeProfessionLvDefine(id,maxLvData[id]).limitExp;;
		}
		
		public static function getMaxLv(id:int):int{
			initMaxLv();
			return maxLvData[id];
		}
		
		//任务
		public static function getTaskDefine(id:int):CollegeProfessionTaskDefine{
			var data:Object = CPTaskConfig["data"];
			if (!data.hasOwnProperty(id))
			{
				throw new Error("没有此任务：" + id);
			}
			return data[id];
		}		
		
		public static function getTaskProfessionId(taskId:int):int{
			var data:Object = CPTaskConfig["data"];
			if (!data.hasOwnProperty(taskId))
			{
				//throw new Error("没有此任务：" + taskId);
				return 0;
			}
			return CollegeProfessionTaskDefine(data[taskId]).proId;
		}
		
		public static function isProDailyTaskId(proId:int,taskId:int):Boolean{
			var dailyTaskIds:Array = getCollegeProfessionById(proId).arrayDailyTaskIds;
			return Boolean(dailyTaskIds.indexOf(taskId)>=0 );
		}
		
		//————————————————————————————//
		private static function initMaxLv():void{
			if(maxLvData != null){
				return;
			}
			maxLvData = {};
			var lvData:Object =CPLvConfig["data"];
			for each(var lvDef:CollegeProfessionLvDefine in lvData){
				if(maxLvData.hasOwnProperty(lvDef.id)){
					maxLvData[lvDef.id] = Math.max(maxLvData[lvDef.id], lvDef.lv);
				}else{
					maxLvData[lvDef.id] = lvDef.lv;
				}
			}
		}
		
		private static function initLvExpMap():void{
			if(cpLvExpData != null){
				return;
			}
			cpLvExpData = {};
			var lvData:Object =CPLvConfig["data"];
			for each(var lvDef:CollegeProfessionLvDefine in lvData){
				var arrayExp:Array = [];
				if(!cpLvExpData.hasOwnProperty(lvDef.id)){
					cpLvExpData[lvDef.id] = arrayExp;
				}
				arrayExp = cpLvExpData[lvDef.id]
				arrayExp[lvDef.lv-1] = lvDef.limitExp;
			}
		}
		
	}
}