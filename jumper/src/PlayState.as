package  
{
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
		
		
		public var map:FlxTilemap = new FlxTilemap();
		public var player:Player;
		override public function create():void
		{
			//add(new FlxText(0, 0, 100, "Hello,World!"));
			//map.allowCollisions = FlxObject.UP;
			add(map.loadMap(new levelMap, levelTiles, 16, 16));
			add(player = new Player(5, 670));
			
			FlxG.camera.follow(player, 1);
			FlxG.camera.setBounds(0, 0, 800, 800,true);
			super.create();
		}
		
		override public  function update():void
		{
			FlxG.watch(player.acceleration, "x", "x");
			FlxG.watch(player.acceleration, "y", "y");
			FlxG.watch(player.velocity, "y", "y");
			FlxG.watch(player.velocity, "y", "y");
			super.update();
			FlxG.collide(player, map);
		}
	}

}