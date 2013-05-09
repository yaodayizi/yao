package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Enemy extends MovieClip {
		public var derection:int = 0;
		public var speed:Number = 2;
		public var blood:Number = 10;
		public var value:Number = 1;
		public function Enemy(index:int) {
			
			// constructor code
			
			init(index);
		}
		private function init(a:int):void {
			if (a == 1)
			gotoAndStop("state1");
			else 
			gotoAndStop("state" +( int(a/2)+1));
			this.life.gotoAndStop("full");
			}
		public function move(dere:int):void {
			derection = dere;
			addEventListener(Event.ENTER_FRAME, onmove);
		}
		private	function onmove(event:Event):void {
				switch(derection) {
					  case 0:
						  this.x += speed;break;
					  case 1:
						  this.y += speed;break;
					  case 2:
						  this.x -= speed;break;
					  case 3:
						  this.y -= speed;break;
					  }
				
			}
		public function turnDown():void {
			stopMoving();
			move(1);
			}
		public function turnLeft():void {
			stopMoving();
			move(2);
			}
		public function turnUp():void {
			stopMoving();
			move(3);
			}
		public function turnRight():void {
			stopMoving();
			move(0);
			}
		public function stopMoving():void {
			removeEventListener(Event.ENTER_FRAME, onmove);
			}
		public function wasShoot(num:Number):void {
			blood -= num;
		//	trace("blooooo" + blood);
			}
		public function clear():void {
			stopMoving();
			//this.gotoAndStop("bao");
			//this.parent.removeChild(this);
			}
	
	}
	
}
