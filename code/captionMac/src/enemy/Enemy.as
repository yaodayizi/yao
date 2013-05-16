package enemy
{
	import objects.GameObject;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxVelocity;

	public class Enemy extends GameObject
	{
		[Embed(source = '../img/icons/shade.png')] public   var shadepng:Class;
		public var shades:FlxSprite
		
		public function Enemy()
		{
		shades=new FlxSprite(x,y)
		shades.loadGraphic(shadepng)	
		shades.exists=false
		Registry.deadobjects.add(shades)	
		}
		public function isinterrupt():Boolean
		{
			return true
		}
		
		public function setDamageState(value:String,damage:Number):void
		{
			if(shades!=null && value==Actions.DROPDOWN_FACE)
			{
				shades.exists=true
			}
		}
	
	public override function update():void
	{

		if(shades!=null && health>0  )
		{
			if(this.acceleration.y!=0){
				shades.x=x
				shades.y=starty+height	
				shades.exists=true
			}
				else{
					shades.exists=false
				}
		}
		
		if(y<upy && this.acceleration.y==0)
		{
			y=upy
		}
		else if(y>downy && this.acceleration.y==0)
		{
			y=downy
		}
		if(this.health<=0)
		{
//			shades.destroy()
//			shades=null
			shades.exists=false
			Registry.killcount--
				Registry.score+=100
		}
	super.update()
	}
		
	public override  function destroy():void
	{
		shades.destroy()
		super.destroy()
	}
	
	}
}