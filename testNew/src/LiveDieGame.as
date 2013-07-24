package  
{
	import com.bit101.components.Label;
	import com.bit101.components.NumericStepper;
	import com.bit101.components.PushButton;
	import com.bit101.components.Text;
	import com.foed.Vector2D;
	import flash.display.Bitmap;
	import flash.display.InteractiveObject;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class LiveDieGame extends Sprite
	{
		private var mapWidth:uint = 48;
		private var mapHeight:uint = 48;
		private var chanceToStartAlive:Number = .45;
		private var deathLimit:uint = 3;
		private var birthLimit:uint = 4;
		private var tileSize:uint = 8;
		private var  numberOfSteps:uint = 1;
		private var bitmap:Bitmap;
		private var shape:Shape;
		private var map:Array;
		
		public function LiveDieGame() 
		{
			bitmap = new Bitmap();
			shape = new Shape();
			
			var lbMapWidth:Label = new Label(this, 0, 0, "mapWidth:");
			var TxMapWidth:Text = new Text(this, 60, 0, "48");
			TxMapWidth.setSize(30, 20);
			
			var lbMapHeight:Label = new Label(this, 90, 0, "mapWidth:");
			var TxMapHeight:Text = new Text(this, 150, 0, "48");
			TxMapHeight.setSize(30, 20);
			
			var lbChaceToStartAlive = new Label(this, 220, 0, "chanceToStartAlive:");
			var nsChaceToStartAlive:NumericStepper = new NumericStepper(this, 320, 0, function(e:Event) {
				numberOfSteps = nsChaceToStartAlive.value;
			});
			nsChaceToStartAlive.labelPrecision = 2;
			nsChaceToStartAlive.step = 0.01;
			nsChaceToStartAlive.value = chanceToStartAlive;
			
			var lbDeathLimit:Label = new Label(this, 0, 30, "DeathLimit:");
			var nsDeathLimit:NumericStepper = new NumericStepper(this, 60, 30, function(e:Event) {
				deathLimit = nsDeathLimit.value;
			});
			nsDeathLimit.value = deathLimit;
			
			var lbBirthLimit:Label = new Label(this, 160, 30, "BirthLimit:");
			var nsBirthLimit:NumericStepper = new NumericStepper(this, 220, 30, function(e:Event) {
				birthLimit = nsBirthLimit.value;
			});
			nsBirthLimit.value = birthLimit;
			
			var lbStep:Label = new Label(this, 320, 30, "Step:");
			var nsStep:NumericStepper = new NumericStepper(this, 360, 30);
			nsStep.value = numberOfSteps;
			
			var btNewWorld:PushButton = new PushButton(this, 0, 60, "New World", function() {
				newWorld();
			});
			
			var btStep:PushButton = new PushButton(this, 100, 60, "Step", function() {
				if (map == null)
					initMap();
				map = doSimulationStep(map);
				drawMap(map);
			});
			
			shape.y = 200;
			

			shape.graphics.lineStyle(0, 0x499300);
			shape.graphics.beginFill(0x499300);
			shape.graphics.drawRect(x * tileSize, y * tileSize, tileSize, tileSize);
			shape.graphics.endFill();
			
			addChild(shape);
			//var map:Array = generateMap();
			//drawMap(map);
		}
		
		
		public function newWorld():void
		{
			map = generateMap();
			drawMap(map);
		}
		
		
		public function reset():void
		{
			shape.graphics.clear();
		}
		
		public function initMap():Array
		{
			var map:Array = [[]];
			for (var i = 0; i < mapWidth; i++)
			{
				map[i] = [];
				for (var j = 0; j < mapHeight; j++)
				{
					if (Math.random() > chanceToStartAlive)	
						map[i][j] = true;
					else
						map[i][j] = false;
				}
			}
			
			return map;
		}
		
		public function countAliveNeighBours(map:Array, x:uint, y:uint):uint
		{
			var count:uint = 0;
			for (var i:int = -1; i < 2; i++)
			{
				for (var j:int = -1; j < 2; j++)
				{
					var neighBoursX:int = x + i;
					var neighBoursY:int = y +j;
					
					if (i == 0 && j == 0)
					{
						
					}
					else if (neighBoursX < 0 || neighBoursY < 0 || neighBoursX >= map.length || neighBoursY >= map[0].length)
					{
						count++;
					}
					else if (map[neighBoursX][neighBoursY])
					{
						count ++;
					}
				}
			}
			return count;
		}
		
		public function doSimulationStep(oldMap:Array):Array
		{
			var newMap:Array = [[]];
			for (var i = 0; i < oldMap.length; i++)
			{
				newMap[i] = [];
				for (var j = 0; j < oldMap[0].length; j++)
				{
					trace(i, j);
					var count:uint = countAliveNeighBours(oldMap, i, j);
					if (oldMap[i][j])
					{
						if (count < deathLimit)
						{
							newMap[i][j] = false;
						}
						else
						{
							newMap[i][j] = true;
						}
					}
					else
					{
						if (count > birthLimit)
						{
							newMap[i][j] = true;
						}
						else
						{
							newMap[i][j] = false;
						}
					}
					
				}
			}
			
			return newMap;
		}
		
		public function generateMap():Array
		{
			var cellMap = initMap();
			for (var i = 0; i < numberOfSteps; i++)
			{
				cellMap = doSimulationStep(cellMap);
			}
			
			return cellMap;
		}
		
		public function drawMap(map:Array):void
		{
			shape.graphics.clear();
			for (var x:uint = 0; x < map.length; x++)
			{
				for (var y:uint = 0; y < map[0].length; y++)
				{
					var color:uint = map[x][y] ? 0x499300 : 0x000000;
					shape.graphics.lineStyle(0, color);
					shape.graphics.beginFill(color);
					shape.graphics.drawRect(x * tileSize, y * tileSize, tileSize, tileSize);
					shape.graphics.endFill();
				}
			}
		}
		
		
	}

}