package mmo.common.math
{
	public class Vector2D
	{
		private var _x:Number;
		private var _y:Number;
		
		
		/**
		 * 构造函数
		 * */
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			_x = x;
			_y = y;
		}
		
		/**
		 * 克隆函数
		 * 返回一个与本身一模一样的Vector2D
		 * */
		public function clone():Vector2D
		{
			return new Vector2D(x, y);
		}
		
		
		/**
		 * 将本向量设为零向量
		 * 返回本向量的引用
		 * */
		public function zero():Vector2D
		{
			_x = 0;
			_y = 0;
			return this;
		}
		
		
		/**
		 * 该向量是否为零向量
		 * 是返回true 否则返回false
		 * */
		public function isZero():Boolean
		{
			return _x == 0 && _y == 0;
		}
		
		
		/**
		 * 设置向量的模
		 * */
		public function set length(value:Number):void
		{
			var a:Number = angle;
			_x = Math.cos(a) * value;
			_y = Math.sin(a) * value;
		}
		
		/**
		 * 获得向量的模
		 * */
		public function get length():Number
		{
			return Math.sqrt(lengthSQ);
		}
		
		/**
		 * 获取向量的长度的平方
		 * */
		public function get lengthSQ():Number
		{
			return _x * _x + _y * _y;
		}
		
		/**
		 * 设置向量的弧度值
		 * */
		public function set angle(value:Number):void
		{
			var len:Number = length;
			_x = Math.cos(value) * len;
			_y = Math.sin(value) * len;
		}
		
		/**
		 * 获取向量的弧度值
		 * */
		public function get angle():Number
		{
			return Math.atan2(_y, _x);
		}
		
		
		/**
		 * 单位化本向量
		 * */
		public function normalize():Vector2D
		{
			if (length == 0)
			{
				_x = 1;
				return this;
			}
			var len:Number = length;
			_x /= len;
			_y /= len;
			return this;
		}
		
		/**
		 * 截取向量.
		 * 参数max为向量的模的最大值
		 * 当向量模小于max时不变，当向量模大于max时设置为max
		 * */
		public function truncate(max:Number):Vector2D
		{
			length = Math.min(max, length);
			return this;
		}
		
		
		/**
		 * 反转向量
		 * */
		public function reverse():Vector2D
		{
			_x = -_x;
			_y = -_y;
			return this;
		}
		
		
		/**
		 * 判断是否为单位向量
		 * */
		public function isNormalized():Boolean
		{
			return length == 1.0;
		}
		
		
		public function dotProd(v2:Vector2D):Number
		{
			return _x * v2.x + _y * v2.y;
		}
		
		
		public function crossProd(v2:Vector2D):Number
		{
			return _x * v2.y - _y * v2.x;
		}
		
		
		/**
		 * 返回v1 和 v2之间的夹角
		 * */
		public static function angleBetween(v1:Vector2D, v2:Vector2D):Number
		{
			if (!v1.isNormalized())
				v1 = v1.clone().normalize();
			if (!v2.isNormalized())
				v2 = v2.clone().normalize();
			return Math.acos(v1.dotProd(v2));
		}
		
		/**
		 * 判断向量v2在本向量的左侧还是右侧
		 * 左返回 -1 右返回 1
		 * */
		public function sign(v2:Vector2D):int
		{
			return perp.dotProd(v2) < 0 ? -1 : 1;
		}
		
		
		public function get perp():Vector2D
		{
			return new Vector2D(-y, x);
		}
		
		
		public function dist(v2:Vector2D):Number
		{
			return Math.sqrt(distSQ(v2));
		}
		
		public function distSQ(v2:Vector2D):Number
		{
			var dx:Number = v2.x - x;
			var dy:Number = v2.y - y;
			return dx * dx + dy * dy;
		}
		
		
		
		/**
		 * 向量加
		 * */
		public function add(v2:Vector2D):Vector2D
		{
			return new Vector2D(_x + v2.x, _y + v2.y);
		}
		
		/**
		 * 向量减
		 * */
		public function subtract(v2:Vector2D):Vector2D
		{
			return new Vector2D(_x - v2.x, _y - v2.y);
		}
		
		/**
		 * 乘法
		 * */
		public function multiply(value:Number):Vector2D
		{
			return new Vector2D(_x * value, _y * value);
		}
		
		/**
		 * 除法
		 * */
		public function divide(value:Number):Vector2D
		{
			return new Vector2D(_x / value, _y / value);
		}
		
		/**
		 * 判断相等
		 * */
		public function equals(v2:Vector2D):Boolean
		{
			return _x == v2.x && _y == v2.y;
		}
		
		public function set x(value:Number):void
		{
			_x = value;
		}
		
		public function get x():Number
		{
			return _x;
		} /** * Sets / gets the y value of this vector. */
		
		public function set y(value:Number):void
		{
			_y = value;
		}
		
		public function get y():Number
		{
			return _y;
		} /** * Generates a string representation of this vector. * @return String A description of this vector. */
		
		public function toString():String
		{
			return "[Vector2D (x:" + _x + ", y:" + _y + ")]";
		}
	}
}