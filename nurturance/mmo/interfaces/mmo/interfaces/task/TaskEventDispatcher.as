package mmo.interfaces.task
{
	import flash.events.EventDispatcher;

	public class TaskEventDispatcher extends EventDispatcher
	{
		private static var _instance:TaskEventDispatcher;

		public static function get instance():TaskEventDispatcher
		{
			if (_instance == null)
			{
				_instance = new TaskEventDispatcher();
			}
			return _instance;
		}

		public function TaskEventDispatcher()
		{
		}
	}
}