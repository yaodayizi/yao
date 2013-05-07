package
{
	import objects.GameObject;
	
	import org.flixel.FlxSprite;

	public class ItemBox extends GameObject
	{
		[Embed(source = '../img/item/box.png')] public   var boxPNG:Class;
		public function ItemBox(X:Number,Y:Number)
		{
			x=X
			y=Y	
			this.loadGraphic(boxPNG,true,true,50,90,false)
			this.addAnimation(Actions.IDLE,[0],0,false)	
			this.addAnimation("broken",[0,1,2,2,2],10,false)
		    this.play(Actions.IDLE)
		  this.currentstate=Actions.IDLE
		}
		public   function setDamageState(value:String,damage:Number):void
		{
			trace("predator damage")
			if(value==currentstate)
			{
				//trace("aaa ")
				return
			}
			var tmp:GameObject
			var rand:int=Math.random()*2
			//var rand:int=0	
			if(rand==0)  //生成武器
				{
				//tmp=new Weapon(x,y,50,2+Math.random()*4)	
				tmp=new Weapon(x,y,50,Math.random()*8)		
			}
			else
			{
				tmp=new Food(x,y)
				}
				
			Registry.gameobjects.add(tmp)
			this.currentstate=value	
		this.acceleration.y=-420
		this.velocity.x=300	
			play(currentstate)
		}
		public override function update():void
		{
			if(this.currentstate=="broken" && finished)
			{
				//this.destroy()
			this.exists=false
			}
			super.update()
		}
	
	
	}
}