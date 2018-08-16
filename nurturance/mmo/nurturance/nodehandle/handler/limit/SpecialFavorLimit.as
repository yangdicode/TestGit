package mmo.nurturance.nodehandle.handler.limit
{
	import mmo.nurturance.nodehandle.NurManageHandler;
	
	public class SpecialFavorLimit extends FavorLimit  
	{
		public function SpecialFavorLimit()
		{
			
		}
		
		override protected function get propValues():Object
		{
			return NurManageHandler.instance.propManager.specialPropsData.values;
			
		}
	}
}