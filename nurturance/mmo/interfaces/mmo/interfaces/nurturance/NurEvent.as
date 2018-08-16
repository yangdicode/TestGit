package mmo.interfaces.nurturance
{
	import flash.events.Event;
	
	public class NurEvent extends Event
	{
		private var _pramas:Object;
		public function NurEvent(type:String, obj:Object = null, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			_pramas = obj;
			super(type, bubbles, cancelable);
		}
		
		public override function clone():Event
		{
			return new NurEvent(type, pramas, bubbles, cancelable);
		}
		
		public static const START_CHAPTER:String = "start_Chapter";
		
		public static const FINISH_CHAPTER:String = "finish_Chapter";
		
		public static const NODE_SUC:String = "node_Suc";
		
		public static const NODE_FAIL:String = "node_Fail";
		
		public static const CHANGE_PROP:String = "change_Prop";
		
		public static const CHANGE_SETTING:String = "change_Setting";
		
		public static const FreeTalk_Close:String = "FreeTalk_Close";
		
		public static const FreeTalk_Action:String = "FreeTalk_Action";
		
		public static const SoundTalk_Finish:String = "SoundTalk_Finish";
		
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