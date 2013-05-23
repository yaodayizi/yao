package  
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Brownian1 extends Sprite 
	{
		private var numDots:Number = 300;
		private var friction:Number = .95;
		private var dots:Array;
		private var maxRadius:Number = 50;
		
		public function Brownian1() 
		{
			init();
		}
		
		private function init():void 
		{
			dots = new Array();
			for (var i:uint = 0; i < numDots; i++)
			{
				var dot:Ball = new Ball(1, 0);
				var radius:Number = Math.sqrt(Math.random()) * maxRadius;
				var angle:Number = Math.random() * (Math.PI * 2);
				dot.x = stage.stageWidth / 2 + Math.cos(angle) * radius;
				dot.y = stage.stageHeight / 2 +Math.sin(angle) * radius;
				
				dot.vx = 0;
				dot.vy = 0;
				addChild(dot);
				dots.push(dot);
			}
			graphics.lineStyle(0, 0, .5);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			for (var i:uint = 0; i < numDots; i++)
			{
				var dot:Ball = dots[i];
				graphics.moveTo(dot.x, dot.y);

				dot.vx += Math.random() * .2 -.1;
				dot.vy += Math.random() * .2 -.1;
				dot.x += dot.vx;
				dot.y += dot.vy;

				dot.vx *= friction;
				dot.vy *= friction;
				graphics.lineTo(dot.x, dot.y);
				if (dot.x > stage.stageWidth)
				{
					dot.x = 0;
				}
				else if (dot.x < 0)
				{
					dot.x = stage.stageWidth;
				}
				
				if (dot.y  > stage.stageHeight)
				{
					dot.y = 0;
				}
				else if (dot.y < 0)
				{
					dot.y = stage.stageHeight;
				}
				
			}
		}
		
		
		
	}

}