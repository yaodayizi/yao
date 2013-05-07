package enemy
{
	import fensi.Fensi;
	
	import objects.GameObject;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FX.BlurFX;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxSpecialFX;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;

	public class Predator extends Enemy
	{
		[Embed(source = '../img/boss/predator.png')] public   var predatorpng:Class;
		[Embed(source = '../img/weapon/predatorpao.png')] public   var paopng:Class;
		[Embed(source = '../img/sailor/predatordead.png')] public   var pdeadpng:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		
		public var shoot:FlxWeapon
		private var sy:Number
		private var blur:BlurFX;
		private var blurEffect:FlxSprite;
		
		private var xx:int=0
		public function Predator(X:Number,Y:Number,Type:int)
			{
				x=X
				y=Y	
				
				maxlife=500
				health=maxlife
				speed=60	
				type=Type	
				if(type==0){	
					this.loadGraphic(predatorpng,true,true,150,130,false)
					//this.addAnimation(Actions.STATE_CATCH,[62],0,false)	
					this.addAnimation(Actions.IDLE,[36],0,false)	
					//this.addAnimation(Actions.ATTACK_SUPER,[3,4,5,6,7,8,9,10,11,12,13,14],10,false)	
					
					//this.addAnimation(Actions.WALK,[19,26,27,28,29,37,38,39,20,30],2,true)
					this.addAnimation(Actions.WALK,[19,26,27,28,29,37,38,39,20,30],10,true)
					//this.addAnimation(Actions.ATTACK_THROW,[45,44,43,42,41],10,false)	
					//this.addAnimation(Actions.ATTACK_CATCH,[47,46],5,false)
					//this.addAnimation(Actions.ATTACK_CONTINUE,[55,56,58,54,53,52,51,50,49,48],10,false)	
					this.addAnimation(Actions.ATTACK_RUNJUMP,[16,15,14,13,12,12,12,11,10,9],8,false)	
					//this.addAnimation(Actions.JUMP,[69,68,67,66,64],5,false)
					this.addAnimation(Actions.ATTACK_JUMPATTACK1,[6,5,4,3,2,1,0,0,1,5,6],8,false)	
					this.addAnimation(Actions.ATTACK_JUMPATTACK2,[18,18,18,18,17,17],5,false)	
					//this.addAnimation(Actions.DAMAGE_CATCH,[57,62],5,false)
					this.addAnimation(Actions.DAMAGE_NORMAL,[35,34],6,false)
					this.addAnimation(Actions.DAMAGE_CATCH,[35,34],6,false)
					this.addAnimation(Actions.DAMAGE_THROWOUT,[33,32,31,31,31,17],6,false)
					this.addAnimation(Actions.DROPDOWN_BACKFACE,[33,32,31,31,31,17],8,false)	
					this.addAnimation(Actions.DROPDOWN_FACE,[33,32,31,31,31,17],8,false)		
					//this.addAnimation(Actions.ATTACK_RUN,[78,79],5,false)	
					this.addAnimation(Actions.ATTACK_NORMAL,[8,8,7,7],10,false)	
					this.addAnimation("fire",[25,24,23,22,21],10,false)	
				
				}
				
				play(Actions.IDLE)
			//	play(Actions.WALK)
				delayAI=new FlxDelay(1000)
				delayAI.start()
			
				shoot=new FlxWeapon("pao", this, "x", "y");
				shoot.makeAnimatedBullet(5,paopng, 90, 32, [0,1,2,3,4,5], 10, false,0,0);
				//shoot.setBulletGravity(0,220);
				//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
				shoot.setBulletLifeSpan(2000)
				shoot.setFireRate(1000);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
				//shoot.setBulletDirection(FlxWeapon.BULLET_SOUTH_EAST, 250);
				//shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
					/*		
				if (FlxG.getPlugin(FlxSpecialFX) == null)
				{
					FlxG.addPlugin(new FlxSpecialFX);
				}
		this.replaceColor(0xff000000, 0x0);	
			
		blur = FlxSpecialFX.blur();
		
		blurEffect = blur.create(640,480 , 5, 5, 10);
		//blurEffect.scrollFactor.x=0
		//blurEffect.scrollFactor.y=0
		blur.addSprite(this);
		
		Registry.deadobjects.add(blurEffect);
		
		
		blur.start(10);
		*/
		}
		private function throwhit(a:FlxObject,b:FlxObject):void
		{
			if(b is Enemy)
			{
				
				if(FlxU.abs(a.y+a.height-b.y-b.height)<6 && FlxCollision.pixelPerfectCheck(a as FlxSprite,b as FlxSprite)){
					(b as Enemy).setDamageState(Actions.DROPDOWN_FACE,10)
				}
			}
		}
		public  override function setDamageState(value:String,damage:Number):void
		{
			trace("predator damage")
			if(value==currentstate)
			{
				//trace("aaa ")
				return
			}
			
			if(value==Actions.DAMAGE_NORMAL)
			{
				velocity.x=0
				velocity.y=0	
			}
			//			if( value==Actions.DAMAGE_THROWOUT)
			//			{
			//				starty=y
			//				acceleration.y=520
			//				if(facing==FlxObject.LEFT){
			//					velocity.y=-200
			//					velocity.x=-200}
			//				else if(facing==FlxObject.RIGHT){
			//					velocity.y=-200
			//					velocity.x=200}
			//			}
			//if(currentstate==Actions.DAMAGE_NORMAL && (value==Actions.DROPDOWN_BACKFACE || value==Actions.DROPDOWN_FACE ))
			if( (value==Actions.DROPDOWN_BACKFACE || value==Actions.DROPDOWN_FACE ))
			{
				starty=y
				acceleration.y=520
				velocity.y=-250
				
				if(facing==FlxObject.LEFT){
					
					velocity.x=40
				}
				else 
				{
					velocity.x=-40
					
				}
				currentstate=value	
			}	
			
			currentstate=value
			this.health-=damage
			//  trace("health shi "+health)
			play(currentstate)
		}
			public override function isinterrupt():Boolean
			{
				
				if(currentstate==Actions.WALK || currentstate==Actions.IDLE || currentstate==Actions.STATE_CATCH)
				{
					return true
				}
					
				else
				{
					return false
				}
			}
			
			public function chancestate():void
			{
//				if(currentstate==Actions.STATE_CATCH)
//				{
//					velocity.x=0
//					velocity.y=0
//					return
//				}
		
				if(acceleration.y==0 && finished && currentstate!=Actions.WALK)
				{
					setState(Actions.IDLE)
					velocity.x=0
					velocity.y=0	
				}
				if(currentstate==Actions.ATTACK_JUMPATTACK2 && !finished){
				if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<10 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
					States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,10)
				}
				}
			}
			
			public override function setState(value:String):void
			{
				//if(currentstate==value)return
				if(acceleration.y!=0 || (currentstate==value && currentstate!=Actions.WALK))return
					currentstate=value
				
				//if(acceleration.y==0){
				//currentstate==Actions.ATTACK_JUMPATTACK1 || currentstate==Actions.ATTACK_JUMPATTACK2 ||
				if(  currentstate==Actions.ATTACK_RUNJUMP)
				{starty=y
				if(this.x-Registry.player1.x<0)
				{
					facing=FlxObject.RIGHT
					this.velocity.x=200	
				}
				else if(this.x-Registry.player1.x>0)
				{
					facing=FlxObject.LEFT
					this.velocity.x=-200	
				}
				
					velocity.y=-250
					acceleration.y=620
				}
				else if(currentstate==Actions.ATTACK_NORMAL)
				{
					velocity.x=0
					velocity.y=0	
				}
				
				if(currentstate==Actions.WALK){
					
					
						play(Actions.WALK)  
					
				}
					
				else{
					//trace("waraa "+currentstate)
					play(currentstate)
				}
			}
			
			override public function update():void
			{
				//blurEffect.x=x
				//blurEffect.y=y	
//				if(this.currentstate==Actions.DAMAGE_THROWOUT)
//				{
//					FlxG.overlap(this,Registry.gameobjects,throwhit)
//				}
				if(this.currentstate==Actions.WALK){
				if(this.velocity.x!=0 && (x<0 || x>1500))
				{
				  this.velocity.x=-this.velocity.x
					}
				if(this.velocity.y!=0 && (y<120 || y>500))
				{
					this.velocity.y=-this.velocity.y
				}
				}
				
				if( this.acceleration.y>0 && velocity.y>0 &&  y>=starty )
				{
					velocity.x=0
					velocity.y=0
					acceleration.y=0
					//  currentstate=Actions.IDLE
				}
				chancestate()
				
				if(delayAI.hasExpired )
				{
					//blurEffect = blur.create(320, 240, 2, 2, 1);
				
					if( isinterrupt()){
						var player:GameObject=Registry.player
//						if(this.currentstate==Actions.DROPDOWN_BACKFACE){(Registry.player as Ninja).iscatch=false
//							x-=10
//							
//						}
						var distance:Number=FlxVelocity.distanceBetween(Registry.player,this)
						if(distance<1000)
						{
							findtarget=true
						}
						else
						{
							findtarget=false
						}
						if(findtarget) //发现玩家
						{
							var rndmove:int=Math.random()*3
							
							if(rndmove<2)
							{
								var movex:Number=Math.random()*(Registry.player.x+100)
								var movey:Number=Math.random()*(Registry.player.y+100)	
								movex=movex>Registry.player.x-100?movex:Registry.player.x-100
								movey=movey>Registry.player.y-100?movey:Registry.player.y-100
								if(x-Registry.player.x>0){facing=FlxObject.LEFT}
								else {facing=FlxObject.RIGHT}
								FlxVelocity.moveTowardsPoint(this,new FlxPoint(movex,movey),speed)	
								//currentstate=Actions.WALK	
								setState(Actions.WALK)
							}
								
							else if(rndmove==2){
								var rndstate:int=Math.random()*5
								//var rndstate:int=4
//								if(rndstate==0){
//									setState(Actions.JUMP)
//								}
//								 if(rndstate==0){
//									setState(Actions.ATTACK_JUMPATTACK1)
//									
//									if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//										States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
//									}
//								}
								 if(rndstate==0){
									setState(Actions.ATTACK_JUMPATTACK1)
									x=Registry.player.x-50
									y=Registry.player.y-10
									facing=FlxObject.RIGHT
									velocity.x=0
									velocity.y=0	
									if(FlxU.abs(y+height-player.y-player.height)<30 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
										States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
									}
									
								}
								else if(rndstate==1){
									setState(Actions.ATTACK_RUNJUMP)
									if(FlxU.abs(starty+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
										States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,20)
									}
								}
//								else if(rndstate==4){
//									setState(Actions.ATTACK_CONTINUE)
//									if(FlxU.abs(y+height-player.y-player.height)<10 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//										States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,5)
//									}	
//								}
								else if(rndstate==2){
									setState(Actions.ATTACK_NORMAL)
									if(FlxU.abs(y+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
										States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,1)
									}	
								}
								else if(rndstate==3){
									velocity.x=0
									velocity.y=0	
									setState("fire")
									sy=this.y
									shoot.setBulletDirection(FlxWeapon.BULLET_SOUTH_EAST, 250);
									shoot.fire()
//									if(FlxU.abs(y+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//										States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,1)
//									}	
								}
							
								else if(rndstate==4){
									if(facing==FlxObject.LEFT)
									{
										velocity.x=-150
									}
									else if(facing==FlxObject.RIGHT)
									{
										velocity.x=150
									}
									
									setState(Actions.ATTACK_JUMPATTACK2)
								
									
								}	
						
								 
								 

							}
						}

					}
					delayAI.start()
				}
				if(health<=0 )
				{
					//var d:Fensi
					var f2:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
					f2.setBody1(pdeadpng,true,6,[0,1,2,3],150,130)
					//f2.setBody2(Fensi.marfs2png,true,6,[3,2,2,2,1,1,0],130,120)
					Registry.deadobjects.add(f2)
					
					this.kill()
				}
				/*
				if(health<=0 )
				{
					var deadmethod:int=Math.random()*2
					//var deadmethod:int=1
					if(type==0){
						if(deadmethod==0){
							var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
							f.setBody1(Fensi.mercuryfs1png,true,6,[3,2,2,2,1,0,1],130,120)
							f.setBody2(Fensi.mercuryfs2png,true,6,[3,2,2,2,1,0,1],130,120)
							Registry.deadobjects.add(f)
						}
						else if(deadmethod==1)
						{
							var bone:FlxSprite=new FlxSprite(x,y)
							bone.loadGraphic(Registry.merbonePNG,true,true,100,110)
							bone.facing=facing
							bone.addAnimation("dead", [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7],5, false);
							bone.play("dead")
							Registry.deadobjects.add(bone)
						}
						
					}
					else if(type==1)
					{
						if(deadmethod==0){
							var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
							f1.setBody1(Fensi.moonfs1png,true,6,[3,2,2,2,1,1,0],130,120)
							f1.setBody2(Fensi.moonfs2png,true,6,[3,2,2,2,1,1,0],130,120)
							Registry.deadobjects.add(f1)
						}
						else if(deadmethod==1)
						{
							var bone1:FlxSprite=new FlxSprite(x,y)
							bone1.loadGraphic(Registry.venubonePNG,true,true,100,120)
							bone1.facing=facing
							bone1.addAnimation("dead", [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7],5, false);
							bone1.play("dead")
							Registry.deadobjects.add(bone1)
						}
					}
					else if(type==2)
					{
						var f2:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
						f2.setBody1(Fensi.marfs1png,true,6,[3,2,2,2,1,1,0],130,120)
						f2.setBody2(Fensi.marfs2png,true,6,[3,2,2,2,1,1,0],130,120)
						Registry.deadobjects.add(f2)
					}
					else if(type==3)
					{
						var f3:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
						f3.setBody1(Fensi.jupiterfs1png,true,6,[0,1,2,3],130,120)
						f3.setBody2(Fensi.jupiterfs2png,true,6,[0,1,2,3],130,120)
						Registry.deadobjects.add(f3)
					}
					else if(type==4)
					{
						var f4:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
						f4.setBody1(Fensi.venufs1png,true,6,[0,1,2,3],130,120)
						f4.setBody2(Fensi.venufs2png,true,6,[0,1,2,3],130,120)
						Registry.deadobjects.add(f4)
					}
					else if(type==5)
					{
						var f5:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
						f5.setBody1(Fensi.dianvcut1png,true,6,[0,0,0,1,1,1],130,120)
						//f5.setBody2(Fensi.venufs2png,true,6,[0,1,2,3],130,120)
						Registry.deadobjects.add(f5)
					}
					this.kill()
					//return	
				}
				*/
				
				for each(var bullet:FlxObject in shoot.group.members)
				{
					//trace("lll "+bullet.y+"当地的 "+(sy+50))
					if(bullet.exists && bullet.y>sy+150)
					{
						//trace("ni ma b avaga"+sy+50)
						var hjtexpole1:Expolre
						if(bullet.velocity.x<0){
							hjtexpole1=new Expolre(bullet.x-200,bullet.y-100,1,(bullet as FlxSprite).facing)
						}
						else if(bullet.velocity.x>0){
							hjtexpole1=new Expolre(bullet.x-50,bullet.y-100,1,(bullet as FlxSprite).facing)
						}
						Registry.fxgroup.add(hjtexpole1)	
						bullet.kill()
						// break
					}
				}
				super.update();
			}
			
			
			
			}
}