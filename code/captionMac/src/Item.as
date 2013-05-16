package
{
	import org.flixel.FlxSprite;
	import flash.utils.getTimer;
	public class Item extends FlxSprite
	{
		[Embed(source = '../img/item/robotitem.png')] public   var robotitemPNG:Class;
     	private var ey:Number
		public var type:int
		public var canpick:Boolean=false
	    public var lifespan:Number=10000
		public var expiresTime:uint;
		public function Item(X:Number,Y:Number,endY:Number,Type:int)
		{
			super(X,Y)
			x=X
			y=Y	
            type=Type 
			ey=endY	
			this.acceleration.y=420
			if(type==0){
			loadGraphic(robotitemPNG)
			}
			else if(type==1){
				//loadGraphic(Registry.hjt)
			}
			else if(type==2)
			{
				//loadGraphic(Registry.watergunpng)
			}
			else if(type==3)
			{
			//	loadGraphic(Registry.supergunpng)
			}
			else if(type==4)
			{
			//	loadGraphic(Registry.humerpng)
			}
			if (lifespan > 0)
			{
				//	lifespan =lifespan + FlxMath.rand( -weapon.rndFactorLifeSpan, weapon.rndFactorLifeSpan);
				expiresTime = getTimer() + lifespan;
			}	
		}
	
		public function resetItem():void
		{
			x=Math.random()*600
			y=-100
			ey=Math.random()*400+200
			this.flicker(0)	
			this.acceleration.y=420
			this.velocity.y=0
			if (lifespan > 0)
			{
			//	lifespan =lifespan + FlxMath.rand( -weapon.rndFactorLifeSpan, weapon.rndFactorLifeSpan);
				expiresTime = getTimer() + lifespan;
			}
			exists=true
		}
		
		override public function update():void
		{
			if (lifespan > 0 && getTimer() > expiresTime)
			{
				kill();
			}
			else if(lifespan > 0 &&  expiresTime-getTimer() < 3000)
			{
					this.flicker(4)
					}
			if(y>=ey){
				this.acceleration.y=0
			    this.velocity.y=0
				canpick=true
			}
			
		super.update()
		}
	
	
	}
}