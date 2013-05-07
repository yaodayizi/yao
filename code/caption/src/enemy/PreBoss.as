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
	
	public class PreBoss extends Enemy
	{
		[Embed(source = '../img/boss/preboss.png')] public   var prebosspng:Class;
		[Embed(source = '../img/weapon/predatorpao.png')] public   var paopng:Class;
		[Embed(source = '../img/sailor/prebossdead.png')] public   var prebossdeadpng:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		
		public var shoot:FlxWeapon
		private var sy:Number
		private var blur:BlurFX;
		private var blurEffect:FlxSprite;
		
		private var xx:int=0
		public function PreBoss(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			
			maxlife=800
			health=maxlife
			speed=90	
			type=Type	
			if(type==0){	
				this.loadGraphic(prebosspng,true,true,120,120,false)
					
				this.addAnimation(Actions.IDLE,[7],0,false)	
				
				this.addAnimation(Actions.WALK,[21,20,19,18,17],10,true)
				
				this.addAnimation(Actions.ATTACK_RUNJUMP,[7,6,6,6],5,false)	
				
//				this.addAnimation(Actions.ATTACK_JUMPATTACK1,[],8,false)	
//				this.addAnimation(Actions.ATTACK_JUMPATTACK2,[18,18,18,18,17,17],5,false)	
				
				this.addAnimation(Actions.DAMAGE_NORMAL,[1,0],6,false)
				this.addAnimation(Actions.DAMAGE_CATCH,[15],6,false)
				this.addAnimation(Actions.DAMAGE_THROWOUT,[10,9,8],6,false)
				this.addAnimation(Actions.DROPDOWN_BACKFACE,[10,9,8,8],6,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[10,9,8,8],6,false)		
				this.addAnimation(Actions.ATTACK_RUN,[14,13,12,11,14,13,12,11],8,false)	
				this.addAnimation(Actions.ATTACK_NORMAL,[14,13,12,11],10,false)	
				this.addAnimation("fire",[15,7],6,false)	
				this.addAnimation("yinshen",[5,4,3,2],6,false)
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
					(b as Enemy).setDamageState(Actions.DROPDOWN_FACE,40)
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
			if(currentstate=="yinshen"  && finished){
				x=Registry.player.x
				y=Registry.player.y
				setState(Actions.ATTACK_RUN)
			}
			if((currentstate==Actions.ATTACK_RUNJUMP || currentstate==Actions.ATTACK_RUN) && !finished){
				if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<20 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
					States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,40)
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
			{starty=Registry.player.y
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
						var rndmove:int=Math.random()*2
						
						if(rndmove==0)
						{
							
							FlxVelocity.moveTowardsPoint(this,new FlxPoint(Registry.player.x,Registry.player.y),speed)	
							setState(Actions.WALK)
						}
							
						else  if(rndmove==1){
							var rndstate:int=Math.random()*5
							
//							if(rndstate==0){
//								setState(Actions.ATTACK_JUMPATTACK1)
//								x=Registry.player.x-50
//								y=Registry.player.y-10
//								facing=FlxObject.RIGHT
//								velocity.x=0
//								velocity.y=0	
//								if(FlxU.abs(y+height-player.y-player.height)<30 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
//								}
//								
//							}
							 if(rndstate==0){
								setState(Actions.ATTACK_RUNJUMP)
//								if(FlxU.abs(starty+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,20)
//								}
							}
								
							else if(rndstate==1){
								setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<15 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,10)
								}	
							}
							else if(rndstate==2){
								velocity.x=0
								velocity.y=0	
								setState("fire")
								sy=this.y
								//shoot.setBulletDirection(FlxWeapon.BULLET_SOUTH_EAST, 250);
								shoot.fireAtPosition(player.x,player.y)
								shoot.setBulletLifeSpan(1500)
								shoot.setBulletSpeed(350)
								shoot.fire()
								//									if(FlxU.abs(y+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
								//										States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,1)
								//									}	
							}
								
							else if(rndstate==3){
								if((this.x+this.width-player.x-player.width)<0)
								{
									facing=FlxObject.RIGHT
								}
								else{
									facing=FlxObject.LEFT
								}
								
								if(facing==FlxObject.RIGHT)
								{
									velocity.y=0
									velocity.x=150
								}
								else
								{
									velocity.y=0
									velocity.x=-150
								}
								
								setState(Actions.ATTACK_RUN)
								
								
							}	
							else if(rndstate==4){
								setState("yinshen")
							}
							
							
							
						}
					}
					
				}
				delayAI.start()
			}
import org.flixel.plugin.photonstorm.FlxCollision;

			if(health<=0 )
			{
				//var d:Fensi
				var f2:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				f2.setBody1(prebossdeadpng,true,6,[2,1,0],120,120)
				//f2.setBody2(Fensi.marfs2png,true,6,[3,2,2,2,1,1,0],130,120)
				Registry.deadobjects.add(f2)
				
				this.kill()
			}

			
			for each(var bullet:FlxObject in shoot.group.members)
			{
				//trace("lll "+bullet.y+"当地的 "+(sy+50))
				if(bullet.exists && FlxU.abs(bullet.x+bullet.width-Registry.player.x-Registry.player.width)<150 && FlxU.abs(Registry.player.y+Registry.player.height-bullet.y-bullet.height)<150)
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