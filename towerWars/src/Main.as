package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Main extends Sprite 
	{
		private var baseMc:base;
		private var minionMc:minion;
		private var pathMc:path;
		private var cant_buildMc:cant_build;
		private var rangeMc:range;
		
		private var baseRange:Number = 300;
		private var canBePlaced:Boolean = false;
		private var placed:Boolean = false;
		private var wayPointX:Array  = new Array(40, 140, 140, 220, 220, 80, 80, 340, 340, 420, 420);
		private var wayPointY:Array = new Array(140, 140, 60, 60, 240, 240, 320, 320, 100, 100, -20);
		private var delay:Number = 25;
		private var newMonster:uint = 0;
		private var monstersPlaced:Number = 0;
		private var firing:Boolean = false;
		
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			baseMc = new base();
			minionMc = new minion();
			pathMc = new path();
			rangeMc = new range();
			cant_buildMc = new cant_build();
			
			rangeMc.width = baseRange;
			rangeMc.height = baseRange;
			baseMc.addEventListener(Event.ENTER_FRAME, baseEnterFrame);

			rangeMc.addEventListener(Event.ENTER_FRAME, rangeEnterFrame);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
			
			addChild(pathMc);
			addChild(cant_buildMc);
			addChild(rangeMc);
			addChild(baseMc);
			return;
			
		}
		
		private function mouseDownHandler(e:MouseEvent):void 
		{
			if (canBePlaced)
			{
				placed = true;
			}
		}
		
		private function rangeEnterFrame(e:Event):void 
		{
			if (!placed)
			{
				rangeMc.x = stage.mouseX;
				rangeMc.y = stage.mouseY;
			}
		}
		
		private function baseEnterFrame(e:Event):void 
		{
			if (!placed)
			{
				e.target.x = stage.mouseX;
				e.target.y = stage.mouseY;
				rangeMc.alpha = 1;
				canBePlaced = true;
/*				if (cant_buildMc.hitTestPoint(e.target.x - e.target.width / 2, e.target.y - e.target.height / 2, true)  || cant_buildMc.hitTestPoint(e.target.x + e.target.width / 2, e.target.y + e.target.height / 2, true) || cant_buildMc.hitTestPoint(e.target.x + e.target.height / 2, e.target.y - e.target.width / 2) || cant_buildMc.hitTestPoint(e.target.x - e.target.width / 2, e.target.y + e.target.height / 2,true))
				{
					rangeMc.alpha = 0;
					canBePlaced = false;
				}*/
				if (HitTest.complexHitTestObject(baseMc, cant_buildMc))
				{
					rangeMc.alpha = 0;
					canBePlaced = false;
				}
			}
			
		}
		
		private function onEnterFrame(e:Event):void
		{
			if (monstersPlaced < delay)
			{
				newMonster++;
			}
			
			if (newMonster == delay)
			{
				monstersPlaced++;
				newMonster = 0;
				var min:minion = new minion();
				min.x = 40;
				min.y = -20;
				min.pointToReach = 0;
				min.speed = 1;
				min.addEventListener(Event.ENTER_FRAME, minEnterFrame);
				addChild(min);
			}
		}
		
		private function minEnterFrame(e:Event):void 
		{
			var distX = wayPointX[e.target.pointToReach] - e.target.x;
			var distY = wayPointY[e.target.pointToReach] - e.target.y;
			if ((Math.abs(distX) + Math.abs(distY)) < 1)
			{
				e.target.pointToReach++;
			}
			
			var angle = Math.atan2(distY, distX);
			e.target.x = e.target.x + e.target.speed * Math.cos(angle);
			e.target.y = e.target.y +e.target.speed * Math.sin(angle);
			
			e.target.rotation = angle / Math.PI * 180 - 90;
			
			if (placed)
			{
				var point:Point = new Point(baseMc.x - e.target.x, baseMc.y - e.target.y);
				var distance:Number = Math.sqrt(point.x * point.x + point.y * point.y);
				if (distance <= baseRange/2 && !firing)
				{
					firing = true;
					var bulletMc:bullet = new bullet();
					bulletMc.x = baseMc.x;
					bulletMc.y = baseMc.y;
					bulletMc.dir = Math.atan2(point.y, point.x);
					stage.addChild(bulletMc);
					bulletMc.addEventListener(Event.ENTER_FRAME, bulletMcEnterFrame);
					//if (bulletMc.hitTestPoint(e.target.x, e.target.y, true))
					//if (HitTest.complexHitTestObject(bulletMc, MovieClip(e.target)))
					if(bulletMc.hitTestObject(MovieClip(e.target)))
					{
						trace(true);
						bulletMc.parent.removeChild(bulletMc);
						firing = false;
						e.target.parent.removeChild(e.target);
						
					}
				}
			}
			
			
			
		}
		
		private function bulletMcEnterFrame(e:Event):void 
		{
/*			e.target.x = stage.mouseX;
			e.target.y = stage.mouseY;*/
			
			e.target.x -= 5 * Math.cos(e.target.dir);
			e.target.y -= 5 * Math.sin(e.target.dir);
			
			if (e.target.x < 0 || e.target.y < 0 || e.target.x > stage.stageWidth || e.target.y > stage.stageHeight)
			{
				e.target.removeEventListener(Event.ENTER_FRAME, bulletMcEnterFrame);
				e.target.parent.removeChild(e.target);
				firing = false;
			}
		}
		
		
		
	}
	
}