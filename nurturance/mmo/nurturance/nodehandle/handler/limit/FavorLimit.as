package mmo.nurturance.nodehandle.handler.limit
{
	import mmo.nurturance.nodehandle.NurManageHandler;

	public class FavorLimit implements ILimit
	{
		public function FavorLimit()
		{
		}
		
		public function limitResult(limitStr:String):Boolean
		{
			var values:Object = propValues;
			var favor:int;
			
			var params:Array = limitStr.split("_");
			var opt:String = params[3];
			if(limitStr.indexOf("#")!=-1)
			{
				var favor1:int = values[params[0].split("#")[0] + "_" + params[0].split("#")[1]];
				var favor2:int = values[params[1].split("#")[0] + "_" + params[1].split("#")[1]];
				favor = favor1-favor2;
			}
			else
			{
				favor= values[params[0] + "_" + params[1]];
			}
			
			var limitValue:int = int(params[2]);
			trace("limitStr=======" + limitStr);
			trace("favor=======" + favor);
			
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
			return NurManageHandler.instance.propManager.propsData.values;
			
		}
	}
	
	
}