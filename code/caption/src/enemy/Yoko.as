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
	
	public class Yoko extends Enemy
	{
		
		[Embed(source = '../img/boss/yoko.png')] public   var yokopng:Class;
	//	[Embed(source = '../img/weapon/gunbullet.png')] public   var gunbulletpng:Class;
		[Embed(source = '../img/sailor/yokodead.png')] public static  var yokodeadpng:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
	//	public var type:int
	//	public var shoot:FlxWeapon
		private var sy:Number
		public function Yoko(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			
			maxlife=800
			health=maxlife
			type=Type	
			
			starty=y	
			if(type==0){	
				this.loadGraphic(yokopng,true,true,155,170,false)
				this.addAnimation(Actions.STATE_CATCH,[21],0,false)	
				this.addAnimation(Actions.IDLE,[43],0,false)	
				//this.addAnimation(Actions.POSE,[4],0,false)	
				//this.addAnimation(Actions.ATTACK_SUPER,[59,60,26,27,28,29,30,31,32,25],10,false)	
				//this.addAnimation(Actions.RUN,[],10,false)
				this.addAnimation(Actions.WALK,[16,15,14,13,12,11],10,true)
				//this.addAnimation(Actions.UP,[],10,true)
				//this.addAnimation(Actions.ATTACK_THROW,[53,54,55,56,57,58],8,false)	//bo
				//this.addAnimation(Actions.ATTACK_CATCH,[59,60,61,62,63,64],10,false)
				//this.addAnimation(Actions.ATTACK_CONTINUE,[24,23,22,21,20,19,18,17,16,15,14,13,12,11,10,9,8,7,6,5,25,4],10,false)	
				//this.addAnimation(Actions.ATTACK_RUNJUMP,[69,68,61,60,59,64],5,false)	
				//this.addAnimation(Actions.JUMP,[69,68,67,66,64],5,false)
				//this.addAnimation(Actions.ATTACK_JUMPATTACK1,[69,68,65,65,64],5,false)	
				//this.addAnimation(Actions.ATTACK_JUMPATTACK2,[69,68,63,63,64],5,false)	
				this.addAnimation(Actions.DAMAGE_CATCH,[24,23,22],8,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[21,22,23,24,25,26],15,false)
				this.addAnimation(Actions.DAMAGE_THROWOUT,[27,28,29,30,31,32,33],10,false)
				//this.addAnimation(Actions.DROPDOWN_BACKFACE,[27,28,29,30,31,32,33],8,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[27,28,29,30,31,32,33],8,false)	
				this.addAnimation(Actions.RUN,[10,9,8,7,6,5],10,true)
				this.addAnimation(Actions.ATTACK_RUN,[42,41,40,39,38,37,36,35,34],8,false) //枪	
				this.addAnimation(Actions.ATTACK_NORMAL,[43,44,45,46,47],10,false)		
				this.addAnimation(Actions.JUMP,[2,2,1,1,0],5,false)
				this.addAnimation("dang",[4,4,4,4,3,3,3,3],5,false)
				this.addAnimation("move",[20,19,18,17,20,19,18,17],5,false)
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
			if(currentstate==Actions.WALK || currentstate==Actions.IDLE || currentstate==Actions.STATE_CATCH  || currentstate==Actions.RUN)
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
//			if(currentstate==Actions.ATTACK_CONTINUE && finished){
//				//if(FlxU.abs(y+height-Registry.player.y-Registry.player.height)<10 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player as FlxSprite)){
//					States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,20)
//				}	
			if(currentstate==Actions.ATTACK_RUN && finished){
				
				States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,100)
				this.y+=30
					/*
			
				if(facing==FlxObject.LEFT){
					shoot.fireFromAngle(165+Math.random()*25)}
				else{shoot.fireFromAngle(Math.random()*25)}
				
				shoot.setBulletSpeed(400)
				shoot.fire()
				for each(var bullet:FlxObject in shoot.group.members)
				{
					
					if(bullet.exists )
					{
						if(FlxU.abs(bullet.y+bullet.height-Registry.player.y-Registry.player.height)<80 && FlxCollision.pixelPerfectCheck(bullet as FlxSprite,Registry.player as FlxSprite))
						{
							States.setDamagePlayerState(Actions.DAMAGE_NORMAL,Registry.player,5)
							bullet.kill()
						}
						
					}
				}
			*/
			}
			if(currentstate=="move" && finished){
			velocity.x=0
			velocity.y=0
				setState(Actions.ATTACK_NORMAL)
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
			if(currentstate=="dang" && !finished){
				return
			}
			
			if(value==Actions.DAMAGE_NORMAL)
			{
				FlxG.play(Registry.mmdamage3mp3,10,false);
				velocity.x=0
				velocity.y=0	
			}
			if(value==Actions.DAMAGE_CATCH)
			{
				
				FlxG.play(Registry.mmcatchdm1mp3,10,false);
			}
			
			if( value==Actions.DAMAGE_THROWOUT)
			{
				FlxG.play(Registry.dropdown2mp3,10,false);
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
				FlxG.play(Registry.dropdown2mp3,10,false);
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
						//var rndmove:int=4
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
							//var rndstate:int=1
								
							
							 if(rndstate==0){
								 FlxG.play(Registry.mmattack10mp3,10,false);
								 setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<30 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,20)
								}	
							}
							
							else if(rndstate==1){
								//shoot.setFiringPosition(x,y,30,30)
								FlxG.play(Registry.mmattack11mp3,10,false);
								this.y-=30
								FlxG.play(Registry.missleshit,10,false);
								setState(Actions.ATTACK_RUN)
									}
							else if(rndstate==2){
								//shoot.setFiringPosition(x,y,30,30)
								//this.y-=30
								FlxG.play(Registry.mmattack12mp3,10,false);
								setState("move")
								if(x-player.x<0){facing=FlxObject.RIGHT}
								else{facing=FlxObject.LEFT}
								FlxVelocity.moveTowardsPoint(this,new FlxPoint(player.x,player.y),speed*3)
							}
							else if(rndstate==3){
								//shoot.setFiringPosition(x,y,30,30)
								FlxG.play(Registry.mmattack13mp3,10,false);
								velocity.x=0
								velocity.y=0	
								if(x-player.x<0){facing=FlxObject.RIGHT}
								else{facing=FlxObject.LEFT}
								//this.y-=30
								setState("dang")
							
							}
							else if(rndstate==4){
								//shoot.setFiringPosition(x,y,30,30)
								//this.y-=30
								FlxG.play(Registry.mmattack1mp3,10,false);
								setState(Actions.RUN)
								if(x-player.x<0){facing=FlxObject.RIGHT}
								else{facing=FlxObject.LEFT}
								FlxVelocity.moveTowardsPoint(this,new FlxPoint(player.x,player.y),speed*2)
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
				FlxG.play(Registry.mmdead4mp3,10,false);
				var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				f.setBody1(yokodeadpng,true,6,[0,1,2,3],150,150)
				
				Registry.deadobjects.add(f)
				
				
				
				
				this.kill()
				//return	
			}
			
			super.update();
		}
		
		
	}
}