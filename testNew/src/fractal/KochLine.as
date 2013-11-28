package fractal 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class KochLine extends Sprite
	{
		import com.foed.Vector2D;
		private var start:Vector2D;
		private var end:Vector2D;
		public function KochLine(a:Vector2D,b:Vector2D) 
		{
			start = a.clone();
			end = b.clone();
			
		}
		
		public function display():void
		{
			graphics.lineStyle(2);
			graphics.moveTo(start.x, start.y);
			graphics.lineTo(end.x, end.y);
		}
		
		
		public function kochA():Vector2D
		{
			return start.clone();
		}
		
		public function kochB():Vector2D
		{
			var v:Vector2D = end.subtract(start);
			//除以3
			v.divide(3);
			//加上开始的距离
			v.add(start);
			return v;
		}
		
		public function kochD():Vector2D
		{
			var v:Vector2D = end.subtract(start);
			//d点在线段的三分之二处
			v.multiply(2 / 3.0);
			v.add(start);
			return v;
		}
		
		public function kochC():Vector2D
		{
			var a:Vector2D = start.clone();
			var v:Vector2D = end.subtract(start);
			v.divide(3);
			a.add(v);
			
			v.angle = 60*Math.PI/180;
			a.add(v);
			return a;
		}
		
		
		public function kochE():Vector2D
		{
			return end.clone();
		}
	}

}