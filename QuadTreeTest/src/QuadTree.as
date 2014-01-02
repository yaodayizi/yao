package  
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class QuadTree 
	{
		private var maxObjects:uint = 10;
		private var maxLevels:uint = 5;
		
		private var level:uint = 0;
		private var objects:Array=[];
		private var nodes:Array = [];
		private var bounds:Rectangle;
		public function QuadTree(pLevel:uint,pBounds:Rectangle) 
		{
			level = pLevel;
			bounds = pBounds;
			nodes = [];
		}
		
		public function clear():void
		{
			objects = [];
			for (var i = 0; i < nodes.length; i++)
			{
				if (nodes[i])
				{
					nodes[i].clear();
					nodes[i] = [];
				}
			}
		}
		
		/*
		 * 拆分
		 * 象限顺序
		 * *--------
		 * | 1 | 0 |
		 * |___|___|
		 * | 2 | 3 |
		 * |___|___|
		 * 
		 */
		private function split():void
		{
			var subWidth:Number = bounds.width / 2;
			var subHeight:Number = bounds.height / 2;
			var newlevel = level +1;
			nodes[0] = new QuadTree(newlevel, new Rectangle(bounds.x + subWidth, bounds.y, subWidth, subHeight));
			nodes[1] = new QuadTree(newlevel, new Rectangle(bounds.x, bounds.y, subWidth, subHeight));
			nodes[2] = new QuadTree(newlevel, new Rectangle(bounds.x, bounds.y + subHeight, subWidth));
			nodes[3] = new QuadTree(newlevel, new Rectangle(bounds.x +subWidth, bounds.y +subHeight, subWidth, subHeight));
			
			
		}
		
		private function getIndex(pRect:Rectangle):int
		{
			var index:int = -1;
			var verticalMidpoint = bounds.x +bounds.width / 2;
			var horizontalMidpoint = bounds.y + bounds.height / 2;
			
			var topQuadrant = pRect.y < horizontalMidpoint && pRect.y + pRect.height < horizontalMidpoint;
			var bottomQuadran = pRect.y > horizontalMidpoint;
			
			if (pRect.x < verticalMidpoint && pRect.x + pRect.width < verticalMidpoint)
			{
				if (topQuadrant)
				{
					index = 1;
				}
				else if (bottomQuadran)
				{
					index = 2;
				}
			}
			else if (pRect.x > verticalMidpoint)
			{
				if (topQuadrant)
				{
					index = 0;
				}
				else if (bottomQuadran)
				{
					index = 3;
				}
			}
			return index;
		}
		
		public function insert(pRect:Rectangle):void
		{
			if (nodes[0] != null)
			{
				var index:int = getIndex(pRect);
				if (index != -1)
				{
					QuadTree(nodes[index]).insert(pRect);
					return;
				}
			}
			
			objects.push(pRect);
			
			if (objects.length > maxObjects && level < maxLevels)
			{
				split();

				var i:uint = 0;
				//var len:int = objects.length;
				while (i < objects.length)
				{
					var index:int = getIndex(objects[i]);
					if (index != -1)
					{
						
						QuadTree(nodes[index]).insert(objects[i]);
						objects.splice(i, 1);
					}
					else
					{
						i++;
					}
				}
			}
		}
		
		public function retrieve( pRect:Rectangle):Array
		{
			var index = getIndex(pRect);
			if (index != -1 && nodes[0] != null)
			{
				nodes[index].retriveve( pRect);
			}
			
			return objects;
		}
		
		
		
	}

}