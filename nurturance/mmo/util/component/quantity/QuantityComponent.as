package mmo.util.component.quantity
{
	import flash.display.InteractiveObject;
	import flash.display.SimpleButton;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;

	public class QuantityComponent extends EventDispatcher
	{
		private var _txtQuantity:TextField;
		private var _btnMinus:SimpleButton;
		private var _btnAdd:SimpleButton;
		private var _digitNum:int;
		private var _maxQuantity:int;
		private var _quantity:int;
		public function QuantityComponent(txtQuantity:TextField, btnMinus:SimpleButton, btnAdd:SimpleButton, digitNum:int = 3)
		{
			_txtQuantity = txtQuantity;
			_btnMinus = btnMinus;
			_btnAdd = btnAdd;
			_digitNum = digitNum;
			_quantity = 1;
			initMaxQuantity();
			update();
			
			_txtQuantity.restrict = "0-9";
			_txtQuantity.maxChars = digitNum;
			_txtQuantity.addEventListener(Event.CHANGE, onInput);
			_btnAdd.addEventListener(MouseEvent.CLICK, onAdd);
			_btnMinus.addEventListener(MouseEvent.CLICK, onMinus);
		}
		
		public function get maxQuantity():int
		{
			return _maxQuantity;
		}

		public function set maxQuantity(value:int):void
		{
			_maxQuantity = value;
			_quantity = _quantity;
		}

		public function get quantity():int
		{
			return _quantity;
		}	
		
		public function set quantity(value:int):void
		{
			if(value > _maxQuantity)
			{
				value = _maxQuantity;
			}	
			_quantity = value;
			update();
			notifyQuantityChange();
		}
		
		public function updateBtnState():void
		{
			update();
		}
		
		private function initMaxQuantity():void
		{
			_maxQuantity = 0;
			var base:int = 10;
			var digitValue:int = 9;
			for (var i:int = 0; i < _digitNum; i++)
			{
				_maxQuantity = _maxQuantity * base + digitValue;
			}	
		}	
		
		private function onInput(evt:Event):void
		{
			_quantity = int(_txtQuantity.text);	
			if(_quantity > _maxQuantity)
			{
				_quantity = _maxQuantity;
			}	
			if(_quantity <= 0)
			{
				_quantity = 1;
			}	
			update();
			notifyQuantityChange();
		}
		
		private function onAdd(evt:MouseEvent):void
		{
			if(_quantity >= _maxQuantity)
			{
				return;
			}	
			_quantity += 1;
			update();
			notifyQuantityChange();
		}	
		
		private function onMinus(evt:MouseEvent):void
		{
			if(_quantity <= 1)
			{
				return;
			}	
			_quantity -= 1;
			update();
			notifyQuantityChange();
		}	
		
		private function update():void
		{
			_txtQuantity.text = String(_quantity);
			DisplayUtil.setButtonState(_btnAdd, Boolean(_quantity < _maxQuantity));
			DisplayUtil.setButtonState(_btnMinus, Boolean(_quantity > 1));
		}	
		
		private function notifyQuantityChange():void
		{
			var event:QuantityComponentEvent = new QuantityComponentEvent(QuantityComponentEvent.QUANTITYCHANGE);
			event.quantity = _quantity;
			dispatchEvent(event);
		}	
		
		public function dispose():void
		{
			_txtQuantity.removeEventListener(Event.CHANGE, onInput);
		}	
	}
}