package mmo.common.effect.popup {
	
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	import mmo.common.DisplayUtil;
	import mmo.common.effect.Effect;
	
	public class PopDownEffect extends Effect {
		
		//~ fields ------------------------------------------------------------
		
		private var _bitmap:Bitmap;
		
		private var _callback:Function;
		
		//~ public methods ----------------------------------------------------
		
		public function PopDownEffect(content:DisplayObject,
				toX:int, toY:int,
				delay:Number = 0.2,
				callback:Function = null) {
			if(content.parent == null) {
				return;
			}
			
			this._callback = callback;
			
			var rect:Rectangle = DisplayUtil.getActualBounds(content);
			
			this._bitmap = DisplayUtil.replaceAsBitmap(content);
			
			if(this._bitmap == null) {
				return;
			}
			
			TweenLite.to(this._bitmap, delay, {"x":toX + rect.x, "y":toY + rect.y, "scaleX":0.1, "scaleY":0.1, "onComplete":onComplete, "onCompleteParams":[_bitmap], "ease":Back.easeIn});
		}
		
		override public function dispose():void {
			if(this._bitmap != null) {
				TweenLite.killTweensOf(this._bitmap);
			
				DisplayUtil.stopAndRemove(this._bitmap);
				this._bitmap = null;
			}
			
			this._callback = null;
		}
		
		//~ private methods ---------------------------------------------------
		
		private function onComplete(content:DisplayObject):void {
			if(this._callback != null) {
				this._callback.apply(null, [content]);
			}
			
			dispose();
		}

	}
}