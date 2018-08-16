package mmo.play.avatar.skin.displayer
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import flash.utils.getTimer;
	
	import mmo.common.DisplayUtil;
	
	/**
	 * 帧显示信息 
	 * @author hekehui
	 * 
	 */
	public class FrameData
	{
		public static const emptyFrameData:FrameData = new FrameData("a000000_0_0", new Sprite);
		
		/**
		 * 该图片的编号,格式为"No:row_column"
		 * */
		private var _key:String;
		private var _source:Sprite;
		private var _bitmapData:BitmapData;
		private var _rect:Rectangle;
		public function FrameData(key:String, source:Sprite)
		{
			_key = key;
			_source = source;
		}
		
		public function dispose():void
		{
			if(_bitmapData != null)
			{	
				_bitmapData.dispose();
				_bitmapData = null;
			}
			DisplayUtil.stop(_source);
		}
		
		public function get source():DisplayObject
		{
			return _source;
		}	
		
		public function get bitmapData():BitmapData
		{
			if(_bitmapData == null)
			{
				parseSource();
			}	
			return _bitmapData;
		}	
		
		public function get rect():Rectangle
		{
			if(_rect == null)
			{
				parseSource();
			}	
			return _rect;
		}	
		
		/**
		 * 衣服的spritesheet 有两种做法,一种是包装了位图, 一种包装了矢量图
		 * 当衣服的面积较大的时候, 位图占用太多内存,并且矢量图转位图的消耗与大小并不成正比
		 * 当衣服面积较小的时候,就直接载入位图, 占用内存少,又不用转换
		 * 
		 * 当前的策略是第一次使用的时候才转换对应的FrameData
		 * */
		private function parseSource():void
		{
			if(_source.numChildren <= 0)
			{
				_bitmapData = new BitmapData(1,1, true, 0x00000000);
				_rect = new Rectangle();
				return;
			}	
			if(_source.numChildren > 1)
			{
				throw new Error(_key + "美术元件有问题 ");
			}
			var dis:DisplayObject = _source.getChildAt(0);
			_rect = (dis.width == 0 || dis.height == 0)?new Rectangle():dis.getBounds(_source);
			
			if(dis is Shape || dis is Sprite)
			{
				var w:Number = Math.round(_rect.width);
				var h:Number = Math.round(_rect.height);
				
				//防止空元件生成BitmapData出错。
				w = (w <= 0)?1:w;
				h = (h <= 0)?1:h;
				_bitmapData = new BitmapData(w, h, true, 0x00000000);
				var matrix:Matrix = new Matrix();
				matrix.translate(-_rect.x, -_rect.y);
				
				_bitmapData.draw(dis, matrix);
			}else if(dis is Bitmap)
			{
				_bitmapData = Bitmap(dis).bitmapData;
			}
			
		}
	
	}
}