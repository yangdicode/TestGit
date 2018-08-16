package mmo.framework.view
{
	import flash.system.ApplicationDomain;

	public class ViewMediatorConfig
	{
		private static const _view_meidator:Object = Class(ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ViewMediatorData"))["data"];
		public function ViewMediatorConfig()
		{
		}
		
		public static function getMediatorClzName(viewClzName:String):String
		{
			return _view_meidator[viewClzName];
		}	
	}
}