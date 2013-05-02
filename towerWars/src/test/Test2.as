package test 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Test2 extends Sprite
	{
		private var baseMc:base;
		private var canBuildMc:cant_build;
		private var rangeMc:range;
		public function Test2() 
		{
			baseMc = new base();
			canBuildMc = new cant_build();
			rangeMc = new range();
			addChild(canBuildMc);
			addChild(baseMc);
			
			baseMc.addEventListener(Event.ENTER_FRAME, baseEnterFrameHandler);
		}
		
		private function baseEnterFrameHandler(e:Event):void 
		{
			baseMc.x = stage.mouseX;
			baseMc.y = stage.mouseY;
			if (baseMc.hitTestObject(canBuildMc))
			{
				trace(true);
			}
		}
		
	
		
	}

}