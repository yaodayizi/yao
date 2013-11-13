package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Enemy extends FlxSprite 
	{
		[Embed(source = "../assets/monsta.png")]
		public var monsta:Class;
		protected static const RUN_SPEED:int = 80;
		protected static const GRAAVITY:int = 420;
		protected static const JUMP_SPEED:int = 250;
		protected var _player:Player;

		public function Enemy(thePlayer:Player,X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(monsta, true, true);
			addAnimation("walking", [0, 1], 10, true);
			addAnimation("idle", [0]);
			_player = thePlayer;
			
			drag.x = RUN_SPEED * 7;
			drag.y = JUMP_SPEED * 7;
			acceleration.y = GRAAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
		}
		
		public override function update():void
		{
			acceleration.x = 0;
			var xDistance:Number = _player.x - x;
			var yDistance:Number = _player.y -y;
			var distanceSquared:Number = xDistance * xDistance + yDistance * yDistance;
			if (distanceSquared < 65000)
			{
				if (_player.x < x)
				{
					facing = RIGHT;
					acceleration.x = -drag.x;
					
				}
				else if (_player.x > x)
				{
					facing = LEFT;
					acceleration.x = drag.x;
				}
				
				FlxG.watch(_player, "y", "playerY");
				FlxG.watch(this, "y", "enemyY");
				if (_player.y < y)
				{
					acceleration.y = -drag.y;
				}
				if (_player.y > y)
				{
					acceleration.y = drag.y;
				}
				
				if (!velocity.x && !velocity.y)
				{
					play("idle");
				}
				else
				{
					play("walking");
				}
				
				super.update();
			}
		}
		
	}

}