package mmo.play.material.groupbutton
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	
	public class ComboItemGroupButton extends EventDispatcher implements IGroupButton
	{
		private var _view:MovieClip;
		private var _subBtns:Array;
		public function ComboItemGroupButton(view:MovieClip)
		{
			_view = view;
			_subBtns = [];
			
			_view.buttonMode = true;
			_view.mouseChildren = false;
			selected = false;
			parentSelected = false;
			
			_view.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		public function set selected(value:Boolean):void
		{
			if(value)
			{
				_view.gotoAndStop(1);
			}else
			{
				_view.gotoAndStop(2);
			}	
			for each(var sub:IGroupButton in _subBtns)
			{
				sub.parentSelected = value;
			}
		}
		
		public function get selected():Boolean
		{
			return _view.currentFrame == 1;
		}
		
		public function set parentSelected(value:Boolean):void
		{
			if(value)
			{
				_view.visible = true;
			}else
			{
				_view.visible = false;
			}	
			selected = false;
		}
		
		public function get data():Array
		{
			var arr:Array = [];
			for each(var sub:IGroupButton in _subBtns)
			{
				arr = arr.concat(sub.data);
			}
			return arr;
		}
		
		public function addSubButton(sub:IGroupButton):void
		{
			_subBtns.push(sub);
			sub.addEventListener(GroupButtonEvent.ON_SELECTED, onSubSelected);
		}
		
		public function get subButtons():Array
		{
			return _subBtns;
		}
		
		public function findSelectedButton():IGroupButton
		{
			for each(var sub:IGroupButton in _subBtns)
			{
				var btn:IGroupButton = sub.findSelectedButton();
				if(btn != null)
				{
					return btn;
				}	
			}
			if(selected)
			{
				return this;
			}	
			return null;
		}
		
		public function dispose():void
		{
			for each(var sub:IGroupButton in _subBtns)
			{
				sub.removeEventListener(GroupButtonEvent.ON_SELECTED, onSubSelected);
			}
		}	
		
		private function onSubSelected(evt:GroupButtonEvent):void
		{
			var btn:IGroupButton = evt.groupButton;
			if(isMySubButton(btn))
			{
				for each(var sub:IGroupButton in _subBtns)
				{
					if(btn != sub)
					{
						sub.selected = false;
					}	
				}
			}
			this.dispatchEvent(evt.clone());
		}	
		
		private function isMySubButton(sub:IGroupButton):Boolean
		{
			return _subBtns.indexOf(sub) > -1;
		}	
		
		private function onClick(evt:MouseEvent):void
		{
			selected = true;
			var event:GroupButtonEvent = new GroupButtonEvent(GroupButtonEvent.ON_SELECTED);
			event.groupButton = this;
			this.dispatchEvent(event);
		}	
	}
}