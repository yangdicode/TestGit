package mmo.util.component.filter
{
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	
	import mmo.util.component.filter.event.FilterEvent;
	import mmo.util.component.filter.subbutton.BaseButton;
	import mmo.util.component.filter.subbutton.ComboButton;
	import mmo.util.component.filter.subbutton.SubButton;
	

	public class Filter extends Sprite
	{

		private static var _curShowFilter:Filter;
		//~ constants ---------------------------------------------------------

		/** 子列表高度 */
		private static const SUB_LIST_HEIGHT:int = 300;
		
		//~ package private methods ----------------------------------------------------

		public function Filter(filterSprite:Class, listBackground:Class, subButton:Class, comboButton:Class)
		{
			super();

			_filterSpriteClass = filterSprite;
			_listBackgroundClass = listBackground;
			_subButtonMcClass = subButton;
			_comboButtonMcClass = comboButton;
			
			init();
			this.addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}

		private var _filterBtn:Sprite;
		/**
		 * 包括(normal, mouseOn, click)3桢的mc, 每桢都包括一个负责碰撞的 hitSprite和一个txt文本
		 * mouseOn, click, normal状态有所区别,需表现出含有subButton
		 * */
		private var _comboButtonMcClass:Class;
		/**
		 * 元件, 包含一名字为txt的文本
		 * */
		private var _filterSpriteClass:Class;

		//~ fields ------------------------------------------------------------

		/** 分类列表 */
		private var _list:FilterList;
		/**
		 * 背景元件
		 * */
		private var _listBackgroundClass:Class;

		private var _mouseHitAreas:Array;
		/**
		 * 包括(normal, mouseOn, click)3桢的mc, 每桢都包括一个负责碰撞的 hitSprite和一个txt文本
		 * mouseOn, click, normal状态有所区别
		 * */
		private var _subButtonMcClass:Class;
		
		private var _title_data:Object;
		private var _selected:String;
		private var _stage:Stage;
		private var _listHeight:Number = SUB_LIST_HEIGHT;

		override public function addChild(child:DisplayObject):DisplayObject
		{
			this._mouseHitAreas.push(child);
			return super.addChild(child);
		}

		public function addSubButton(title:String, data:Object):void
		{
			var sub:SubButton = new SubButton(new _subButtonMcClass, title, data);
			_list.addButton(sub);
			_title_data[title] = data;
			sub.addEventListener(FilterEvent.SELECTED_A_TYPE, onSelectedAType);
		}
		
		public function setMaskHeight(height:Number):void{
			_listHeight = height;
			_list.setMaskHeight(height);
		}

		/**
		 * datas 格式[{"title":title, "data": data}]
		 * data!=null：本大类也可选
		 * */
		public function addComboButton(title:String, datas:Array, data:Object = null, height:Number = 150, isRight:Boolean=true):void
		{
			var combo:ComboButton = new ComboButton(new _comboButtonMcClass, title, new _listBackgroundClass, data);
			if(data != null){
				_title_data[title] = data;
			}
			
			var subWidth:Number = 0;
			for each(var obj:Object in datas)
			{
				var sub:SubButton = new SubButton(new _subButtonMcClass, obj["title"], obj["data"]);
				combo.addSubButton(sub);
				_title_data[obj["title"]] = obj["data"];
				
				subWidth = Math.max(sub.width, subWidth);
			}
			combo.setMaskHeight(height);
			combo.addEventListener(FilterEvent.SELECTED_A_TYPE, onSelectedAType);
			_list.addButton(combo);
			
			var temp:Number = _list.x + combo.x + combo.width + 3;
			if (!isRight)
			{
				temp = _list.x - subWidth - 5;
			}
			combo.setListLocal(temp, _list.y + combo.y - 2, this);
		}
	
		public function clear():void
		{
			dispose();
			init();		
			
			if(stage)
			{	
				_stage = stage;
				_stage.addEventListener(Event.ENTER_FRAME, enterFrame);
			}
		}	
		
		public function dispose():void
		{
			trace(this + "how is this disposed?" + _stage)
			if(_stage)
			{	
				_stage.removeEventListener(Event.ENTER_FRAME, enterFrame);
				_stage = null;
			}
			if (this._list != null)
			{
				for each(var button:BaseButton in _list.buttonList)
				{
					button.removeEventListener(FilterEvent.SELECTED_A_TYPE, onSelectedAType);
				}
				if(contains(_list))
				{
					removeChild(_list);
				}	
				_list.dispose();
				_list = null;
			}
			removeChild(_filterBtn);
			_filterBtn = null;
			this._mouseHitAreas = null;
			_title_data = null;
		}

		private function setText():void
		{
			var txt:TextField = this._filterBtn.getChildByName("txt") as TextField;
			txt.text = _selected;
		}
		
		public function getSelected():Object
		{
			return _title_data[_selected];
		}	
		
		public function  setSelected(title:String):void
		{
			_selected = title;
			setText();
		}	
		
		public function offsetList(offsetX:Number, offsetY:Number):void{
			_list.x += offsetX;
			_list.y += offsetY;
		}
		
		//~ private methods ---------------------------------------------------
		private function hideList():void
		{
			if(_curShowFilter == this)
			{
				_curShowFilter = null;
			}
			// 隐藏子按钮
			this._list.hide();
		}

		private function init():void
		{
			this._mouseHitAreas = [];
			this._title_data = {};
			
			_filterBtn = new _filterSpriteClass;
			_filterBtn.buttonMode = true;
			_filterBtn.mouseChildren = false;
			addChild(this._filterBtn);

			var subButton:Sprite = new _subButtonMcClass;
			_list = new FilterList(new _listBackgroundClass);
			_list.x = _filterBtn.x + (_filterBtn.width - subButton.width) / 2;
			_list.y = _filterBtn.y + _filterBtn.height;
			
			// 初始最大高度为300
			_list.setMaskHeight(_listHeight);
		}

		private function enterFrame(e:Event):void
		{
			var hitMouseHitArea:Boolean = false;
			var arr:Array = this._mouseHitAreas;
			if(!arr)
			{
				return;
			}
			var hit:Sprite;
			for each (var area:Sprite in arr)
			{
				if (area.hitTestPoint(this.stage.mouseX, this.stage.mouseY))
				{
					hitMouseHitArea = true;
					hit = area;
					break;
				}
			}
			if (hitMouseHitArea)
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
			_selected = e.params["Text"] as String;
			setText();

			_list.immediatelyHide();
			this.dispatchEvent(e);
		}

		private function showList():void
		{
			_list.rollY();
			if(_curShowFilter != null)
			{
				return;
			}
			_curShowFilter = this;
			// 显示子按钮
			if(!this.contains(_list))
			{
				this.addChild(_list);
//				var ret:Rectangle = this.getBounds(_list);
//				var bottomY:Number = this.localToGlobal(new Point(0, _list.y + _list.height)).y;
//				var heigher:Number = bottomY - LayerManager.stage.stageHeight + 5;
//				if(heigher > 0){
//					_list.y -= heigher;
//				}
			}	
			_list.show();
			parent.setChildIndex(this, parent.numChildren - 1);
		}
		
		private function onAddedToStage(evt:Event):void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			_stage = this.stage;
			_stage.addEventListener(Event.ENTER_FRAME, enterFrame);
		}	
	}
}