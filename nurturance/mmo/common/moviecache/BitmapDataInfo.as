package mmo.common.moviecache
{
	import flash.display.BitmapData;
	
	public class BitmapDataInfo
	{
		private var _bitmapdata:BitmapData;
		private var _x:Number;
		private var _y:Number;
		
		public function BitmapDataInfo(bitmapdata:BitmapData, x:Number, y:Number)
		{
			this._bitmapdata = bitmapdata;
			this._x = x;
			this._y = y;
		}

		public function get bitmapdata():BitmapData{
			return this._bitmapdata;
		}
		
		public function get x():Number{
			return this._x;
		}
		
		public function get y():Number{
			return this._y;
		}
	}
}