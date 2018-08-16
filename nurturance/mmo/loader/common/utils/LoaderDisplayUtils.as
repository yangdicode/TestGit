package mmo.loader.common.utils {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.geom.Rectangle;
	
	import mmo.loader.LoaderContainer;
	
	public class LoaderDisplayUtils {
		
		public function LoaderDisplayUtils() {
		}

		/**
         * 停止元件及其儿子的所有动画
         * 	@params	target	需要停止的元件
         */
        public static function stop(target:DisplayObject):void {
        	if(target is MovieClip) {
        		MovieClip(target).stop();
        	}
        	
        	if(target is DisplayObjectContainer) {
        		for(var i:int = 0, len:int = DisplayObjectContainer(target).numChildren; i < len; i++) {
        			stop(DisplayObjectContainer(target).getChildAt(i));
        		}
        	}
        	else
        	if(target is SimpleButton) {
        		if(SimpleButton(target).upState is DisplayObjectContainer) {
        			stop(SimpleButton(target).upState);
        		}
        		if(SimpleButton(target).downState is DisplayObjectContainer) {
        			stop(SimpleButton(target).downState);
        		}
        		if(SimpleButton(target).overState is DisplayObjectContainer) {
        			stop(SimpleButton(target).overState);
        		}
        		if(SimpleButton(target).hitTestState is DisplayObjectContainer) {
        			stop(SimpleButton(target).hitTestState);
        		}
        	}
        }

        /**
         * 停止元件及其儿子的所有动画，并从舞台移除
         * 	@params	target	需要停止并从显示列表移除的元件
         */
        public static function stopAndRemove(target:DisplayObject):Boolean {
        	stop(target);
        	if(target.parent != null) {
        		var parent:DisplayObjectContainer = target.parent;
        		parent.removeChild(target);
        		return true;
        	}
        	return false;
        }
		
		/**
		 * 调整显示对象的排列方式 
		 * 
		 * @param	disObj		待调整的显示对象
		 * @param	bound		调整的相对范围矩形
		 * @param	alignType	调整类型
		 * @param	offset		相对范围的偏移量
		 */
		public static function align(disObj:DisplayObject):void {
			var bound:Rectangle = new Rectangle(0, 0, 
										LoaderContainer.stageWidth, 
										LoaderContainer.stageHeight);

			// 获得显示对象的包围矩形
			var rect:Rectangle = disObj.getRect(disObj);
			trace("---rect: " + rect);
			// 获得长宽差
			var deltaWidth:Number = bound.width - disObj.width;
			var deltaHeight:Number = bound.height - disObj.height;
			trace("----x: " + disObj.x + " Y: " + disObj.y + " w: " + disObj.width + " h: " + disObj.height);
			disObj.x = bound.x + (deltaWidth >> 1) - rect.x;
			disObj.y = bound.y + (deltaHeight >> 1) - rect.y;
		}

	}
}