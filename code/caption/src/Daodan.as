package
{
	import org.flixel.FlxSprite;

	public class Daodan extends FlxSprite
	{
		[Embed(source = '../img/weapon/bu1.png')] public   var bu1png:Class;
		private var startY:Number
		public function Daodan(X:Number,Y:Number,ky:Number,vy:Number)
		{
			x=X
			y=Y
			startY=ky
			velocity.y=vy	
			loadGraphic(bu1png,true,false,12,40,false)
			addAnimation("daodan",[0,1],5,true)
			play("daodan")
			exists=false
		}
		public function fire(X:Number,Y:Number,ky:Number,vy:Number):void
		{
			x=X
			y=Y
			startY=ky
			velocity.y=vy	
			exists=true
		}
		override public function update():void{
			
			//if()
			if(exists && y>=startY)
			{
			
			var tmpex:Expolre=new Expolre(x,y,4)
			//X:Number,Y:Number,type:int=0,face:uint=FlxObject.RIGHT)
			Registry.fxgroup.add(tmpex)
			exists=false
			}
			super.update()
		}
		
	}
}