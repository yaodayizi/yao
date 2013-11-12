package com.chipacabra.Jumper 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author David Bell
	 */
	public class Enemy extends FlxSprite 
	{
		[Embed(source = '../../../../art/monsta.png')]public var Skelmonsta:Class;
		
		protected static const RUN_SPEED:int = 60;
		protected static const GRAVITY:int =0;
		protected static const JUMP_SPEED:int = 60;
		
		protected var _player:Player;
		
		public function Enemy(X:Number, Y:Number, ThePlayer:Player) 
		{
			super(X, Y);
						
			loadGraphic(Skelmonsta, true, true);  //Set up the graphics
			addAnimation("walking", [0, 1], 10, true);
			addAnimation("idle", [0]);
			_player = ThePlayer;
			
			drag.x = RUN_SPEED * 7;
			drag.y = JUMP_SPEED * 7;
			acceleration.y = GRAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
		}
		
		public override function update():void
		{
			acceleration.x = acceleration.y = 0; // Coast to 0 when not chasing the player
			
			var xdistance:Number = _player.x - x; // distance on x axis to player
			var ydistance:Number = _player.y - y; // distance on y axis to player
			var distancesquared:Number = xdistance * xdistance + ydistance * ydistance; // absolute distance to player (squared, because there's no need to spend cycles calculating the square root)
			if (distancesquared < 65000) // that's somewhere around 16 tiles
			{
				if (_player.x < x)
				{
					facing = RIGHT; // The sprite is facing the opposite direction than flixel is expecting, so hack it into the right direction
					acceleration.x = -drag.x;
				}
				else if (_player.x > x)
				{
					facing = LEFT;
					acceleration.x = drag.x;
				}
				if (_player.y < y) { acceleration.y = -drag.y; }
				else if (_player.y > y) { acceleration.y = drag.y;}
			}
			//Animation

			if (!velocity.x && !velocity.y) { play("idle"); }
			else {play("walking");}
			
			super.update();
		}
	
	}

}