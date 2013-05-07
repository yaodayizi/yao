package fensi
{
	import org.flixel.FlxEmitter;
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
//	import org.hamcrest.mxml.collection.Array;
//	import org.hamcrest.mxml.object.Null;

	public class Fensi extends FlxGroup
	{
//		[Embed(source = '../img/fensi/fs1.png')] public static  var moonfs1png:Class;
//		[Embed(source = '../img/fensi/fs2.png')] public static  var moonfs2png:Class;
		
		[Embed(source = '../img/sailor/mercurycut1.png')] public  static var mercuryfs1png:Class;
		[Embed(source = '../img/sailor/mercurycut2.png')] public  static var mercuryfs2png:Class;
		[Embed(source = '../img/sailor/mooncut1.png')] public  static var moonfs1png:Class;
		[Embed(source = '../img/sailor/mooncut2.png')] public static  var moonfs2png:Class;
		[Embed(source = '../img/sailor/marcut1.png')] public static  var marfs1png:Class;
		[Embed(source = '../img/sailor/marcut2.png')] public static  var marfs2png:Class;
		[Embed(source = '../img/sailor/jupitercut1.png')] public static  var jupiterfs1png:Class;
		[Embed(source = '../img/sailor/jupitercut2.png')] public static  var jupiterfs2png:Class;
		[Embed(source = '../img/sailor/venucut1.png')] public static  var venufs1png:Class;
		[Embed(source = '../img/sailor/venucut2.png')] public static  var venufs2png:Class;
		[Embed(source = '../img/sailor/dianvcut1.png')] public static  var dianvcut1png:Class;
		[Embed(source = '../img/icons/emiblood1.png')] public static  var blood1png:Class;
		
//		[Embed(source = '../img/fensi/venufs1.png')] public static  var venufs1png:Class;
//		[Embed(source = '../img/fensi/venufs2.png')] public static  var venufs2png:Class;
		private var startx:Number
		public var starty:Number
		private var face:uint
		private var pixels:FlxGroup;
		public var body1:FlxSprite=null 
		public var body2:FlxSprite=null
		public var body3:FlxSprite=null 
		private var stop:Boolean=false	
		public var type:int	
		//private var tempPixel:FlxEmitter
		public function Fensi(startX:Number,startY:Number,Face:uint)
		{
		super()
		
		startx=startX
		starty=startY
		face=Face	
		
		   createBloodFx()

		}
		
		public function setBody1(img:Class,isanim:Boolean=false,rates:Number=0,frames:Array=null,Width:uint=0,Height:uint=0):void
	    {
		    body1=new FlxSprite(startx,starty)
			if(!isanim){
				body1.loadGraphic(img,false,true)
			}
			else
			{
				body1.loadGraphic(img, true, true, Width, Height, false)
				body1.addAnimation("play", frames, rates, false);
				//body1.addAnimation("idle", [5,4,3,2], 5, false);
				body1.addAnimation("idle", [3,2,1,0], 5, false);
				body1.play("play")
			}
			body1.facing=face	
			body1.velocity.y=-250
			body1.acceleration.y=420
			//body1.angle=-90
			
			
			if(face==FlxObject.LEFT){
				body1.velocity.x=100
			}
			else{
				body1.velocity.x=-100
			}   
		add(body1)
		}
		
		public function setBody2(img:Class,isanim:Boolean=false,rates:Number=0,frames:Array=null,Width:uint=0,Height:uint=0):void
		{
			body2=new FlxSprite(startx,starty)
			if(!isanim){
				body2.loadGraphic(img,false,true)
			}
			else
			{
				body2.loadGraphic(img, true, true, Width, Height, false)
				body2.addAnimation("play", frames, rates, false);
				
				body2.play("play")
			}
			body2.facing=face	
			body2.velocity.y=-200
			body2.acceleration.y=420
			//body2.angle=-90
			
			
			if(face==FlxObject.LEFT){
				body2.velocity.x=50
			}
			else{
				body2.velocity.x=-50
			}   
			add(body2)
		}
		
		
		
		private function createBloodFx():void
		{
			var tempPixel:FlxEmitter = new FlxEmitter(startx,starty);
		
			tempPixel.gravity = 100;
			tempPixel.setXSpeed(-100, 100);
			tempPixel.setYSpeed( -100, -120);
			tempPixel.setRotation(0, 0);	// VITAL!!!
			tempPixel.makeParticles(blood1png, 5, 0, true, 0);
			add(tempPixel);
			tempPixel.start(true,0.8);
		}
		
		

	   override public function update():void
	   {
		   if(stop)return; 
		  if(body1!=null &&body1.y>starty+1)
		  {
			 
			 if(body1.velocity.y>300){
				 body1.velocity.y= -body1.velocity.y+80
					 body1.play("idle")
			 } 
			 else{
			  body1.acceleration.y=0
			  body1.velocity.x=0
			  body1.velocity.y=0
			  stop=true
			 }
		  }
		  
		  if(body2!=null &&body2.y>starty+50)
		  {
			  body2.acceleration.y=0
			  body2.velocity.x=0
			  body2.velocity.y=0
			  //body2.angle=-90
		  }
		 
		  if(body3!=null &&body3.y>starty+50)
		  {
			  
		  }
		 // trace("fuck ddf")
		  
		  super.update()
	   }
	
	
	}
}