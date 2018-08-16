package mmo.nurturance.nodehandle.handler.limit
{
	import mmo.nurturance.nodehandle.NurManageHandler;
	
	public class OtherLimit extends FavorLimit
	{
		public function OtherLimit()
		{
		}
		
		
		
		override protected function get propValues():Object
		{
			return NurManageHandler.instance.propManager.otherPropsData.values;
			
		}
	}
	
	
}