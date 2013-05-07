package role
{
	import enemy.PrettySoldier;
	
	import flash.utils.getTimer;
	
	import objects.GameObject;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	public class Robot extends GameObject
	{
		[Embed(source = '../img/playrole/robot.png')] public   var robotpng:Class;
		[Embed(source = '../img/playrole/robot2.png')] public   var robot2png:Class;
		[Embed(source = '../img/playrole/robot3.png')] public   var robot3png:Class;
		//public var type:int
		public function Robot(X:Number,Y:Number,Type:int)
		{
			//super(X,Y)
			x=X
			y=Y
			health=200
			type=Type	
			if(type==0){
			this.loadGraphic(robotpng,true,true,150,120)
			
			//	this.addAnimation("jump",[0,0,0,16,16,16,0,0,0],10,false)
			//48 17*5 47*6 33*5
			this.addAnimation(Actions.JUMP,[17,16,16,16,16,16,8],8,false)	
			//this.addAnimation("jump",[47,49,49, 51, 51, 51, 48],10,false)
			this.addAnimation(Actions.WALK,[7,6,5,4,3],10,false)
			this.addAnimation(Actions.IDLE,[12],0,false)
			this.addAnimation(Actions.RUN,[7,6,5,4,3],15,false)
			this.addAnimation(Actions.ATTACK_NORMAL,[13,15,14,15,13],12,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[11,10,9,13,15,14,15,13],10,false)	
			this.addAnimation(Actions.ATTACK_THROW,[1,0],5,false)
	         this.addAnimation(Actions.DAMAGE_NORMAL,[3,8,8],8,false)	
			 this.addAnimation(Actions.DEAD,[19,18,19,18,19,18,19,18],10,false)
			//this.addAnimation(Actions.DROPDOWN_FACE,[26,25,24,23,22,34,33,22,22,22,22,22],8,false)	
			this.play("idle")
			}
			else if(type==1){
				this.loadGraphic(robot2png,true,true,170,100)
				
				//	this.addAnimation("jump",[0,0,0,16,16,16,0,0,0],10,false)
				//48 17*5 47*6 33*5
				this.addAnimation(Actions.JUMP,[19,17,17,17,17,17,8],8,false)	
				//this.addAnimation("jump",[47,49,49, 51, 51, 51, 48],10,false)
				this.addAnimation(Actions.WALK,[9,10,11,12,13,14,15],10,false)
				this.addAnimation(Actions.IDLE,[15],0,false)
				this.addAnimation(Actions.RUN,[9,10,11,12,13,14,15],15,false)
				this.addAnimation(Actions.ATTACK_NORMAL,[5,6,8],12,false)
				this.addAnimation(Actions.ATTACK_CONTINUE,[5,6,8,5,6,8],10,false)	
				//this.addAnimation(Actions.ATTACK_THROW,[1,0],5,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[19,17,18],8,false)	
				this.addAnimation(Actions.DEAD,[0,1,2,3,4,7],8,false)
				//this.addAnimation(Actions.DROPDOWN_FACE,[26,25,24,23,22,34,33,22,22,22,22,22],8,false)	
				this.play("idle")
			}
			else if(type==2){
				this.loadGraphic(robot3png,true,true,170,100)
				
				//	this.addAnimation("jump",[0,0,0,16,16,16,0,0,0],10,false)
				//48 17*5 47*6 33*5
				this.addAnimation(Actions.JUMP,[4,5,5,5,5,5,6],8,false)	
				//this.addAnimation("jump",[47,49,49, 51, 51, 51, 48],10,false)
				this.addAnimation(Actions.WALK,[0,1,2,3,17,18],10,false)
				this.addAnimation(Actions.IDLE,[3],0,false)
				this.addAnimation(Actions.RUN,[0,1,2,3,17,18],15,false)
				this.addAnimation(Actions.ATTACK_NORMAL,[7,8,9,19,10],12,false)
				this.addAnimation(Actions.ATTACK_CONTINUE,[7,8,9,19,10],10,false)	
				//this.addAnimation(Actions.ATTACK_THROW,[1,0],5,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[5,6,4],8,false)	
				this.addAnimation(Actions.DEAD,[11,12,13,14,15,16],8,false)
				//this.addAnimation(Actions.DROPDOWN_FACE,[26,25,24,23,22,34,33,22,22,22,22,22],8,false)	
				this.play("idle")
			}
			}
	
		public function chancestate():void
		{
//			if(currentstate==Actions.ATTACK_THROW && finished)
//			{
//				iscatch=false
//			}
		
			
			 if(currentstate==Actions.WALK || currentstate==Actions.RUN  )
			{
				 walktime++
					 if(walktime%20==0){
				 FlxG.play(Registry.robotwalkmp3,10,false);
				 trace("walktime  --"+walktime)
				 walktime=0
					 }
				 velocity.x=0
				velocity.y=0	
				
			}
			else if(acceleration.y==0 && finished )
			{
				if(currentstate==Actions.ATTACK_CONTINUE)
				{
					this.iscontinue=false
				}
				//play(Actions.IDLE)
				velocity.x=0
				velocity.y=0	
				//	currentstate=Actions.IDLE
				States.setState(Actions.IDLE,this)
			}
		}
	
		override public function update():void
		{
			if(!isuse){return}
			if(x>rightx)
			{
				x=rightx
			}
			else if(x<leftx)
			{
				x=leftx
			}
			if(y<upy && this.acceleration.y==0)
			{
				y=upy
			}
			else if(y>downy)
			{
				y=downy
			}
			Registry.player1.facing=facing
			if(Registry.player1.type==0 || Registry.player1.type==2 || Registry.player1.type==3){
			Registry.player1.x=x
			}
			else if(Registry.player1.type==1)
			{
				if(Registry.player1.facing==FlxObject.RIGHT){
					Registry.player1.x=x
				}
				else{
					Registry.player1.x=x+25
				}
			}
			
				Registry.player1.y=y-25
			if(health<=0)
		{
			velocity.x=0
			velocity.y=0
			
			this.alive=false	
//			if(this.currentstate!=Actions.DEAD){
//				this.currentstate=Actions.DEAD
//				this.play(Actions.DEAD)}
			Registry.player1.isrobot=false
			Registry.player1.velocity.x=0
			Registry.player1.velocity.y=0	
			Registry.player1.leftx=leftx
			Registry.player1.rightx=rightx	
			Registry.player1.setState(Actions.IDLE)
			Registry.player=Registry.player1
			isuse=false
			
			var hjtexpole2:Expolre=new Expolre(x,y,0,this.facing)
			
			FlxG.play(Registry.expolehjt,10)
			Registry.fxgroup.add(hjtexpole2)	
			this.exists=false
			}
		/*
			if(currentstate==Actions.DEAD)
		{
			if(finished)
			{
				
				//this.currentstate=Actions.IDLE
				this.health=100	
				this.alive=true
				//Registry.player1.exists=true
				//Registry.player1.x=x
				//Registry.player1.y=y	
				//Registry.player=Registry.player1
				Registry.player1.isrobot=false
				Registry.player1.velocity.x=0
				Registry.player1.velocity.y=0	
				Registry.player1.leftx=leftx
				Registry.player1.rightx=rightx	
				Registry.player1.setState(Actions.IDLE)
				Registry.player=Registry.player1
				isuse=false
				this.exists=false
			}
			
		}
			*/
		if(alive){
			if(FlxG.keys.justPressed("M") && currentstate!=Actions.JUMP)
			{
				//Registry.robot.x=b.x
				//Registry.robot.x=b.y	
				//b.exists=false
				//Registry.robot.exists=false	
				velocity.x=0
				velocity.y=0
				acceleration.y=0	
				isuse=false
				//Registry.player1.exists=true
				Registry.player1.isrobot=false
				Registry.player1.velocity.x=0
				Registry.player1.velocity.y=0	
				Registry.player1.leftx=leftx
				Registry.player1.rightx=rightx
				Registry.player1.setState(Actions.IDLE)
				
						
				Registry.player=Registry.player1
			}
			if( this.acceleration.y>0 && velocity.y>0 && y>starty )
			{
				velocity.x=0
				velocity.y=0
				acceleration.y=0
				
			}
			chancestate()
			
			//if(!iscatch){
				//测试
				
				
				if(FlxG.keys.justPressed("A"))
				{
					justrun()
				}
				else if(FlxG.keys.justPressed("D"))
				{
					justrun()
				}
				
				if (FlxG.keys.A )
				{
					facing=FlxObject.LEFT
					
					
					if(!isrun){
						velocity.x=-this.speedx
					}
					else{
						velocity.x=-this.speedx*2
					}
				}
				else if (FlxG.keys.D )
				{
					facing=FlxObject.RIGHT
					
					
					
					if(!isrun){
						velocity.x=this.speedx
					}
					else{
						velocity.x=this.speedx*2
					}		
				}
				
				if (FlxG.keys.W && this.acceleration.y==0)
				{
					if(!isrun){
						velocity.y=-this.speedy
					}
					else{
						velocity.y=-this.speedy*2
					}				
				}
				else if (FlxG.keys.S && this.acceleration.y==0)
				{
					if(!isrun){
						velocity.y=this.speedy
					}
					else{
						velocity.y=this.speedy*2
					}			
				}
				
				
				
				
				
				if (FlxG.keys.justPressed("J") )
				{
					if(acceleration.y==0 && finished)
					{
						if(type==0){
						FlxG.play(Registry.robotattackmp3,10,false);
						}
						else if(type==1){
							FlxG.play(Registry.roboticemp3,10,false);
						}
						else if(type==2){
							FlxG.play(Registry.robotfiremp3,10,false);
						}
						
						}
					if(!isrun){

						 if(!iscontinue){
							 
							 States.setState(Actions.ATTACK_NORMAL,this)
						}
						else{
							
							States.setState(Actions.ATTACK_CONTINUE,this)
						}
					}
					else
					{
						
							isrun=false
							States.setState(Actions.ATTACK_NORMAL,this)
						
					}
				}
					
				else if (FlxG.keys.justPressed("K") && this.acceleration.y==0)
				{
				
					States.setState(Actions.JUMP,this)
				}
				
		
			
			if(velocity.x==0 && velocity.y==0 && (currentstate==Actions.WALK || currentstate==Actions.RUN ))
			{
				isrun=false
				//else{
				States.setState(Actions.IDLE,this)
				//}
			}
			else if((currentstate==Actions.ATTACK_NORMAL   || currentstate==Actions.ATTACK_CONTINUE) && !finished)
			{
				velocity.x=0
				velocity.y=0	
			}
			else if(currentstate==Actions.ATTACK_RUN && !finished)
			{
				//velocity.x=0
				velocity.y=0
			}
			else if((velocity.x!=0 || velocity.y!=0))
			{
				if(!isrun){
					States.setState(Actions.WALK,this)
				}
				else if(isrun){
					States.setState(Actions.RUN,this)
				}
			}
		}
			super.update();
		}
		
		
	}
}