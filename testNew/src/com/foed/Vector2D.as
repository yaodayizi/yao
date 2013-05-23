package com.foed
{
	import flash.display.Graphics;
	
	public class Vector2D
	{
		private var _x:Number;
		private var _y:Number;
		
		public function Vector2D(x:Number = 0, y:Number = 0)
		{
			_x = x;
			_y = y;
		}
		
		public function draw(graphics:Graphics, color:uint = 0):void
		{
			graphics.lineStyle(0, color);
			graphics.moveTo(0, 0);
			graphics.lineTo(_x, _y);
		}
		
		/**
		 * 克隆
		 * @return
		 */
		public function clone():Vector2D
		{
			return new Vector2D(x, y);
		}
		
		/**
		 * 初始化
		 * @return
		 */
		public function zero():Vector2D
		{
			_x = 0;
			_y = 0;
			return this;
		}
		
		/**
		 * 向量是否为0
		 * @return
		 */
		public function isZero():Boolean
		{
			return _x == 0 && _y == 0;
		}
		
	   /**
	    * 设置向量大小
	    */
		public function set length(value:Number):void
		{
			var a:Number = angle;
			_x = Math.cos(a) * value;
			_y = Math.sin(a) * value;
		}
		
		/**
		 * 得到向量大小
		 */
		public function get length():Number
		{
			return Math.sqrt(lengthSQ);
		}
		
		public function get lengthSQ():Number
		{
			return _x * _x + _y * _y;
		}
		
		public function set angle(value:Number):void
		{
			var len:Number = length;
			_x = Math.cos(value) * len;
			_y = Math.sin(value) * len;
		}
		
		public function get angle():Number
		{
			return Math.atan2(_y, _x);
		}
		
		/**
		 * 单位化向量
		 * @return
		 */
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
		 * 截断
		 * @param	max
		 * @return
		 */
		public function truncate(max:Number):Vector2D
		{
			length = Math.min(max, length);
			return this;
		}
		
		/**
		 * 倒置
		 * @return
		 */
		public function reverse():Vector2D
		{
			_x = -_x;
			_y = -_y;
			return this;
		}
		
		/**
		 * 是否单位化
		 * @return
		 */
		public function isNormalized():Boolean
		{
			return length == 1.0;
		}
		
		/**
		 * 积
		 * @param	v2
		 * @return
		 */
		public function dotProd(v2:Vector2D):Number
		{
			return _x * v2.x + _y * v2.y;
		}
		
		/**
		 * 差
		 * @param	v2
		 * @return
		 */
		public function crossProd(v2:Vector2D):Number
		{
			return _x * v2.y - _y * v2.x;
		}
		
		/**
		 * 两个向量之差
		 * @param	v1
		 * @param	v2
		 * @return
		 */
		public static function angleBetween(v1:Vector2D, v2:Vector2D):Number
		{
			if (!v1.isNormalized())
				v1 = v1.clone().normalize();
			if (!v2.isNormalized())
				v2 = v2.clone().normalize();
			return Math.acos(v1.dotProd(v2));
		}
		
		/**
		 * 确定给定向量的方向
		 * @param	v2
		 * @return
		 */
		public function sign(v2:Vector2D):int
		{
			return perp.dotProd(v2) < 0 ? -1 : 1;
		}
		
		/**
		 * 垂直与这个向量的向量
		 */
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
		
		public function add(v2:Vector2D):Vector2D
		{
			return new Vector2D(_x + v2.x, _y + v2.y);
		}
		
		public function subtract(v2:Vector2D):Vector2D
		{
			return new Vector2D(_x - v2.x, _y - v2.y);
		}
		
		public function multiply(value:Number):Vector2D
		{
			return new Vector2D(_x * value, _y * value);
		}
		
		public function divide(value:Number):Vector2D
		{
			return new Vector2D(_x / value, _y / value);
		}
		
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
		}
		
		public function set y(value:Number):void
		{
			_y = value;
		}
		
		public function get y():Number
		{
			return _y;
		}
		
		public function toString():String
		{
			return "[Vector2D (x:" + _x + ", y:" + _y + ")]";
		}
	}
}