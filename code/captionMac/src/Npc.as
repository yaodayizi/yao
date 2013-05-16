package
{
	import org.flixel.FlxSprite;

	public class Npc extends FlxSprite
	{
		[Embed(source = '../img/npc/amiavp.png')] public   var amiavppng:Class;
		[Embed(source = '../img/npc/smn1.png')] public   var sm1png:Class;
		private var type:int
		public function Npc(Type:Number)
		{
			type=Type
				if(type==0){
			this.loadGraphic(amiavppng,true,true,130,130,false)
			this.addAnimation("p",[0,1,2,3],8,true)	
		play("p")
				}
				else if(type==1){
					this.loadGraphic(sm1png,true,true,250,250,false)
					this.addAnimation("p",[0,1,2,3],8,true)	
					play("p")
				}
		
		}
	}
}