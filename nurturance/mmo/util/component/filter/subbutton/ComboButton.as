package mmo.util.component.filter.subbutton
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.util.component.filter.FilterList;
	import mmo.util.component.filter.event.FilterEvent;

	public class ComboButton extends BaseButton
	{

		//~ constants ---------------------------------------------------------

		/** 子列表高度 */
		private static const SUB_LIST_HEIGHT:int = 160;
		
		private var _listContainer:Sprite;
		

		//~ public methods ----------------------------------------------------

		public function ComboButton(view:MovieClip, text:String, listBackground:Sprite, data:Object = null)
		{
			super(view, text, data);
			// 初始时没有子按钮
			this._hasSubButtons = false;

			this._list = new FilterList(listBackground);
			this._list.setMaskHeight(SUB_LIST_HEIGHT);

//			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage, false, 0, true);
			this.addEventListener(Event.ENTER_FRAME, onEnterFrame, false, 0, true);
		}

		/** 是否有子按钮 */
		private var _hasSubButtons:Boolean;

		//~ fields ------------------------------------------------------------

		private var _list:FilterList;

		public function addSubButton(button:SubButton):void
		{
			this._hasSubButtons = true;

			this._list.addButton(button);
			button.addEventListener(FilterEvent.SELECTED_A_TYPE, onSelectedAType);
		}
		
		public function setListLocal(x:Number, y:Number, container:Sprite):void{
			_listContainer = container;
			this._list.x = x;
			this._list.y = y;
		}

		public function dispose():void
		{
			this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
			_listContainer = null;
			for each(var sub:SubButton in _list.buttonList)
			{
				sub.removeEventListener(FilterEvent.SELECTED_A_TYPE, onSelectedAType);
			}
			_list.dispose();
			_list = null;			
		}
		
		public function setMaskHeight(height:Number):void{
			_list.setMaskHeight(height);
		}

		//~ protected methods -------------------------------------------------

		override protected function onRollOverBtn(e:MouseEvent):void
		{
			if (!this._hasSubButtons)
			{
				return;
			}

			super.onRollOverBtn(e);
		}

		private function hideList():void
		{
			this._list.hide();
		}

		//~ private methods ---------------------------------------------------

//		private function onAddedToStage(e:Event):void
//		{
//			var point:Point = DisplayUtil.localToLocal(this, this._panel, new Point(0, 0));
//			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
//			this._panel.addChild(this._list);
//		}

		private function onEnterFrame(e:Event):void
		{
			if(this.stage == null)
			{
				return;
			}	
			if (!this._hasSubButtons)
			{
				return;
			}
			if (this._button.hitTestPoint(this.stage.mouseX, this.stage.mouseY) || this._list.hitTestPoint(this.stage.mouseX, this.stage.mouseY))
			{
				showList();
			}
			else
			{
				hideList();
			}
		}

		private function onSelectedAType(e:FilterEvent):void
		{
			_list.immediatelyHide();
			this.dispatchEvent(e);
		}

		private function showList():void
		{
			if(!_listContainer.contains(_list))
			{
				_listContainer.addChild(_list);
			}
			_list.show();
		}
	}
}