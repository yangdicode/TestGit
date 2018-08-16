package mmo.interfaces.task.data
{
	import mmo.interfaces.task.data.TaskStep;

	public class GatherStepDefine
	{
		public var stepId:int;
		public var type:int;
		public var itemNum:Object;

		public function GatherStepDefine()
		{
		}

		//格式为：1-140-5,1-62-5,1-66-5,1-141-5
		public static function parse(taskStep:TaskStep):GatherStepDefine
		{
			var d:GatherStepDefine = new GatherStepDefine();
			d.stepId = taskStep.taskStepId;
			d.type = taskStep.type;
			d.itemNum = {};

			var s:Array = taskStep.extData.split(",");
			for (var i:int = 0; i < s.length; i++)
			{
				var ss:Array = String(s[i]).split("-");
				
				//物品key修改为 type_id
				var itemKey:String = ss[0] + "_" + ss[1];
				d.itemNum[itemKey] = {"type":int(ss[0]),"id":int(ss[1]),"num":int(ss[2])};
//				d.itemNum[int(ss[0])] = int(ss[1]);
			}
			return d;
		}
	}
}