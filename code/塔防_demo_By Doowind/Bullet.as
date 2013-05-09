package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class Bullet extends MovieClip {
		private var tempx:Number;
		private var tempy:Number;
		public var speed:int = 10;
		public var hitTarget:Boolean = false;
		public var enable:Boolean = true;
		public function Bullet(x1:Number,y1:Number) {
			// constructor code
			tempx = x1;
			tempy = y1; 
			addEventListener(Event.ENTER_FRAME, onframe);
		}
		private function onframe(event:Event):void {
			//trace(Math.sin(Math.atan2(tempy, tempx)));
			this.y += speed*Math.sin(Math.atan2(tempy,tempx));
			this.x += speed*Math.cos(Math.atan2(tempy,tempx));
			if (Math.abs(this.x-tempx)<=5&&Math.abs(this.y-tempy)<=5) {   
				 removeEventListener(Event.ENTER_FRAME, onframe);
				 this.gotoAndStop("bao");
				 hitTarget = true;
				// enable = false;
				 //this.parent.removeChild(this);
		    }
			 
			}
		
	}
	
}


