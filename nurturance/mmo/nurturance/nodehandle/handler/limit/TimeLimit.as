package mmo.nurturance.nodehandle.handler.limit
{
	
	import mmo.common.DateUtil;

	public class TimeLimit implements ILimit
	{
		public function TimeLimit()
		{
		}
		
		public function limitResult(limitStr:String):Boolean
		{
//			var values:Object = NurManageHandler.instance.propManager.propsData.values;
//			var favorList:Array = limitStr.split("-");
//			for(var i:int = 1; i < favorList.length; i++)
//			{
//				if(values[favorList[0]] < values[favorList[i]])
//					return false;
//			}
			var year:int = parseInt(limitStr.split("-")[0]);
			var month:int = parseInt(limitStr.split("-")[1])-1;
			var day:int =parseInt(limitStr.split("-")[2])-1;
			var can:Boolean = DateUtil.isBeforeToday(year,month,day);			
			return can;
		}
	}
}