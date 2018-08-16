package mmo.play.material.groupbutton
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	import flash.events.MouseEvent;
	
	import mmo.framework.domain.material.ItemGroup;
	public class ItemGroupButton extends EventDispatcher implements IGroupButton
	{
		private var _view:MovieClip;
		private var _itemGrop:ItemGroup;
		public function ItemGroupButton(view:MovieClip, itemGroup:ItemGroup)
		{
			_view = view;
			_itemGrop = itemGroup;
			
			_view.buttonMode = true;
			_view.mouseChildren = false;
			parentSelected = false;
			selected = false;
			
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
			return [_itemGrop];
		}
		
		public function addSubButton(sub:IGroupButton):void
		{
			throw new Error("这是叶子按纽, 不能添加子按纽");
		}
		
		public function get subButtons():Array
		{
			return null;
		}
		
		public function findSelectedButton():IGroupButton
		{
			if(selected)
			{
				return this;
			}	
			return null;
		}	
		
		public function dispose():void
		{
			
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