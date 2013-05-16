package
{
	import objects.GameObject;

	public class Food extends GameObject
	{
		[Embed(source = '../img/item/1.png')] public   var f1PNG:Class;
		[Embed(source = '../img/item/2.png')] public   var f2PNG:Class;
		[Embed(source = '../img/item/3.png')] public   var f3PNG:Class;
		[Embed(source = '../img/item/4.png')] public   var f4PNG:Class;
		[Embed(source = '../img/item/5.png')] public   var f5PNG:Class;
		[Embed(source = '../img/item/6.png')] public   var f6PNG:Class;
		[Embed(source = '../img/item/7.png')] public   var f7PNG:Class;
		[Embed(source = '../img/item/8.png')] public   var f8PNG:Class;
		[Embed(source = '../img/item/9.png')] public   var f9PNG:Class;
		[Embed(source = '../img/item/10.png')] public   var f10PNG:Class;
		[Embed(source = '../img/item/11.png')] public   var f11PNG:Class;
		[Embed(source = '../img/item/12.png')] public   var f12PNG:Class;
	//	1 5 9 11
	//	2 3 7 8
	//	4  6 10 12
		public function Food(X:Number,Y:Number)
		{
			reset(X,Y)
		
		}
	public override function reset(X:Number, Y:Number):void
	{
		x=X
		y=Y
		var rand:int=1+Math.random()*12
		type=rand	
		if(rand==1)
			{
				this.loadGraphic(f1PNG)
			}
			else if(rand==2)
			{
				this.loadGraphic(f2PNG)
			}
			else if(rand==3)
			{
				this.loadGraphic(f3PNG)
			}
			else if(rand==4)
			{
				this.loadGraphic(f4PNG)
			}
			else if(rand==5)
			{
				this.loadGraphic(f5PNG)
			}
			else if(rand==6)
			{
				this.loadGraphic(f6PNG)
			}
			else if(rand==7)
			{
				this.loadGraphic(f7PNG)
			}
			else if(rand==8)
			{
				this.loadGraphic(f8PNG)
			}
			else if(rand==9)
			{
				this.loadGraphic(f9PNG)
			}
			else if(rand==10)
			{
				this.loadGraphic(f10PNG)
			}
			else if(rand==11)
			{
				this.loadGraphic(f11PNG)
			}
			else if(rand==12)
			{
				this.loadGraphic(f12PNG)
			}
			super.reset(X,Y)
	}
	
	public function getLife():int
	{
		if(type==1 || type==5 || type==9 || type==11)
		{
	  return 100		
		}
		else if(type==2 || type==3 || type==7 || type==8)
		{
			return 150
		}
		else
		{
			return 300
		}
			
	}
	
	}
}