package com.chipacabra.Jumper
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author David Bell
	 **/
	public class Player extends FlxSprite 
	{
		[Embed(source='../../../../art/helmutguy.png')]public var Helmutguy:Class;
		
		
		protected static const RUN_SPEED:int = 90;
		protected static const GRAVITY:int =420;
		protected static const JUMP_SPEED:int = 250;
		
		protected var gibs:FlxEmitter;
		
		public function Player(X:int,Y:int,Gibs:FlxEmitter):void // X,Y: Starting coordinates
		{
			super(X, Y);
			
			loadGraphic(Helmutguy, true, true);  //Set up the graphics
			addAnimation("walking", [1, 2], 12, true);
			addAnimation("idle", [0]);
			
			drag.x = RUN_SPEED * 8;
			acceleration.y = GRAVITY;
			maxVelocity.x = RUN_SPEED;
			maxVelocity.y = JUMP_SPEED;
			
			gibs = Gibs;
		}
		
		public override function update():void
		{
			
			acceleration.x = 0; //Reset to 0 when no button is pushed
			
			
			
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
			if(FlxG.keys.justPressed("UP") && !velocity.y)
			{
				velocity.y = -JUMP_SPEED;
			}
			//Animation
			if (velocity.x > 0 || velocity.x <0 ) { play("walking"); }
			else if (!velocity.x) { play("idle"); }
			
			super.update();
		}
		
		public override function kill():void
		{
			if (dead) { return; }
			//solid = false;
			super.kill();
			//exists = false;
			//visible = false;
			FlxG.quake.start(0.005, .35);
			FlxG.flash.start(0xffDB3624, .35);
			if (gibs != null)
			{
				gibs.at(this);
				gibs.start(true, 2.80);
			}
		}
	}
	
}