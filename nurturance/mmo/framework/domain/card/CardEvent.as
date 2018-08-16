package mmo.framework.domain.card
{
	import flash.events.Event;
	
	public class CardEvent extends Event
	{
		public static const onUserCardsChange:String = "onUserCardsChange";
		public function CardEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
	}
}