package  {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	
	public class Gun extends MovieClip {
		public var wasSold:Boolean;
		public var tempx:Number;
	    public var tempy:Number;
	    public var fireTimer:Timer;
		public var bulletArr:Array = new Array(10);
		public var shootOk:Boolean = false;
		public var target:Enemy = null;
		public var power:Number;
		public var distance:Number;
		public var value:int;
	  	public function Gun(index:int) {
			// constructor code
			if(index == 1)
			this.gotoAndStop("cannon");
			else if (index == 2)
			this.gotoAndStop("motar");
			init(index);
		}
		private function init(index:int):void {
			if (index == 1) {
				fireTimer = new Timer(500);
				power = 1;
				distance = 80;
				value  = 3;
				}
			else if (index == 2) {
				fireTimer = new Timer(1000);
				power = 5;
				distance = 110;
				value  = 12;
				}
			wasSold = false;
			for (var i:int = 0; i < 10; i++ )
			  bulletArr[i] = 0;
			addEventListener(Event.ENTER_FRAME, testHit);
			fireTimer.addEventListener(TimerEvent.TIMER, onfire);
			this.area.visible = false;
			this.body.addEventListener(MouseEvent.CLICK, onShowMenu);
			this.body.addEventListener(MouseEvent.MOUSE_OVER, onShowArea);
			this.body.addEventListener(MouseEvent.MOUSE_OUT, onDispearArea);
			
			}
		private function testHit(event:Event):void {
			for (var i:int = 0; i < 10; i++ )
			 if (bulletArr[i] != 0 && bulletArr[i].hitTarget == true) {
				 if(bulletArr[i].enable == true){
					   shootOk = true;
					   bulletArr[i].enable = false;
				   }
			    removeChild(bulletArr[i]);
			    bulletArr[i] = 0;
			  }
			}
		private function onfire(event:TimerEvent):void {
			fireTo();
			}
		private function onShowArea(event:MouseEvent):void {
			this.area.visible = true;
			}
		private function onShowMenu(event:MouseEvent):void {
			this.menu.play();
			//this.menu.update.upprice.text = String(this.value);
			//this.menu.sell.sellprice.text = String(this.value);
			}
		private function onDispearArea(event:MouseEvent):void {
			this.area.visible = false;
			}
		public function fireTo():void {
			
			for (var i:int = 0; i < 10; i++ )
			  if (bulletArr[i] == 0 ) {
				  var bullet:Bullet = new Bullet(tempx - this.x, tempy - this.y);
				  bulletArr[i] = bullet;
				  bulletArr[i].enable = true;
				  break;
				  }
			  
			this.addChild(bulletArr[i]);
			}
		public function inThisArea(enemy:Enemy):Boolean {
			//trace(this.x + "," + enemy.x + "here"+Math.abs(this.x - enemy.x)+","+Math.sqrt(int(Math.pow(int(Math.abs(this.x - enemy.x)), 2) + Math.pow(int(Math.abs(this.y - enemy.y)), 2))));
			//return false;
			if (Math.sqrt(Math.pow(int(Math.abs(this.x - enemy.x)), 2) + Math.pow(int(Math.abs(this.y - enemy.y)), 2)) <= distance)
			return true;
			else return false;
			
			}
	}
	
}
