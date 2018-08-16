package mmo.nurturance.nodehandle.handler.limit
{
	import mmo.nurturance.nodehandle.NurManageHandler;

	public class BranchLimit implements ILimit
	{
		private var _key:String;
		public function BranchLimit()
		{
		}
		
		public function limitResult(limitStr:String):Boolean
		{
			var values:Object = propValues;
			var params:Array = limitStr.split("_");
			var opt:String = params[3];
			var favor:int = values[params[0] + "_" + params[1]];
			var limitValue:int = int(params[2]);
			trace("limitStr=======" + limitStr);
			trace("branchFavor=======" + favor);
			switch(opt)
			{
				case "gt":
					return favor > limitValue;
					break;
				
				case "ge":
					return favor >= limitValue;
					break;
				
				case "eq":
					return favor == limitValue;
					break;
				
				case "lt":
					return favor < limitValue;
					break;
				
				case "le":
					return favor <= limitValue;
					break;
			}
			return false;
		}
		
		protected function get propValues():Object
		{
			return NurManageHandler.instance.propManager.branchPropsData.values;
			
		}
	}
	
	
}