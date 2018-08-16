package mmo.common.effect.fade {
	
	import com.greensock.TweenLite;
	import com.greensock.easing.Linear;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.geom.Rectangle;
	
	import mmo.common.DisplayUtil;
	import mmo.common.effect.Effect;
	
	/**
	 * 淡入效果
	 */
	public class FadeOutEffect extends Effect{
		
		//~ fields ------------------------------------------------------------
		
		private var _content:DisplayObject;
		
		private var _callback:Function;
		
		private var _bitmap:Bitmap;
		
		//~ public methods ----------------------------------------------------
		
		public function FadeOutEffect(content:DisplayObject, 
				delay:Number = 0.2,
				callback:Function = null) {
			this._content = content;
			this._callback = callback;
			
			var rect:Rectangle = DisplayUtil.getActualBounds(content);
			
			this._bitmap = DisplayUtil.replaceAsBitmap(content);
			
			if(this._bitmap == null) {
				return;
			}
			
			var toX:int = this._content.x - this._content.width * 0.04;
			var toY:int = this._content.y - this._content.height * 0.04;
			
			TweenLite.to(this._bitmap, delay, {"x":toX + rect.x, "y":toY + rect.y, "alpha":0.0, "scaleX":1.08, "scaleY":1.082, "onComplete":onComplete, "onCompleteParams":[content], "ease":Linear.easeNone});
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