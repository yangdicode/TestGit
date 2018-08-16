package mmo.common.effect.appear {
	
	import com.greensock.TweenLite;
	import com.greensock.easing.Back;
	
	import flash.display.Bitmap;
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Rectangle;
	
	import mmo.common.DisplayUtil;
	import mmo.common.effect.Effect;
	
	public class AppearEffect extends Effect{
		
		//~ fields ------------------------------------------------------------
		
		private var _container:DisplayObjectContainer;
		
		private var _content:DisplayObject;
		
		private var _callback:Function;
		
		private var _bitmap:Bitmap;
		
		//~ public methods ----------------------------------------------------
		
		public function AppearEffect(container:DisplayObjectContainer, 
				content:DisplayObject, 
				toX:int, toY:int,
				delay:Number = 0.2,
				callback:Function = null){
			this._container = container;
			this._content = content;
			this._callback = callback;
			
			this._content.x = toX;
			this._content.y = toY;		
			
			var rect:Rectangle = DisplayUtil.getActualBounds(content);

			this._bitmap = DisplayUtil.cacheAsBitmap(content);
			this._bitmap.x = toX + rect.x;
			this._bitmap.y = toY + rect.y;
			this._bitmap.alpha = 0.0;
			
			container.addChild(this._bitmap);
			
			TweenLite.to(this._bitmap, delay, {"x":toX + rect.x, "y":toY + rect.y, "alpha":0.9, "onComplete":onComplete, "onCompleteParams":[content], "ease":Back.easeOut});
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