package mmo.nurturance.nodehandle.handler.limit
{
	import mmo.nurturance.nodehandle.NurManageHandler;

	public class MaxLimit implements ILimit
	{
		public function MaxLimit()
		{
		}
		
		public function limitResult(limitStr:String):Boolean
		{
			var values:Object = NurManageHandler.instance.propManager.propsData.values;
			var favorList:Array = limitStr.split("-");
			for(var i:int = 1; i < favorList.length; i++)
			{
				if(values[favorList[0]] < values[favorList[i]])
					return false;
			}
			return true;
		}
	}
}