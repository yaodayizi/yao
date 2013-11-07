package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Player extends FlxSprite 
	{
		[Embed(source = "../assets/helmutguy.png")]
		public var Helmutguy:Class;
		protected static const RUN_SPEED:int = 80;
		protected static const GRAAVITY:int = 420;
		protected static const JUMP_SPEED:int = 200;
		public function Player(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y, SimpleGraphic);
			loadGraphic(Helmutguy, true, true);
			addAnimation("walking", [1, 2], 12, true);
			addAnimation("idle", [0]);
			drag.x = RUN_SPEED * 8;
			acceleration.y = GRAAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = RUN_SPEED;
			
		}
		
		public override function update():void
		{
			super.update();
			acceleration.x = 0;
			if (FlxG.keys.LEFT)
			{
				facing = LEFT;
				acceleration.x = -drag.x;
			}
			else if (FlxG.keys.RIGHT)
			{
				facing = RIGHT;
				acceleration.x = drag.x;
			}
			
			if (FlxG.keys.justPressed("UP") && !velocity.y)
			{
				velocity.y = -JUMP_SPEED*15;
			}
			
			if (velocity.x > 0 || velocity.x < 0) 
			{
				play("walking");
			}
			else if (!velocity.x)
			{
				play("idle");
			}
			
		}
		
	}

}