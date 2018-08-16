package mmo.common.effect.popup {
	
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	import mmo.common.DisplayUtil;
	import mmo.common.effect.Effect;
	
	public class PopUpEffect extends Effect {
		
		//~ fields ------------------------------------------------------------
		
		private var _container:DisplayObjectContainer;
		
		private var _content:DisplayObject;
		
		private var _callback:Function;
		
		private var _bitmap:Bitmap;
		
		//~ public methods ----------------------------------------------------
		
		public function PopUpEffect(container:DisplayObjectContainer, 
				content:DisplayObject, 
				fromX:int, fromY:int, 
				toX:int, toY:int,
				delay:Number = 0.2,
				callback:Function = null) {
			this._container = container;
			this._content = content;
			this._callback = callback;
			
			this._content.x = toX;
			this._content.y = toY;		
					
			this._bitmap = DisplayUtil.cacheAsBitmap(content);
			if(this._bitmap == null) {
				onComplete(this._content);
				return;
			}
			
			var rect:Rectangle = DisplayUtil.getActualBounds(this._content);
			
			this._bitmap.x = fromX + rect.x * 0.1;
			this._bitmap.y = fromY + rect.y * 0.1;
			
			this._bitmap.scaleX = this._bitmap.scaleY = 0.1;
			
			container.addChild(this._bitmap);
			
			TweenLite.to(this._bitmap, delay, {"x":toX + rect.x, "y":toY + rect.y, "scaleX":1, "scaleY":1, "onComplete":onComplete, "onCompleteParams":[_bitmap], "ease":Back.easeOut});
		}
		
		public function get window():DisplayObject{
			return this._content;
		}
		
		override public function dispose():void {
			if(this._bitmap != null) {
				TweenLite.killTweensOf(this._bitmap);
			
				DisplayUtil.stopAndRemove(this._bitmap);
				this._bitmap = null;
			}
			
			this._container = null;
			this._content = null;
			
			this._callback = null;
		}
		
		//~ private methods ---------------------------------------------------
		
		private function onComplete(content:DisplayObject):void {
			this._container.addChild(this._content);

			if(this._callback != null) {
				this._callback.apply(null, [content]);
			}
			
			dispose();
		}

	}
}