package test 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Test2 extends Sprite
	{
		private var baseMc:base;
		private var canBuildMc:cant_build;
		private var rangeMc:range;
		private var txt:TextField;
		public function Test2() 
		{
			baseMc = new base();
			canBuildMc = new cant_build();
			rangeMc = new range();
			addChild(canBuildMc);
			addChild(baseMc);
			txt = new TextField();
			txt.text ="false";
			addChild(txt);
			baseMc.addEventListener(Event.ENTER_FRAME, baseEnterFrameHandler);
		}
		
		private function baseEnterFrameHandler(e:Event):void 
		{
			baseMc.x = stage.mouseX;
			baseMc.y = stage.mouseY;
			if (canBuildMc.hitTestPoint(baseMc.x - baseMc.width/2,baseMc.y - baseMc.height,true) || 
				canBuildMc.hitTestPoint(baseMc.x+baseMc.width/2,baseMc.y-baseMc.height,true) ||
				canBuildMc.hitTestPoint(baseMc.x -baseMc.width/2,baseMc.y+baseMc.width/2,true) ||
				canBuildMc.hitTestPoint(baseMc.x+baseMc.width/2,baseMc.x+baseMc.width/2,true))
			{
				txt.text = "true";
			}
			else
			{
				txt.text = "false";
			}
		}
		
	
		
	}

}