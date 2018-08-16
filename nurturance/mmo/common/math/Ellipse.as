package mmo.common.math{
	import flash.geom.Point
	public class Ellipse
	{
		private var _x:Number
		private var _y:Number
		private var _width:Number
		private var _height:Number
		
		public function Ellipse(w:Number,h:Number)
		{
			_width=w;
			_height=h;
		}
		public function get width():Number
		{
			return _width;
		}
		public function set width(w:Number):void
		{
			_width=w;
		}
		public function get height():Number
		{
			return _height;
		}
		public function set height(h:Number):void
		{
			_width=h;
		}
		public function getxy(angle:Number):Point
		{
			return new Point(getx(angle),gety(angle));
		}
		public function angle(y:Number,a:Number):Number
		{
			return AngelMath.atan2D(y,AngelMath.cosD(a)*_height);
		}
		/**
		算法：
		y: -h-h
		y+2*h: h-3*h
		(y+2*h)/h: 1-3
		((y+2*h)/h-1)/2: 0-1
		((y+2*h)/h-1)/2*(n2-n1): 0-(n2-n1)
		((y+2*h)/h-1)/2*(n2-n1)+n1: n1-n2
		*/
		public function yscale(y:Number,n1:Number=.5,n2:Number=1):Number
		{
			return ((y+2*_height)/_height-1)/2*(n2-n1)+n1;
		}
		private function getx(angle:Number):Number
		{
			return _x=AngelMath.cosD(angle)*_width;
		}
		private function gety(angle:Number):Number
		{
			return _y=AngelMath.sinD(angle)*_height;
		}
	}
}