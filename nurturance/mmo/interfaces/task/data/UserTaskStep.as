package mmo.interfaces.task.data
{
	/**
	 * 用户任务步骤类
	 * **/
	
	public class UserTaskStep
	{
		public var taskStepId:int;
		public var finish:Boolean;
		public var extData:String;
		
		public function UserTaskStep()
		{
		}
		
		public static function parse(o:Object):UserTaskStep
		{
			var uts:UserTaskStep = new UserTaskStep();
			uts.taskStepId = o.tsid;
			uts.finish = o.finish;
			uts.extData = o.state;
			return uts;
		}
		
		public static function initData(tsId:int):UserTaskStep
		{
			var uts:UserTaskStep = new UserTaskStep();
			uts.taskStepId = tsId;
			uts.finish = false;
			uts.extData = "0";
			return uts;
		}
		
		public function isDoing():Boolean
		{
			return this.finish == false;
		}
		
		public function isFinish():Boolean
		{
			return this.finish == true;
		}
			
		public function setFinish(finishStep:Boolean):void
		{
			this.finish = finishStep;
		}
	}
}