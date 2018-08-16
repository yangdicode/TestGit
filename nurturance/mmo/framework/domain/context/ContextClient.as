package mmo.framework.domain.context
{
	/**
	 * 房间变量
	 */	
	public class ContextClient
	{
		private static var _instance:ContextClient;
		
		private static const extensionName:String = "ContextExtension";		
		public static const ROOM_CONTEXT_UPDATE:String = "43_evt0";
		
		public function ContextClient()
		{
		}
		
		public static function get instance():ContextClient
		{
			if(_instance == null)
			{
				_instance = new ContextClient();
			}	
			return _instance;
		}	
	}
}