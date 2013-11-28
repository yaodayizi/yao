package  
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author yaoyi
	 */

	public class PlayState extends FlxState 
	{
		[Embed(source="../levels/mapCSV_jumperG1_Map1.csv", mimeType="application/octet-stream")]
		public var levelMap:Class;
		
		//[Embed(source="../assets/wall2.png")]
		[Embed(source = "../assets/area02_level_tiles2.png")]
		public var levelTiles:Class;
		
		[Embed(source = "../assets/bg.jpg")]
		public var bgJpg:Class;
		
		[Embed(source="../levels/mapCSV_jumperG1_backgroundBottom.csv", mimeType="application/octet-stream")]
		public var backgroundBottomRes:Class;
		[Embed(source = "../levels/mapCSV_jumperG1_background.csv", mimeType = "application/octet-stream")]
		public var backgroundRes:Class;
		
		[Embed(source = "../levels/mapCSV_jumperG1_objectNocolli.csv", mimeType = "application/octet-stream")]
		public var mapObjNoCollideRes:Class;
		
		[Embed(source = "../assets/gibs.png")]
		public var gibsRes:Class;
		
		public var gibs:FlxEmitter;
		public var map:FlxTilemap = new FlxTilemap();
		public var backgroundMap:FlxTilemap = new FlxTilemap();
		public var backgroundMapBottom:FlxTilemap = new FlxTilemap();
		public var mapObjNoCollide:FlxTilemap = new FlxTilemap();
		public var selMonsta:Enemy;
		public var player:Player;
		override public function create():void
		{
			//add(new FlxText(0, 0, 100, "Hello,World!"));
			//map.allowCollisions = FlxObject.UP;
			add(backgroundMapBottom.loadMap(new backgroundBottomRes(), bgJpg, 400, 400));
			add(backgroundMap.loadMap(new backgroundRes(), levelTiles, 16, 16));
			add(map.loadMap(new levelMap, levelTiles, 16, 16));
			add(mapObjNoCollide.loadMap(new mapObjNoCollideRes(), levelTiles, 16, 16));
			
			backgroundMapBottom.scrollFactor.x = .2;
			backgroundMap.scrollFactor.x = backgroundMap.scrollFactor.y = .5;
			
			gibs = new FlxEmitter();
			gibs.setXSpeed( -150, 150);
			gibs.setYSpeed( -200, 0);
			gibs.setRotation( -720, -720);
			
			add(player = new Player(5, 670));
			add(selMonsta = new Enemy(player,271, 687));
			FlxG.camera.follow(player, 1);
			FlxG.camera.setBounds(0, 0, 800, 800,true);
			super.create();
		}
		
		override public  function update():void
		{
			FlxG.watch(player.acceleration, "x", "x");
			FlxG.watch(player.acceleration, "y", "y");
			FlxG.watch(player.velocity, "x", "velocityX");
			FlxG.watch(player.velocity, "y", "velocityY");
			super.update();
			FlxG.collide(player, map);
			FlxG.collide(selMonsta, map);
			if (player.overlaps(selMonsta))
			{
				player.kill();
			}
		}
	}

}