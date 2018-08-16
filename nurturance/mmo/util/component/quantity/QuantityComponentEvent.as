package mmo.util.component.quantity
{
	import flash.events.Event;
	
	public class QuantityComponentEvent extends Event
	{
		public static const QUANTITYCHANGE:String = "quantityChange";
		public function QuantityComponentEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
		}
		
		private var _quantity:int;

		public function get quantity():int
		{
			return _quantity;
		}

		public function set quantity(value:int):void
		{
			_quantity = value;
		}

	}
}