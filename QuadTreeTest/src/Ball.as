package  
{
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Ball  
	{
		public var _vx:Number;
		public var _vy:Number;
		public var x:Number;
		public var y:Number;
		public var width:Number;
		public var height:Number;
		public var _radius:int;
		public function Ball(radius:Number,vx:int,vy:int) 
		{
			_radius = radius;
			_vx = vx;
			_vy = vy;
			x = 0;
			y = 0;
			width = height = radius * 2;
			
		}
		
		private function init():void 
		{
			
		}
		
	}

}