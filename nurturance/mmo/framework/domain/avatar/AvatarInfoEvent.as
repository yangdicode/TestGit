package mmo.framework.domain.avatar
{
	import flash.events.Event;
	
	public class AvatarInfoEvent extends Event
	{
		public static const ONAVATARRESET:String = "onAvatarReset";
		public static const PUTON_CLOTHES:String = "putOnClothes";
		public static const TAKEOFF_CLOTHES:String = "takeOffClothes";
		public var params:Object;
		public function AvatarInfoEvent(type:String, params:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			
			this.params = params;
		}
	}
}