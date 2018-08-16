package mmo.interfaces.agtask
{
	import flash.events.Event;
	
	public class AGTaskEvnent extends Event
	{	
		public static const ON_DATA_INITED:String = "ON_DATA_INITED";
		
		//返回agTaskId：int
		public static const ON_GET_TASK_BONUS:String = "ON_GET_TASK_BONUS";
		
		//返回agPhaseId：int
		public static const ON_GET_TASK_PHASE_BONUS:String = "ON_GET_TASK_PHASE_BONUS";
		
		//返回agTaskName, monsterId, CurNum, NeedNum    
		public static const ON_MONSTER_CONUT_UPDATE:String = "ON_MONSTER_CONUT_UPDATE";
		
		//返回sp:面板元件, data:AGTpResData中的数据
		public static const INIT_TASKPANEL:String = "INIT_TASKPANEL";
		public static const UPDATE_TASKPANEL:String = "UPDATE_TASKPANEL";
		
		
		public var params:Object;
		public function AGTaskEvnent(type:String,params:Object = null)
		{
			super(type);
			this.params = params;
			if(this.params == null){
				params = {};
			}
		}
	}
}