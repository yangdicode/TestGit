package mmo.nurturance.nodehandle.talk.event
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	public class NurTalkEventDispatcher extends EventDispatcher
	{
		private static var _instance:NurTalkEventDispatcher;
		public function NurTalkEventDispatcher(target:IEventDispatcher=null)
		{
			super(target);
		}

		public static function get instance():NurTalkEventDispatcher
		{
			if(_instance == null)
				_instance = new NurTalkEventDispatcher();
			return _instance;
		}

	}
}