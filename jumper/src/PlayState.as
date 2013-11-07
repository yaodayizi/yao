package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	import org.flixel.FlxTilemap;
	
	/**
	 * ...
	 * @author yaoyi
	 */

	public class PlayState extends FlxState 
	{
		[Embed(source="../levels/mapCSV_Group1_Map1.csv", mimeType="application/octet-stream")]
		public var levelMap:Class;
		
		[Embed(source="../assets/wall2.png")]
		public var levelTiles:Class;
		public var map:FlxTilemap = new FlxTilemap();
		public var player:Player;
		override public function create():void
		{
			//add(new FlxText(0, 0, 100, "Hello,World!"));
			add(map.loadMap(new levelMap, levelTiles, 16, 16));
			add(player = new Player(20,20));
			super.create();
		}
		
		override public  function update():void
		{
			super.update();
			FlxG.collide(player, map);
		}
	}

}