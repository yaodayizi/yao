package test 
{
	import adobe.utils.CustomActions;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Test1 extends Sprite
	{
		private var minionMc:minion;
		private var bulletMc:bullet;
		private var enemy:minion;
		private var speed:Number = 2;
		public function Test1() 
		{
			
			minionMc = new minion();
			addChild(minionMc);
			minionMc.x = 50;
			minionMc.y = 50;
			stage.addEventListener(MouseEvent.CLICK, mouseclickHandler);
			enemy = new minion();
			addChild(enemy);
			enemy.x = stage.stageWidth * Math.random();
			enemy.y = stage.stageHeight * Math.random();
			
		}
		
		private function mouseclickHandler(e:MouseEvent):void 
		{
			var distX:Number = e.stageX - minionMc.x;
			var distY:Number = e.stageY - minionMc.y;
			var angle:Number = Math.atan2(distY, distX);
			minionMc.rotation = angle / Math.PI * 180 - 90;
			minionMc.x +=  speed*Math.cos(angle);
			minionMc.y += speed * Math.sin(angle);
			bulletMc = new bullet();
			bulletMc.x = minionMc.x;
			bulletMc.y = minionMc.y;
			bulletMc.dir = angle;
			addChild(bulletMc);
			bulletMc.addEventListener(Event.ENTER_FRAME, bulletEnterFrame);
			
		}
		
		private function bulletEnterFrame(e:Event):void 
		{
			var mc:MovieClip = MovieClip(e.target);
			mc.x += speed * Math.cos(mc.dir);
			mc.y += speed * Math.sin(mc.dir);
			if (mc.x < 0 || mc.y < 0 || mc.x > stage.stageWidth || mc.y > stage.stageHeight)
			{
				mc.removeEventListener(Event.ENTER_FRAME, bulletEnterFrame);
				mc.parent.removeChild(mc);
			}
			if (HitTest.complexHitTestObject(mc, enemy))
			{
				mc.removeEventListener(Event.ENTER_FRAME, bulletEnterFrame);
				mc.parent.removeChild(mc);
			}
			
			
		}
		
		
		
	}

}