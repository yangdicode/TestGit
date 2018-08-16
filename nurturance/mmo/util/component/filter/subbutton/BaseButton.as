package mmo.util.component.filter.subbutton {
	
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	
	import mmo.util.component.filter.event.FilterEvent;
	
	public class BaseButton extends Sprite {
		
		//~ fields ------------------------------------------------------------
		protected var _data;
		protected var _button:MovieClip;
		
		//~ public methods ----------------------------------------------------
		
		public function BaseButton(view:MovieClip, text:String, data:Object) {
			super();
			_data = data;
			
			var txt:TextField = view.getChildByName("txt") as TextField;
			txt.text = text;
			
			setButton(view);
		}
		
		public function get hitSprite():Sprite {
			return this._button.getChildByName("hitSprite") as Sprite;
		}
		
		//~ protected methods ---------------------------------------------------
		
		protected function setButton(button:MovieClip):void {
			this._button = button;
			this._button.buttonMode = true;
			this._button.mouseChildren = false;
			this._button.gotoAndStop(1);
			
			this.addChild(this._button);
			
			this._button.addEventListener(MouseEvent.ROLL_OVER, onRollOverBtn, false, 0, true);
			this._button.addEventListener(MouseEvent.ROLL_OUT, onRollOutBtn, false, 0, true);
			this._button.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBtn, false, 0, true);
			this._button.addEventListener(MouseEvent.MOUSE_UP, onMouseUpBtn, false, 0, true);
			this._button.addEventListener(MouseEvent.CLICK, onMouseClickThis, false, 0, true);
			
			this._button.hitArea = hitSprite;
			hitSprite.visible = false;
		}
		
		protected function onMouseClickThis(e:MouseEvent):void {
			e.stopImmediatePropagation();
			if(_data == null){
				return;
			}
			var txt:TextField = this._button.getChildByName("txt") as TextField;
			
			var params:Object = {};
			params["Text"] = txt.text;
			params["data"] = _data;
			
			var evt:FilterEvent = new FilterEvent(FilterEvent.SELECTED_A_TYPE, params);
			this.dispatchEvent(evt);
		}
		
		protected function onRollOverBtn(e:MouseEvent):void {
			setMouseOver();
		}
		
		protected function onRollOutBtn(e:MouseEvent):void {
			setNormal();
		}
		
		protected function onMouseDownBtn(e:MouseEvent):void {
			setMouseDown();
		}
		
		protected function onMouseUpBtn(e:MouseEvent):void {
			if(this.stage == null)
			{
				return;
			}	
			if(this._button.hitTestPoint(this.stage.mouseX,this.stage.mouseY)) { 
				setMouseOver();
			}
			else {
				setNormal();
			}
		}
		
		private function setNormal():void{
			this._button.gotoAndStop(1);
		}
		
		private function setMouseOver():void{
			if(_data != null){
				this._button.gotoAndStop(2);
			}
		}
		
		private function setMouseDown():void{
			if(_data != null){
				this._button.gotoAndStop(3);
			}
		}
		
	}
}