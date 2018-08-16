package mmo.interfaces.task.data
{
	public class FighterStepDefine
	{
		public var stepId:int;
		public var type:int;
		public var monsterNum:Object;
		
		public function FighterStepDefine()
		{
		}
		
		public static function parseTaskStep(taskStep:TaskStep):FighterStepDefine
		{
			var fsd:FighterStepDefine = new FighterStepDefine();
			fsd.stepId = taskStep.taskStepId;
			fsd.type = taskStep.type;
			fsd.monsterNum = parseExtData(taskStep.extData);
			
			return fsd;
		}
		
		public static function parseUserTaskStep(userTaskStep:UserTaskStep):FighterStepDefine
		{
			var fsd:FighterStepDefine = new FighterStepDefine();
			fsd.stepId = userTaskStep.taskStepId;
			fsd.type = TaskStepType.FIGHTER;
			fsd.monsterNum = parseExtData(userTaskStep.extData);
			
			return fsd;
		}
		
		private static function parseExtData(extData:String):Object
		{
			var monsterNum:Object = new Object();
			var s:Array = extData.split(",");
			for (var i:int = 0; i < s.length; i++)
			{
				var ss:Array = String(s[i]).split("-");
				monsterNum[int(ss[0])] = int(ss[1]);
			}
			return monsterNum;
		}
	}
}