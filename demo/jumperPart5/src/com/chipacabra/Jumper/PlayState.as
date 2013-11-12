package com.chipacabra.Jumper
{
	import org.flixel.*;
 
	public class PlayState extends FlxState
	{
		[Embed(source = '../../../../levels/mapCSV_Group1_Map1.csv', mimeType = 'application/octet-stream')]public var levelMap:Class;
		[Embed(source = '../../../../levels/mapCSV_Group1_Map1back.csv', mimeType = 'application/octet-stream')]public var backgroundMap:Class;
		[Embed(source = '../../../../art/area02_level_tiles2.png')]public var levelTiles:Class;
		[Embed(source = '../../../../art/gibs.png')]public var imgGibs:Class;
		
		public var map:FlxTilemap = new FlxTilemap;
		public var background:FlxTilemap = new FlxTilemap;
		public var player:Player;
		public var skelmonsta:Enemy;
		
		protected var gibs:FlxEmitter;
		
		override public function create():void
		{


			// Set up the gibs
			gibs= new FlxEmitter();
			gibs.delay = 3;
			gibs.setXSpeed( -150, 150);
			gibs.setYSpeed( -200, 0);
			gibs.setRotation( -720, 720);
			gibs.createSprites(imgGibs, 50, 15, true, .5, 0.65);
			
			add(background.loadMap(new backgroundMap, levelTiles, 16, 16));
			background.scrollFactor.x = background.scrollFactor.y = .5;
			
			add(map.loadMap(new levelMap, levelTiles, 16, 16));
			
			add(player = new Player(1000, 640,gibs));
			FlxG.follow(player,1); // Attach the camera to the player. The number is 
			FlxG.followAdjust(0,0); // Adjust the camera speed with this
			FlxG.followBounds(0, 0, 1600, 800);
			
			add(skelmonsta = new Enemy(1260, 640,player));// I used DAME to find the coordinates I want.
			super.create();
			
			add(gibs);
		}
		
		override public function update():void 
		{
			super.update();
			player.collide(map);
			skelmonsta.collide(map);
			gibs.collide(map);
			//Check for impact!
			if (player.overlaps(skelmonsta))
			{
				player.kill();
			}
		}
	}
}