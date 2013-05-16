

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
	
	public class Supergirl2 extends Enemy
	{
		
		[Embed(source = '../img/sailor/supergirl2.png')] public   var supergirl2png:Class;
		//	[Embed(source = '../img/weapon/gunbullet.png')] public   var gunbulletpng:Class;
		[Embed(source = '../img/sailor/supergirldead2.png')] public static  var superdead2png:Class;
		[Embed(source = '../music/spgirlpose.mp3')] public static var posemp3:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		//public var type:int
		//	public var shoot:FlxWeapon
		private var sy:Number
		public function Supergirl2(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			maxlife=200
			
			health=maxlife
			type=Type	
			
			starty=y	
			if(type==0){	
				this.loadGraphic(supergirl2png,true,true,150,160,false)
				this.addAnimation(Actions.STATE_CATCH,[22],0,false)	
				this.addAnimation(Actions.IDLE,[29],0,false)	
				//this.addAnimation(Actions.POSE,[4],0,false)	
				//this.addAnimation(Actions.ATTACK_SUPER,[59,60,26,27,28,29,30,31,32,25],10,false)	
				//this.addAnimation(Actions.RUN,[],10,false)
				this.addAnimation(Actions.WALK,[28,27,26,25,24,23],10,true)
				
				this.addAnimation(Actions.DAMAGE_CATCH,[19,21,20],10,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[19,18,17,16,15],8,false)
				this.addAnimation(Actions.DAMAGE_THROWOUT,[14,13,12,11,10,9,8,7,6],10,false)
				//this.addAnimation(Actions.DROPDOWN_BACKFACE,[27,28,29,30,31,32,33],8,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[14,13,12,11,10,9,8,7,6],8,false)	
				//this.addAnimation(Actions.RUN,[10,9,8,7,6,5],10,true)
				//this.addAnimation(Actions.ATTACK_RUN,[7,8,9,10,11,12,7,8,9,10,11,12,7,8,9,10,11,12],6,false) //枪	
				this.addAnimation(Actions.ATTACK_NORMAL,[5,4,3,2,1,2,1,2,1,2,1,2,1,2,1,0],6,false)		
				
			}
			
			play(Actions.IDLE)
			delayAI=new FlxDelay(3000)
			delayAI.start() 	
			
		}
		
		
		public override function isinterrupt():Boolean
		{
			//|| currentstate==Actions.STATE_CATCH
			if(currentstate==Actions.WALK || currentstate==Actions.IDLE  || currentstate==Actions.STATE_CATCH)
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
			
			
			if(currentstate==Actions.DAMAGE_CATCH  || currentstate==Actions.ATTACK_NORMAL  )
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
			FlxG.play(Registry.hitblademp3,10,false);
			
			if(value==Actions.DAMAGE_NORMAL)
			{
				velocity.x=0
				velocity.y=0	
				FlxG.play(Registry.mmdamage2mp3,10,false);
			}
			if(value==Actions.DAMAGE_CATCH)
			{
				FlxG.play(Registry.mmdamage1mp3,10,false);
			}
			if( value==Actions.DAMAGE_THROWOUT)
			{
				FlxG.play(Registry.dropdown1mp3,10,false);
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
				FlxG.play(Registry.dropdown1mp3,10,false);
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
							//var rndstate:int=Math.random()*5
							var rndstate:int=0
							
							if(rndstate==0){
								FlxG.play(posemp3,10,false);
								setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,40)
								}	
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
				FlxG.play(Registry.mmdead1mp3,10,false);
				var dd:int=Math.random()*3
				//				if(dd==0){
				//					var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				//					f.setBody1(yadiandeadpng,true,6,[0,0,1,1],150,120)
				//					Registry.deadobjects.add(f)
				//				}
				//				else
				//				{
				var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				if(dd==0){
					f1.setBody1(superdead2png,true,6,[0,1,2,3,4,5],120,150)
					Registry.deadobjects.add(f1)
				}
				else if(dd==1)
				{
					f1.setBody1(superdead2png,true,6,[0,1,2,3,4],120,150)
					Registry.deadobjects.add(f1)
				}
				else
				{
					var bone:FlxSprite=new FlxSprite(x,y)
					bone.loadGraphic(superdead2png,true,true,120,150)
					bone.facing=facing
					bone.addAnimation("dead", [6,6,7,7,8,8,8,9],5, false);
					bone.play("dead")
					Registry.deadobjects.add(bone)
				}
				
				//}
				
				
				
				this.kill()
				//return	
			}
			
			super.update();
		}
		
		
	}
}