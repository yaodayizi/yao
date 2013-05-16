package anim
{
	import flash.utils.getTimer;
	
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;

	public class SailorAnim extends FlxSprite
	{
		[Embed(source = '../img/animation/startvenu.png')] public   var startvenuspng:Class;		
		[Embed(source = '../img/animation/startmars.png')] public   var startmarspng:Class;
		[Embed(source = '../img/animation/startmercury.png')] public   var startmercurypng:Class;
		[Embed(source = '../img/animation/startjupiter.png')] public   var startjupiterpng:Class;
		[Embed(source = '../img/animation/startmoon.png')] public   var startmoonpng:Class;
		[Embed(source = '../img/animation/startpage.png')] public   var startpagepng:Class;
		public var count:int=0
		public var playanim:Boolean=true	
		public function SailorAnim()
		{
			setAnim()
			loadGraphic(startvenuspng,false,false)
			//this.addAnimationCallback(animchance)	
		}
		public function setAnim():void
		{
			x=-400
			y=0	
			this.velocity.x=240
			this.acceleration.x=-80
		}
		
		
	override public function update():void
	{

		
		if(playanim){
		if(count!=5 && this.velocity.x<=0)
		{
			this.acceleration.x=100
		}
		
		if(this.x>600)
		{
			count++
				if(count==1){
					
					loadGraphic(startmarspng,false,false)
					setAnim()
				}
				if(count==2){
					
					loadGraphic(startmercurypng,false,false)
					setAnim()
				}
				if(count==3){
					
					loadGraphic(startjupiterpng,false,false)
					setAnim()
				}
				if(count==4){
					
					loadGraphic(startmoonpng,false,false)
					setAnim()
				}
				if(count==5)
				{
					playanim=false
					x=20
					y=20
					velocity.x=0
					this.acceleration.x=0
					
					loadGraphic(startpagepng,false,false)
					
					//return;
					
				}
				
			
		}
		}
		
		super.update()
	}
	
	}
}