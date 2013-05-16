package  effect 
{
	import org.flixel.*;
	
	public class HitEffectManager extends FlxGroup
	{
		public function HitEffectManager() 
		{
			super();
			
		//	scrollFactor.x = 0;
		//	scrollFactor.y = 0;
			
			//	There are 40 player bullets in our pool
			for (var i:int = 0; i < 40; i++)
			{
				add(new Blood());
			}
		}
		
		public function fire(bx:int, by:int):void
		{
			//if (getFirstAvail())
			//{
				Blood(getFirstAvailable()).fire(bx, by);
			//}
			
		}
		
	}
	
}