package mmo.common.moviecache{
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.PixelSnapping;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import mmo.common.DisplayUtil;		
	/**
	 * MovieClip位图化工具 
	 * @author hekehui
	 * 
	 */
	public class MovieBitmapCacher {
		/**
		 * 是否开启位图化处理，Play里BootLoader会将ConfigReader.instance.debug赋给该属性
		 */
		public static var open:Boolean = true;
		
		private var _movie:MovieClip;
		private var _callback:Function;
		private var _thisObject:*;
		private var _cached:Boolean = false;
	
		private var _cachedFrames:Array = [];
		private var _frameItems:Array = [];
		
		private var _clip:Boolean = false;
		private var _left:int = 0;
		private var _top:int = 0;
		private var _width:int = 960;
		private var _height:int = 560;
		
		public function MovieBitmapCacher(movie:MovieClip
			, clip:Boolean = false, left:int = 0, top:int = 0, width:int = 960, height:int = 560){
			trace("new MovieBitmapCacher:"+ movie);
			this._movie = movie;
			
			this._clip = clip;
			this._left = left;
			this._top = top;
			this._width = width;
			this._height = height;
		}
		
		/**
		 * 被处理的动画
		 * @return 
		 * 
		 */
		public function get movie():MovieClip{
			return this._movie;
		}
		
		/**
		 * 动画位图化
		 * 
		 * @param displayObject		待缓存的元件
		 */
		public function cacheMovie(callback:Function, thisObject:* = null):void {
			this._callback = callback;
			this._thisObject = thisObject;
			
			if(open){
				trace("cacheMovie:" + this._movie);
				trace("this.movie.totalFrames:" + this._movie.totalFrames);
				this._movie.gotoAndStop(1);		
				for(var frame:int = 0; frame < _movie.totalFrames; frame ++){
					_movie.addFrameScript(frame, this.onFrameChange);
				}
			}
			this.onCached();
		}
		
		/**
		 * 对当前帧所有元件做缓存 
		 * 
		 */
		private function onFrameChange():void
		{
			var bitmapInfo:BitmapDataInfo = null;
			if(this.frameIsCached){
				while(this._movie.numChildren > 0){
					var child:DisplayObject = this._movie.getChildAt(0);
					DisplayUtil.stopAndRemove(child);
				}
				bitmapInfo = this._frameItems[this._movie.currentFrame-1];
				if(bitmapInfo != null){
					var bitmap:Bitmap = new Bitmap(bitmapInfo.bitmapdata, PixelSnapping.NEVER, true);
					this._movie.addChild(bitmap);
					bitmap.x = bitmapInfo.x;
					bitmap.y = bitmapInfo.y;
//				trace("bitmapInfo frame:"+ this._movie.currentFrame +
//					"x:"+ bitmapInfo.x + ",y:"+ bitmapInfo.y
//					+ ",w:"+ bitmapInfo.bitmapdata.width + ",h:"+ bitmapInfo.bitmapdata.height);
				}
				return;
			}
			
			trace("cache frame:" + this._movie.currentFrame );
			bitmapInfo = this.getBitmapInfo(this._movie);
			this._frameItems[this._movie.currentFrame] = bitmapInfo;	
			this._cachedFrames.push(this._movie.currentFrame);	
		}
		
		private function get frameIsCached():Boolean{
			if(this._cachedFrames.indexOf(this._movie.currentFrame) != -1){
				return true;
			}
			
			return false;
		}
		
		private function getBitmapInfo(displayObject:DisplayObject):BitmapDataInfo{
			var width:int = Math.ceil(displayObject.width);
			var height:int = Math.ceil(displayObject.height);
			if(width == 0 || height == 0){
				return null;
			} 

			return this.cacheAsBitmapData(displayObject);
		}
		
		/**
		 * 将元件缓存为位图，并返回
		 * 因为矢量图中，子元件的注册点可以为负数，即它的包围矩阵的坐标可能为负数，
		 * 但位图的包围矩阵的坐标必须为整数，所以会自动调整坐标
		 * 
		 * 使用样例请见 mmo.framework.scene.SceneBase
		 * 
		 * @param	displayObj	待缓存的元件
		 * 						该元件不能被flip，scale等操作
		 * 
		 * @return	位图
		 */
		private function cacheAsBitmapData(displayObj:DisplayObject):BitmapDataInfo {	
			if(this._clip){	
				trace("cacheAsBitmapData clip");
				var bitmapdata:BitmapData = new BitmapData(this._width, this._height, true, 0);
				var matrix:Matrix = displayObj.transform.matrix;
				bitmapdata.draw(displayObj, null, null, null
					, new Rectangle(this._left, this._top, this._width, this._height));
				return new BitmapDataInfo(bitmapdata, 0, 0);
			}
			
			return this.cacheAllAsBitmapData(displayObj);
		}
		
		private function cacheAllAsBitmapData(displayObj:DisplayObject):BitmapDataInfo{
			trace("cacheAllAsBitmapData");
			// 特效太大了，全部cache 350M+， 只做屏幕部分缓存 50M就OK  (火云)			
			var bitmapInfo:BitmapDataInfo;			

			var bounds:Rectangle = displayObj.getBounds(displayObj);
			bounds.x = int(bounds.x);
			bounds.y = int(bounds.y);
			// 保存单元格大小
			bounds.width = Math.ceil(bounds.width + bounds.x - Number(bounds.x));
			bounds.height = Math.ceil(bounds.height + bounds.y - Number(bounds.y));	
			trace("bounds:" + bounds);		
			if(!(bounds.width <= 0 || bounds.width > 2880 || bounds.height <= 0 || bounds.height > 2880)) {
				var bitmapdata:BitmapData = new BitmapData(bounds.width, bounds.height, true, 0);
				var matrix:Matrix =new Matrix();
				matrix.translate(-bounds.x, -bounds.y);			
				bitmapdata.draw(displayObj, matrix);
				bitmapInfo = new BitmapDataInfo(bitmapdata, bounds.x, bounds.y);
			}else{
				trace("out of size, width:" + bounds.width + ",height:" + bounds.height);
			}

			return bitmapInfo;
		}		
		
		private function onCached():void
		{
			this._callback.apply(this._thisObject);
		}
		
		public function dispose():void
		{
			this._callback = null;
			this._thisObject = null;

			for each(var bitmapdata:BitmapData in this._frameItems){
				if(bitmapdata != null){
					bitmapdata.dispose();
				}				
			}
			this._frameItems = null;
			
			DisplayUtil.stopAndRemove(this._movie);
			this._movie = null;						
		}
	}
}