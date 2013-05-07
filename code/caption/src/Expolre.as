package
{
	import enemy.Enemy;
	import enemy.PrettySoldier;
	
	import objects.GameObject;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	
	import role.Ninja;

	public class Expolre extends FlxSprite
	{
		//[Embed(source = '../img/weapon/a1.png')] public   var bazookapng:Class;
		[Embed(source = '../img/expole/expolehjt.png')] public   var expolehjtpng:Class;
		[Embed(source = '../img/expole/expole2.png')] public   var expole2png:Class;
		[Embed(source = '../img/expole/fire1.png')] public   var fire1png:Class;
		[Embed(source = '../img/expole/baozha1.png')] public   var baozha1png:Class;
		private var types:int
		public function Expolre(X:Number,Y:Number,type:int=0,face:uint=FlxObject.RIGHT)
		{
	   x=X
	   y=Y	   
	   types=type
	  if(type==0){
	   loadGraphic(expolehjtpng, true, true, 300, 150, false)
       addAnimation("ex1",[0,1,2,3,4,5,6,7,8,9,10,11],10,false)
     play("ex1")
	 
	 //判断可爱的小mm在不在爆炸区域
	 for each(var m:GameObject in Registry.gameobjects.members)
	 {
		 if(m is Enemy){
		// var tmp:Soldier=mm.soldier
		  if(Math.abs(m.y-y)<100 && FlxVelocity.distanceBetween(m,this)<110)
		//	 if(FlxCollision.pixelPerfectCheck(this,m as FlxSprite))
		 {
			( m as Enemy).setDamageState(Actions.DROPDOWN_FACE,50)
		 }
		 }
	 }
	 
	 
	  }
	  else if(type==1){
		  loadGraphic(expolehjtpng, true, true, 300, 150, false)
		  addAnimation("ex1",[0,1,2,3,4,5,6,7,8,9,10,11],10,false)
		  play("ex1")
		  
		  if(Math.abs(Registry.player.y-y)<100 && FlxVelocity.distanceBetween(Registry.player,this)<110)
		  {
			  States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,20)
		  }
		  }
	  else if(type==2){
		  facing=face
			  if(facing==FlxObject.LEFT)
			  {
				  x-=100
			  }
		  loadGraphic(expole2png, true, true, 230, 100, false)
		  addAnimation("ex1",[0,0,1,1],10,false)
		  play("ex1")
		  
		  if(Math.abs(Registry.player.y-y)<50 && FlxVelocity.distanceBetween(Registry.player,this)<80)
		  {
			  States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,20)
		  }
	  }
	  else if(type==3){
		  facing=face

		  loadGraphic(fire1png, true, true, 125, 48, false)
		  addAnimation("fire1",[0,1,0,1,0,1,0,1,0,1],10,false)
		  play("fire1")
		   }
	  //---
	  else if(type==4){
		  facing=face
		  loadGraphic(baozha1png, true, true, 130, 110, false)
		  addAnimation("ex4",[11,10,9,8,7,6,5,4,3,2,1,0],10,false)
		  play("ex4")
		  if(Math.abs(Registry.player.y-y)<100 && FlxVelocity.distanceBetween(Registry.player,this)<110)
		  {
			  States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,30)
		  }
	  }
	  
	  else if(type==5){
		  facing=face
		  loadGraphic(fire1png, true, true, 125, 48, false)
		  addAnimation("fire1",[0,1,0,1,0,1,0,1,0,1],10,false)
		  play("fire1")
	  }	  
	  }
		
		//FlxG.overlap(canon.group, land, erasePartOfLand);
	//}
	

	override public function update():void
	{

		if(types==3 && !finished)  //攻击雅的
		{
			if(Registry.player.currentstate!=Actions.DROPDOWN_FACE && Math.abs(Registry.player.y-y)<50 && FlxVelocity.distanceBetween(Registry.player,this)<125)
			{
				States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,20)
			}
		}
		if(types==5 && !finished)  //攻击雅的
		{
			for each(var m:GameObject in Registry.gameobjects.members)
			{
				if(m is Enemy){
					// var tmp:Soldier=mm.soldier
					if(Math.abs(m.y-y)<100 && FlxVelocity.distanceBetween(m,this)<110)
						//	 if(FlxCollision.pixelPerfectCheck(this,m as FlxSprite))
					{
						( m as Enemy).setDamageState(Actions.DROPDOWN_FACE,50)
					}
				}
			}
		}
		
		if(finished)
		{
			
			exists=false
			destroy()	
			//this=null	
		}
	super.update()
	}
	
	
	}
}