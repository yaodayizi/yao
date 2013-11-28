package fractal 
{
	import com.foed.Vector2D;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author yaoyi
	 */
	
	public class Test2 extends Sprite
	{
		private var lines:Vector.<KochLine>;
		public function Test2() 
		{
			lines = new Vector.<KochLine>();
			var a:Vector2D = new Vector2D(0, 173);
			var b:Vector2D = new Vector2D(stage.stageWidth, 173);
			var c:Vector2D = new Vector2D(stage.stageWidth / 2, 173 + width * Math.cos(30 * Math.PI / 180));
			lines.push(new KochLine(a, b));
			lines.push(new KochLine(b, c));
			lines.push(new KochLine(c, a));
			for (var i:int = 0; i < 5;i++)
			{
				generate();
				
			}
			draw();
		}
		
		public function draw():void
		{
			for (var i:int = 0; i < lines.length; i++)
			{
				var s:KochLine = KochLine(lines[i] );
				addChild(s);
				s.display();
			}
			
			
		}
		
		public function generate():void
		{
			var next:Vector.<KochLine> = new Vector.<KochLine>();
			for (var i = 0; i < lines.length; i++)
			{
				var l:KochLine = KochLine(lines[i]);
				var a:Vector2D = l.kochA();
				var b:Vector2D = l.kochB();
				var c:Vector2D = l.kochC();
				var d:Vector2D = l.kochD();
				var e:Vector2D = l.kochE();
				
				next.push(new KochLine(a, b));
				next.push(new KochLine(b, c));
				next.push(new KochLine(c, d));
				next.push(new KochLine(d, e));
			}
			lines = next;
		}
		
		
		
	}

}