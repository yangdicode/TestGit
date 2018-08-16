package mmo.interfaces.jumpsoon
{
	import flash.events.Event;
	
	public class JumpSoonEvent extends Event
	{
		public function JumpSoonEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false){
			super(type, bubbles, cancelable);
		}
		public var params:Object;
		public static const JumpSoonMovieEnd:String = "onJumpSoonMovieEnd";
		
	}
}