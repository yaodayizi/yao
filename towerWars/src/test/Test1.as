package test 
{
	import adobe.utils.CustomActions;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Test1 extends Sprite
	{
		private var minionMc:minion;
		private var speed:Number = 2;
		public function Test1() 
		{
			
			minionMc = new minion();
			addChild(minionMc);
			minionMc.x = 50;
			minionMc.y = 50;
			stage.addEventListener(MouseEvent.CLICK, mouseclickHandler);
		}
		
		private function mouseclickHandler(e:MouseEvent):void 
		{
			var distX:Number = e.stageX - minionMc.x;
			var distY:Number = e.stageY - minionMc.y;
			var angle:Number = Math.atan2(distY, distX);
			minionMc.rotation = angle / Math.PI * 180 - 90;
			minionMc.x +=  speed*Math.cos(angle);
			minionMc.y += speed*Math.sin(angle);
		}
		
	}

}