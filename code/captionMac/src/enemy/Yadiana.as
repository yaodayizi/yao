

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
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	import role.Ninja;
	
	public class Yadiana extends Enemy
	{
		
		[Embed(source = '../img/boss/yadiana.png')] public   var yadianapng:Class;
		//	[Embed(source = '../img/weapon/gunbullet.png')] public   var gunbulletpng:Class;
		[Embed(source = '../img/sailor/yadianadead.png')] public static  var yadiandeadpng:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
	//	public var type:int
		//	public var shoot:FlxWeapon
		private var sy:Number
		public function Yadiana(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			//health=2
			maxlife=100
			health=maxlife
			type=Type	
			
			starty=y	
			if(type==0){	
				this.loadGraphic(yadianapng,true,true,150,150,false)
				this.addAnimation(Actions.STATE_CATCH,[36],0,false)	
				this.addAnimation(Actions.IDLE,[49],0,false)	
				//this.addAnimation(Actions.POSE,[4],0,false)	
				//this.addAnimation(Actions.ATTACK_SUPER,[59,60,26,27,28,29,30,31,32,25],10,false)	
				//this.addAnimation(Actions.RUN,[],10,false)
				this.addAnimation(Actions.WALK,[15,16,17,18,18,20],10,true)
				//this.addAnimation(Actions.UP,[],10,true)
				//this.addAnimation(Actions.ATTACK_THROW,[53,54,55,56,57,58],8,false)	//bo
				//this.addAnimation(Actions.ATTACK_CATCH,[59,60,61,62,63,64],10,false)
				//this.addAnimation(Actions.ATTACK_CONTINUE,[24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,25,4],10,false)	
				//this.addAnimation(Actions.ATTACK_RUNJUMP,[69,68,61,60,59,64],5,false)	
				//this.addAnimation(Actions.JUMP,[69,68,67,66,64],5,false)
				//this.addAnimation(Actions.ATTACK_JUMPATTACK1,[69,68,65,65,64],5,false)	
				//this.addAnimation(Actions.ATTACK_JUMPATTACK2,[69,68,63,63,64],5,false)	
				this.addAnimation(Actions.DAMAGE_CATCH,[36,35,35],8,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[39,38,37],8,false)
				this.addAnimation(Actions.DAMAGE_THROWOUT,[24,25,26,27,28,29,30,31,32,33,34],10,false)
				//this.addAnimation(Actions.DROPDOWN_BACKFACE,[27,28,29,30,31,32,33],8,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[24,25,26,27,28,29,30,31,32,33,34],8,false)	
				//this.addAnimation(Actions.RUN,[10,9,8,7,6,5],10,true)
				this.addAnimation(Actions.ATTACK_RUN,[7,8,9,10,11,12,7,8,9,10,11,12,7,8,9,10,11,12],6,false) //枪	
				this.addAnimation(Actions.ATTACK_NORMAL,[21,22,23],10,false)		
				//this.addAnimation(Actions.JUMP,[2,2,1,1,0],5,false)
				//this.addAnimation("dang",[4,4,4,4,3,3,3,3],5,false)
				this.addAnimation("move",[13,14,13,14,13,14,34],20,false)
				this.addAnimation("power",[4,3,2,1,0,4,3,2,1,0,4,3,2,1,0],8,false)
				this.addAnimation("cry",[42,43,44,45,46,47,48],8,false)
			}
			
			play(Actions.IDLE)
			delayAI=new FlxDelay(1000)
			delayAI.start() 	
			//			shoot=new FlxWeapon("pao", this, "x", "y");
			//			shoot.makeImageBullet(5,gunbulletpng);
			//			
			//			shoot.setBulletLifeSpan(1000)
			//			shoot.setFireRate(250);
			//			shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
			
			//Registry.bulletsgroup.add(shoot.group)	
		}
		
		
		public override function isinterrupt():Boolean
		{
			if(currentstate==Actions.WALK || currentstate==Actions.IDLE || currentstate==Actions.STATE_CATCH  )
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
			
			if(currentstate==Actions.STATE_CATCH)
			{
				velocity.x=0
				velocity.y=0
				return
			}
		
			
			if(currentstate=="move" ){
				if(finished){
				velocity.x=0
				velocity.y=0
				setState(Actions.ATTACK_NORMAL)
				}
				else
				{
					if(FlxU.abs(x+width-Registry.player.x-Registry.player.width)<50 && FlxU.abs(y+height-Registry.player.y-Registry.player.height)<50){
						States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,20)}
				}
				
				}
			
			if(currentstate==Actions.ATTACK_RUN ){
				if(finished){
					velocity.x=0
					velocity.y=0
					setState(Actions.ATTACK_NORMAL)
				}
				
			}
			
			if(acceleration.y==0 && finished && currentstate!=Actions.WALK)
			{
				
				if(currentstate==Actions.DAMAGE_CATCH){
					setState(Actions.STATE_CATCH)
				}else {
					//play(Actions.IDLE)
					setState(Actions.IDLE)
				}
				velocity.x=0
				velocity.y=0	
				//currentstate=Actions.IDLE
			}
		
			}
		
		public override function setState(value:String):void
		{
			//if(currentstate==value)return
			if(acceleration.y!=0 || (currentstate==value && currentstate!=Actions.WALK))return
				currentstate=value
			
			
			if(currentstate==Actions.DAMAGE_CATCH  || currentstate==Actions.ATTACK_NORMAL || currentstate==Actions.ATTACK_RUN  )
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
		
		
		public override function setDamageState(value:String,damage:Number):void
		{
			if(value==currentstate)
			{
				//trace("aaa ")
				return
			}
			
			
			if(value==Actions.DAMAGE_NORMAL)
			{
				FlxG.play(Registry.mmdamage7mp3,10,false);
				velocity.x=0
				velocity.y=0	
			}
			if(value==Actions.DAMAGE_CATCH)
			{
				
				FlxG.play(Registry.mmdamage7mp3,10,false);
			}
			if( value==Actions.DAMAGE_THROWOUT)
			{
				FlxG.play(Registry.dropdown3mp3,10,false);
				starty=y
				acceleration.y=520
				if(facing==FlxObject.LEFT){
					velocity.y=-200
					velocity.x=-200}
				else if(facing==FlxObject.RIGHT){
					velocity.y=-200
					velocity.x=200}
			}
			//if(currentstate==Actions.DAMAGE_NORMAL && (value==Actions.DROPDOWN_BACKFACE || value==Actions.DROPDOWN_FACE ))
			if(value==Actions.DROPDOWN_FACE )
			{
				FlxG.play(Registry.dropdown3mp3,10,false);
				starty=y
				acceleration.y=520
				velocity.y=-250
				
				if(facing==FlxObject.LEFT){
					
					velocity.y=-250
					velocity.x=-40
				}
				else 
				{
					
					velocity.y=-250
					velocity.x=40
				}
				currentstate=value
			}	
			
			
			//else if( (currentstate==Actions.DAMAGE_NORMAL || currentstate==Actions.DAMAGE_CATCH || currentstate==Actions.DEAD || currentstate==Actions.DROPDOWN_BACKFACE || currentstate==Actions.DROPDOWN_FACE || currentstate==Actions.ATTACK_SUPER) && !finished )
			currentstate=value
			this.health-=damage
			//  trace("health shi "+health)
			play(currentstate)
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
		override public function update():void
		{
			
			if(this.currentstate==Actions.DAMAGE_THROWOUT)
			{
				FlxG.overlap(this,Registry.gameobjects,throwhit)
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
				if( isinterrupt()){
					var player:GameObject=Registry.player
					//					if(this.currentstate==Actions.DROPDOWN_BACKFACE){(Registry.player as Ninja).iscatch=false
					//						x-=10
					//						
					//					}
					var distance:Number=FlxVelocity.distanceBetween(Registry.player,this)
					if(distance<650)
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
							
						else if(rndmove==1){
							var rndstate:int=Math.random()*5
							//var rndstate:int=2
							
							if(rndstate==0){
								setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,10)
								}	
							}
								
							
							else if(rndstate==1){
								//shoot.setFiringPosition(x,y,30,30)
								//this.y-=30
								FlxG.play(Registry.mmattack7mp3,10,false);
								setState("move")
								if((this.x+this.width-player.x-player.width)<0)
								{
									facing=FlxObject.RIGHT
								}
								else{
									facing=FlxObject.LEFT
								}
								
//								if(facing==FlxObject.RIGHT)
//								{
//									velocity.y=0
//									velocity.x=150
//								}
//								else
//								{
//									velocity.y=0
//									velocity.x=-150
//								}
								FlxVelocity.moveTowardsPoint(this,new FlxPoint(player.x,player.y),speed*5)
							}
//							else if(rndstate==3){
//								//shoot.setFiringPosition(x,y,30,30)
//								velocity.x=0
//								velocity.y=0	
//								if(x-player.x<0){facing=FlxObject.RIGHT}
//								else{facing=FlxObject.LEFT}
//								//this.y-=30
//								setState("dang")
//								
//							}
							else if(rndstate==2){
								FlxG.play(Registry.mmattack8mp3,10,false);
								//shoot.setFiringPosition(x,y,30,30)
								//this.y-=30
								setState(Actions.ATTACK_RUN)
								if(x-player.x<0){facing=FlxObject.RIGHT}
								else{facing=FlxObject.LEFT}
								FlxVelocity.moveTowardsPoint(this,new FlxPoint(player.x,player.y),speed*3)
							}
							
							else if(rndstate==3){
								FlxG.play(Registry.mmattack9mp3,10,false);
								velocity.x=0
								velocity.y=0
								setState("power")
								if(FlxU.abs(y+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
								}	
							}
							else if(rndstate==4){
								FlxG.play(Registry.mmdamage7mp3,10,false);
								velocity.x=0
							velocity.y=0	
								health+=50
								setState("cry")
							}
						}
					}
					else{   //no find player
						var rnd:int=Math.random()*8
						var mx:Number=Math.random()*FlxG.width
						var my:Number=Math.random()*FlxG.height
						FlxVelocity.moveTowardsPoint(this,new FlxPoint(mx,my),speed)
						if(rnd<=7)
						{
							FlxVelocity.moveTowardsPoint(this,new FlxPoint(mx,my),speed)
							if(velocity.x<0){facing=FlxObject.LEFT}
							else if(velocity.x>0){facing=FlxObject.RIGHT}
							setState(Actions.WALK)
						}
						//						else if	(rnd==8)
						//						{
						//							FlxVelocity.moveTowardsPoint(this,new FlxPoint(mx,my),speed*2)
						//							if(velocity.x<0){facing=FlxObject.LEFT}
						//							else if(velocity.x>0){facing=FlxObject.RIGHT}
						//							setState(Actions.RUN)
						//						}
						//						else if	(rnd==9)
						//						{
						//							
						//							setState(Actions.POSE)
						//						}
					}
				}
				delayAI.start()
			}
			if(health<=0 )
			{
				FlxG.play(Registry.mmdead7mp3,10,false);
				var dd:int=Math.random()*2
					if(dd==0){
				var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				f.setBody1(yadiandeadpng,true,6,[0,0,1,1],150,120)
				Registry.deadobjects.add(f)
					}
					else
					{
						var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
						f1.setBody1(yadiandeadpng,true,6,[2,2,3,3],150,120)
						Registry.deadobjects.add(f1)
					}
				
				
				
				this.kill()
				//return	
			}
			
			super.update();
		}
		
		
	}
}