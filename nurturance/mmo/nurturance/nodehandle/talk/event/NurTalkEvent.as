package mmo.nurturance.nodehandle.talk.event
{
	import flash.events.Event;
	
	public class NurTalkEvent extends Event
	{
		private var _pramas:Object;
		public function NurTalkEvent(type:String, obj:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_pramas = obj;
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new NurTalkEvent(type, pramas, bubbles, cancelable);
		}
		
		public static const ON_NPC_VIEW_LOADED:String = "onNpcViewLoaded";
		
		public static const ON_NPC_VIEWS_LOADED:String = "onNpcViewsLoaded";
		
		public static const ON_NPC_ICON_LOADED:String = "onNpcIconLoaded";
		
		public static const SCENE_NPC_TALKING:String = "sceneNpcTalking";

		public function get pramas():Object
		{
			return _pramas;
		}

		public function set pramas(value:Object):void
		{
			_pramas = value;
		}

	}
}