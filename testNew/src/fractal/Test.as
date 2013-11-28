package fractal 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Test extends Sprite 
	{
		private var tmpRadius:int;
		public function Test() 
		{
			init();
		}
		
		private function init():void 
		{
			/*drawCircle(stage.stageWidth/2,stage.stageHeight/2, 200);
			graphics.lineStyle(2);
			graphics.drawEllipse(0, 0, 100, 100);
			graphics.drawEllipse(25, 25, 50, 50);*/
			
			//graphics.drawCircle(0, 0, 50);
			cantor(10, 20, stage.stageWidth - 20);
		}
		
		private function drawCircle(x:Number, y:Number, radius:Number):void
		{
			tmpRadius = radius;
			graphics.lineStyle(2);
			graphics.drawCircle(x, y, radius);
			if (radius > 8)
			{
				//radius *= 0.75;
				drawCircle(x + radius / 2, y, radius / 2);
				drawCircle(x - radius / 2, y, radius / 2);
				drawCircle(x, y + radius / 2, radius / 2);
				drawCircle(x, y -radius / 2, radius / 2);
			}
		}
		
		private function cantor(x:Number, y:Number, len:Number):void
		{
			if (len >= 1)
			{
				graphics.lineStyle(1);
				graphics.moveTo(x, y);
				graphics.lineTo(x + len, y);
				
				y += 20;
				
				cantor(x, y, len / 3);
				cantor(x + len * 2 / 3, y, len / 3);
			}
		}
		
		
		
	}

}