package mmo.interfaces.usercard
{
	import flash.events.Event;
	
	public class UserCardServiceEvent extends Event
	{
		public static const ONCHOOSEITEM:String = "onChooseItem";
		public static const ENDSERVICE:String = "endUserCardService";
		public var params:Object;
		public function UserCardServiceEvent(type:String, params:Object, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			this.params = params;
		}
		
		private function compile():void{
			UserCardPages;
		}
		
	}
}