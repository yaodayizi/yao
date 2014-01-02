package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.filters.GlowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Test extends Sprite
	{
		private var quadTree:QuadTree;
		private var bitmap:Bitmap;
		private var list:Array = [];
		private var shape:Shape;
		public function Test() 
		{
			init();
		}
		
		private function init():void 
		{
			bitmap = new Bitmap();
			bitmap.bitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0);
			addChild(bitmap);
			quadTree = new QuadTree(0, new Rectangle(0, 0, stage.stageWidth, stage.stageHeight));
			shape = new Shape();
			bitmap.filters = [new GlowFilter(0xFFFFFF,.6,16,16,5,1,false)];
			for (var i:int = 0; i < 1000; i++)
			{
				//var rect:Rectangle = new Rectangle(Math.random() * stage.stageWidth, Math.random() * stage.stageHeight, Math.random() * 10, Math.random() * 10);
				//Math.random() * 10
				var ball:Ball = new Ball(Math.random() * 10, Math.random() * 4-2, Math.random() * 4-2);
				ball.x = Math.random() * stage.stageWidth;
				ball.y = Math.random() * stage.stageHeight;
				shape.graphics.clear();
				shape.graphics.beginFill(0xFF0000, .5);
				shape.graphics.drawCircle(0, 0, ball._radius);
				shape.graphics.endFill();
				
				list.push(ball);
				quadTree.insert(new Rectangle(0, 0, ball.width, ball.height));
				var matrix:Matrix =  new Matrix();
				matrix.translate(ball.x, ball.y);
				bitmap.bitmapData.draw(shape,matrix);
				
			}
			
			addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			

		}
		
		private function enterFrameHandler(e:Event):void 
		{
			var len:uint = list.length;
			bitmap.bitmapData.fillRect(new Rectangle(0, 0, stage.stageWidth, stage.stageHeight), 0);
			quadTree.clear();
			for (var i:uint = 0; i < len; i++)
			{
				var ball:Ball = Ball(list[i]);
				ball.x += ball._vx;
				ball.y += ball._vy;
				if (ball.x > stage.stageWidth)
					ball.x = 0;
				
				if (ball.x < 0)
					ball.x = stage.stageWidth;
					
				if (ball.y > stage.stageHeight)
					ball.y = 0;
					
				if (ball.y < 0)
					ball.y = stage.stageHeight;
					
				shape.graphics.clear();
				shape.graphics.beginFill(0xFF0000, .5);
				shape.graphics.drawCircle(0, 0, ball._radius);
				shape.graphics.endFill();
				
				var matrix:Matrix =  new Matrix();
				matrix.translate(ball.x, ball.y);
				bitmap.bitmapData.draw(shape, matrix);
				quadTree.insert(new Rectangle(0, 0, ball.width, ball.height));
			}
			
		}
		
	}

}