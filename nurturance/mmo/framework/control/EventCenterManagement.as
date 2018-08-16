package mmo.framework.control
{
	/**
	 * 提供注册事件中心的服务，使其中注册的事件中心之间可以互相广播事件
	 * 
	 * */
	public class EventCenterManagement
	{
		private static var _instance:EventCenterManagement;
		public static function get instance():EventCenterManagement
		{
			if(_instance == null)
			{
				_instance = new EventCenterManagement();
			}	
			return _instance;
		}	
		
		public function EventCenterManagement()
		{
			_centers = [];
		}
		
		private var _centers:Array;
		
		public function get centers():Array
		{
			return _centers;
		}
		
		public function register(center:EventCenter):void
		{
			_centers.push(center);
		}	
		
		public function unregister(center:EventCenter):void
		{
			var index:int = _centers.indexOf(center);
			if(index > -1)
			{
				_centers.splice(index, 1);
			}	
		}	
	}
}