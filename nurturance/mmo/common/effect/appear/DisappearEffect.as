package mmo.common.effect.appear {
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	import mmo.common.DisplayUtil;
	import mmo.common.effect.Effect;
	
	public class DisappearEffect extends Effect{
		
		//~ fields ------------------------------------------------------------
		
		private var _container:DisplayObjectContainer;
		
		private var _content:DisplayObject;
		
		private var _callback:Function;
		
		private var _bitmap:Bitmap;
		
		//~ public methods ----------------------------------------------------
		
		public function DisappearEffect(content:DisplayObject, 
				delay:Number = 0.2,
				callback:Function = null) {
			this._content = content;
			this._callback = callback;	
			
			this._bitmap = DisplayUtil.replaceAsBitmap(content);
			
			TweenLite.to(this._bitmap, delay, {"alpha":0.0, "onComplete":onComplete, "onCompleteParams":[content], "ease":Back.easeOut});
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