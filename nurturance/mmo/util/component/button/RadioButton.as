package mmo.util.component.button
{
	import flash.display.MovieClip;
	import flash.events.EventDispatcher;
	import flash.events.MouseEvent;
	
	import mmo.common.DisplayUtil;

	public class RadioButton extends EventDispatcher
	{
		private var _view:MovieClip;
		private var _index:int = -1;
		
		private var _children:Array = [];
		private var _parent:RadioButton;
		
		private var _buttonEnable:Boolean = true;
		
		private var _curSelectIndex:int = -1;
		private var _isSelect:Boolean = true;
		
		public function RadioButton(view:MovieClip = null, index:int = 0, roll:Boolean = false){
			_view = view == null ? new MovieClip() : view;
			_index = index;
			if(roll)
			{
				_view.addEventListener(MouseEvent.ROLL_OVER, onSelectBtn);
			}
			else
			{
				_view.addEventListener(MouseEvent.CLICK, onSelectBtn);
			}
			unSelected();
		}
		
		public function dispose():void{
			_view.removeEventListener(MouseEvent.CLICK, onSelectBtn);
			_view.removeEventListener(MouseEvent.ROLL_OVER, onSelectBtn);
			for each(var btn:RadioButton in _children){
				btn.dispose();
			}
			_children = null;
			_parent = null;
			_view = null;
		}
		
		public function get view():MovieClip{
			return _view;
		}
		
		public function get curSelectIndex():int{
			return _curSelectIndex;
		}
		
		public function get selectedIndexs():Array{
			if(isLeaf){
				return [_index];
			}else{
				var child:RadioButton = _children[_curSelectIndex];
				if(child == null){
					return [_curSelectIndex];
				}
				var indexs:Array = _parent == null ? child.selectedIndexs : [_index].concat(child.selectedIndexs);
				return indexs;
			}
		}
		
		public function addChildren(children:Vector.<RadioButton>):void{
			for each(var btn:RadioButton in children){
				addChild(btn);
			}
		}
		
		public function addChild(child:RadioButton):void{
			_children[child._index] = child;
			child._parent = this;
			child.addEventListener(RadioButtonEvent.ON_SELECT_BUTTON, onSelectChild);
		}
		
		/**
		 * 从0开始
		 */		
		public function getChild(index:int):RadioButton{
			return _children[index];
		}
		
		public function select(indexs:Array = null):void{
			_curSelectIndex = (indexs == null || indexs.length <= 0) ? minChildIndex : indexs.shift();
			_view.gotoAndStop(2);
			DisplayUtil.setTextFieldMouseDisabled(_view);
			_isSelect = true;
			if(!isLeaf){
				var child:RadioButton;
				for each(child in _children){
					if(child._index == _curSelectIndex){
						child.select(indexs);
						child.childrenVisible = true;
					}else{
						child.unSelected();
					}
				}
			}else{
				notifySelect();
			}
		}
		
		public function set buttonEnable(enable:Boolean):void{
			_buttonEnable = enable;
		}
		
		public function unSelected():void{
			_view.gotoAndStop(1);
			DisplayUtil.setTextFieldMouseDisabled(_view);
			_isSelect = false;
			childrenVisible = false;
			if(!isLeaf){
				for each(var child:RadioButton in _children){
					child.unSelected();
				}
			}
		}
		
		public function set childrenVisible(visible:Boolean):void{
			if(!isLeaf){
				for each(var child:RadioButton in _children){
					child.view.visible = visible;
				}
			}
		}
		
		private function get minChildIndex():int{
			for each(var child:RadioButton in _children){
				if(child != null){
					return child._index;
				}
			}
			return 0;
		}
		
		private function get isLeaf():Boolean{
			return _children.length <= 0;
		}
		
		private function onSelectBtn(evt:MouseEvent):void{
			evt.stopImmediatePropagation();
			if(!buttonEnable){
				return;
			}
			if(_isSelect){
				return;
			}
			_parent.select([_index]);
		}
		
		private function notifySelect():void{
			dispatchEvent(new RadioButtonEvent(RadioButtonEvent.ON_SELECT_BUTTON));
		}
		
		private function onSelectChild(evt:RadioButtonEvent):void{
			notifySelect();
		}

		public function get buttonEnable():Boolean{
			if(_parent != null){
				return _parent.buttonEnable && _buttonEnable;
			}else{
				return _buttonEnable;
			}
		}

	}
}