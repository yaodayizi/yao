package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	public class Jumper extends FlxGame 
	{
		
		public function Jumper():void 
		{
			super(320, 240, PlayState, 2);

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