package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	
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
			rangeMc.width = baseRange;
			rangeMc.height = baseRange;
			baseMc.addEventListener(Event.ENTER_FRAME, enterFrameHandler);
			
			
			//addChild(pathMc);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function enterFrameHandler(e:Event):void 
		{
			if (!placed)
			{
				e.target.x = stage.mouseX;
				e.target.y = stage.mouseY;
				rangeMc.alpha = 100;
				canBePlaced = true;
				if(cant_buildMc.hitTestPoint(
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
			
			e.target.rotation = angle / Math.PI * 180-90;
		}
		
	}
	
}