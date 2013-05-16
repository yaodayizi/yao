package enemy
{
	import fensi.Fensi;
	import org.flixel.FlxRect;
	import objects.GameObject;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxDelay;
	import org.flixel.plugin.photonstorm.FlxMath;
	import org.flixel.plugin.photonstorm.FlxVelocity;
	
	import role.Ninja;
	
	public class Ano extends Enemy
	{
		
		[Embed(source = '../img/boss/anuo.png')] public   var anopng:Class;
		[Embed(source = '../img/weapon/gunbullet.png')] public   var gunbulletpng:Class;
		[Embed(source = '../img/boss/anodead.png')] public static  var adeadpng:Class;
		[Embed(source = '../img/boss/anuosuper.png')] public static  var superpng:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		//	public var type:int
		public var shoot:FlxWeapon
		private var sy:Number
		public function Ano(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			maxlife=800
			health=maxlife
			type=Type	
			
			starty=y	
			if(type==0){	
				this.loadGraphic(anopng,true,true,150,100,false)
				this.addAnimation(Actions.STATE_CATCH,[4],0,false)	
				this.addAnimation(Actions.IDLE,[30],0,false)	
				
				this.addAnimation(Actions.ATTACK_SUPER,[4,3,2,1,4,3,2,1,4,3,2,1,4,3,2,1,4,3,2,1,0],8,false)	
				
				this.addAnimation(Actions.WALK,[31,32,33,34,35,36,37,38,39,40,41,42],10,true)
			
				this.addAnimation(Actions.ATTACK_THROW,[9,10,11,12,13],8,false)	//冲击
				this.addAnimation(Actions.ATTACK_RUNJUMP,[8,8,7,7,7,6,6,5,5,5,5,5],6,false)
				this.addAnimation(Actions.ATTACK_CONTINUE,[22,23,24,25,26,27,28,29],5,false)	
			
				this.addAnimation(Actions.DAMAGE_CATCH,[4,3,2],8,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[4,3,2],10,false)
				this.addAnimation(Actions.DAMAGE_THROWOUT,[0,0,1,1,1,1],3,false)
				this.addAnimation(Actions.DROPDOWN_BACKFACE,[0,0,1,1,1,1],3,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[0,0,1,1,1,1],3,false)		
				this.addAnimation(Actions.ATTACK_RUN,[14,15,16,17,18,19,20,21,14,15,16,17,18,19,20,21,14,15,16,17,18,19,20,21],8,false) //枪	
				this.addAnimation(Actions.ATTACK_NORMAL,[27,28,29],8,false)		
			}
			
			play(Actions.IDLE)
			delayAI=new FlxDelay(1000)
			delayAI.start() 	
			shoot=new FlxWeapon("pao", this, "x", "y");
			shoot.makeImageBullet(5,gunbulletpng);
			//shoot.setBulletGravity(0,220);
			//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
			shoot.setBulletLifeSpan(1000)
			shoot.setFireRate(250);
			shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
			//shoot.setBulletDirection(FlxWeapon.BULLET_SOUTH_EAST, 250);
			//shoot.setPreFireCallback(frieanim)
			Registry.bulletsgroup.add(shoot.group)	
		}
		
		
		public override function isinterrupt():Boolean
		{
			if(currentstate==Actions.WALK || currentstate==Actions.IDLE || currentstate==Actions.STATE_CATCH || currentstate==Actions.DAMAGE_CATCH)
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
			if(currentstate==Actions.ATTACK_SUPER && finished)
			{
				this.loadGraphic(anopng,true,true,150,100,false)
			}
			if(currentstate==Actions.ATTACK_CONTINUE && !finished)
				if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<10 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
					States.setDamagePlayerState(Actions.DAMAGE_NORMAL,Registry.player,20)
				}	
			if(currentstate==Actions.ATTACK_RUNJUMP && !finished){
				if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<20 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
				States.setDamagePlayerState(Actions.DAMAGE_NORMAL,Registry.player,20)}
			}
			if(currentstate==Actions.ATTACK_THROW && !finished){
				if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<30 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
				States.setDamagePlayerState(Actions.DAMAGE_NORMAL,Registry.player,20)
				}
			}
			if(currentstate==Actions.ATTACK_SUPER && !finished){
				if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
					States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,20)
				}
			}
			if(currentstate==Actions.ATTACK_RUN && !finished){
				//sy=this.y
				//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
				//shoot.setFiringPosition(x,y,30,30)
				if(facing==FlxObject.LEFT){
					shoot.fireFromAngle(165+Math.random()*25)}
				else{shoot.fireFromAngle(Math.random()*25)}
				//shoot.fireFromAngle(Math.random()*25)	
				shoot.setBulletSpeed(400)
				shoot.fire()
				for each(var bullet:FlxObject in shoot.group.members)
				{
					//trace("lll "+bullet.y+"当地的 "+(sy+50))
					//&& bullet.y>sy+20
					if(bullet.exists )
					{
						if(FlxU.abs(bullet.y+bullet.height-Registry.player.y-Registry.player.height)<80 && FlxCollision.pixelPerfectCheck(bullet as FlxSprite,Registry.player as FlxSprite))
						{
							States.setDamagePlayerState(Actions.DAMAGE_NORMAL,Registry.player,15)
							bullet.kill()
						}
						//					   else
						//					   {
						
						//}
						// break
					}
				}
			}
			//			if(currentstate==Actions.DAMAGE_CATCH && finished)
			//			{
			//				currentstate=Actions.STATE_CATCH
			//			}
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
			
			
			if(currentstate==Actions.DAMAGE_CATCH || currentstate==Actions.ATTACK_CATCH || currentstate==Actions.ATTACK_NORMAL || currentstate==Actions.ATTACK_RUN || currentstate==Actions.ATTACK_THROW )
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
			if(value==currentstate || currentstate==Actions.ATTACK_SUPER )
			{
				//trace("aaa ")
				return
			}
			
			if(value==Actions.DAMAGE_NORMAL)
			{
				FlxG.play(Registry.roledamagemp3,10,false);
				velocity.x=0
				velocity.y=0	
			}
			if(value==Actions.DAMAGE_CATCH)
			{
				FlxG.play(Registry.roledamagemp3,10,false);
			}
			if( value==Actions.DAMAGE_THROWOUT)
			{
				FlxG.play(Registry.roledamagemp3,10,false);
				//FlxG.play(Registry.dropdown1mp3,10,false);
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
			if( (value==Actions.DROPDOWN_BACKFACE || value==Actions.DROPDOWN_FACE ))
			{
				FlxG.play(Registry.roledamagemp3,10,false);
				starty=y
				acceleration.y=520
				velocity.y=-250
				
				if(facing==FlxObject.LEFT){
					
					if(value==Actions.DROPDOWN_BACKFACE){
						velocity.y=-150
						velocity.x=-40}
					else{
						velocity.y=-250
						velocity.x=40}
				}
				else 
				{
					
					if(value==Actions.DROPDOWN_BACKFACE){
						velocity.y=-150
						velocity.x=40}
					else{
						velocity.y=-250
						velocity.x=-40}
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
					if(this.currentstate==Actions.DROPDOWN_BACKFACE){(Registry.player as Ninja).iscatch=false
						x-=10
						
					}
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
							var rndstate:int=Math.random()*8
							//var rndstate:int=3
							//							if(rndstate==0){
							//								setState(Actions.JUMP)
							//							}
							//							else if(rndstate==1){
							//								setState(Actions.ATTACK_JUMPATTACK1)
							//								
							//								if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
							//									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
							//								}
							//							}
							//							else if(rndstate==2){
							//								setState(Actions.ATTACK_JUMPATTACK2)
							//								if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
							//									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
							//								}
							//								
							//							}
							//							else if(rndstate==3){
							//								setState(Actions.ATTACK_RUNJUMP)
							//								if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
							//									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,20)
							//								}
							//							}
							if(rndstate==0){
								//FlxG.play(Registry.mmattack4mp3,10,false);
								velocity.y=0
								if(facing==FlxObject.LEFT)
								{
									velocity.x=-70
								}
								if(facing==FlxObject.RIGHT)
								{
									velocity.x=70
								}
								
								setState(Actions.ATTACK_CONTINUE)
								
						
							}
							else if(rndstate==1){
								//FlxG.play(Registry.mmdamage4mp3,10,false);
								//FlxG.play(Registry.mmattack3mp3,10,false);
								setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<40 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,25)
								}	
							}
							else if(rndstate==2){
								//FlxG.play(Registry.mmdamage4mp3,10,false);
								//FlxG.play(Registry.mmattack2mp3,10,false);
								setState(Actions.ATTACK_RUNJUMP)
//								if(FlxU.abs(y+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//									States.setDamagePlayerState(Actions.DAMAGE_NORMAL1,player,3)
//								}	
							}
							else if(rndstate==3){
							//	FlxG.play(Registry.mmattack1mp3,10,false);
//								var tmp1:Expolre=new Expolre(x,y,2,(this as FlxSprite).facing)
//								Registry.fxgroup.add(tmp1)
//								setState(Actions.ATTACK_THROW)
								velocity.y=0
								if(facing==FlxObject.LEFT)
								{
									velocity.x=-70
								}
								if(facing==FlxObject.RIGHT)
								{
									velocity.x=70
								}
								setState(Actions.ATTACK_THROW)
								
							}
							else if(rndstate==4){
								//FlxG.play(Registry.mmdamage4mp3,10,false);
								//FlxG.play(Registry.mmattack4mp3,10,false);
								this.loadGraphic(superpng,true,true,150,150,false)
								setState(Actions.ATTACK_SUPER)
//								if(FlxU.abs(y+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
//									States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,30)
//								}	
							}
							else if(rndstate>=5){
								//FlxG.play(Registry.mmattack5mp3,10,false);
								shoot.setFiringPosition(x,y,30,5)
								
								setState(Actions.ATTACK_RUN)
								//								if(FlxU.abs(starty+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
								//									States.setDamagePlayerState(Actions.DAMAGE_NORMAL1,player,15)
								//								}	
								
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
				FlxG.play(Registry.roledamagemp3,10,false);
				var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				f.setBody1(adeadpng,true,6,[0,0,1,1],150,150)
				
				Registry.deadobjects.add(f)
				
				
				
				
				this.kill()
				//return	
			}
			
			super.update();
		}
		
		
	}
}