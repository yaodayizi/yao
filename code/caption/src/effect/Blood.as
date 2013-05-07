package effect
{
	import org.flixel.FlxSprite;
	
	public class Blood extends FlxSprite
	{
		[Embed(source = '../img/icons/bloodflower.png')] public   var bfpng:Class;
		public function Blood()
		{
			loadGraphic(bfpng, true, true, 80, 34, false)
			addAnimation("flower", [0,1,2,3,4], 8, false);
			//play("flower")
		exists=false
		}
		public function fire(bx:int, by:int):void
		{
			x = bx;
			y = by;
			//velocity.y = -speed;
			exists = true;
			play("flower")
		}
		
		override public function update():void
		{
			super.update();
			
			//	Bullet off the top of the screen?
			if (exists && finished)
			{
				exists = false;
			}
		}
	}
}