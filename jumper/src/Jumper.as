package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	[SWF(width = "320", height = "240", backgroundColor = "#000000")]
	public class Jumper extends FlxGame 
	{
		
		public function Jumper():void 
		{
			super(320, 240, PlayState, 1);
			forceDebugger = true;
/*			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);*/
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
		}
		
	}
	
}