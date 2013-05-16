

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
	
	public class Nakururu extends Enemy
	{
		
		[Embed(source = '../img/boss/nakururu.png')] public   var nakupng:Class;
		//	[Embed(source = '../img/weapon/gunbullet.png')] public   var gunbulletpng:Class;
		[Embed(source = '../img/sailor/nakudead.png')] public static  var superdead1png:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		//public var type:int
		//	public var shoot:FlxWeapon
		private var sy:Number
		public function Nakururu(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			maxlife=150
			health=maxlife
			type=Type	
			
			starty=y	
			if(type==0){	
				this.loadGraphic(nakupng,true,true,120,120,false)
				this.addAnimation(Actions.STATE_CATCH,[46],0,false)	
				this.addAnimation(Actions.IDLE,[52],0,false)	
				//this.addAnimation(Actions.POSE,[4],0,false)	
				//this.addAnimation(Actions.ATTACK_SUPER,[59,60,26,27,28,29,30,31,32,25],10,false)	
				//this.addAnimation(Actions.RUN,[],10,false)
				this.addAnimation(Actions.WALK,[13,14,15,16,17,18,19,20,21],10,true)
				
				this.addAnimation(Actions.DAMAGE_CATCH,[51,50,49,48,47],10,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[51,50,49,48,47,46,45,44,43,42,41],20,false)
				this.addAnimation(Actions.DAMAGE_THROWOUT,[34,33,32,31,30,29,28,27,26,25,24,23,22],8,false)
				//this.addAnimation(Actions.DROPDOWN_BACKFACE,[27,28,29,30,31,32,33],8,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[34,33,32,31,30,29,28,27,26,25,24,23,22],8,false)	
				//this.addAnimation(Actions.RUN,[10,9,8,7,6,5],10,true)
				//this.addAnimation(Actions.ATTACK_RUN,[7,8,9,10,11,12,7,8,9,10,11,12,7,8,9,10,11,12],6,false) //枪	
				this.addAnimation(Actions.ATTACK_NORMAL,[12,11,10,9,8,7,6,5,4,3,2,1,0],10,false)		
				
			}
			
			play(Actions.IDLE)
			delayAI=new FlxDelay(1000)
			delayAI.start() 	
			
		}
		
		
		public override function isinterrupt():Boolean
		{
			if(currentstate==Actions.WALK || currentstate==Actions.IDLE || currentstate==Actions.STATE_CATCH )
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
				FlxG.play(Registry.mmdamage1mp3,10,false);
				velocity.x=0
				velocity.y=0	
			}
			if(value==Actions.DAMAGE_CATCH)
			{
				FlxG.play(Registry.mmdead2mp3,10,false);
			}
			if( value==Actions.DAMAGE_THROWOUT)
			{
				//FlxG.play(Registry.mmdamage1mp3,10,false);
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
								FlxG.play(Registry.mmattack1mp3,10,false);
								setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,45)
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
				FlxG.play(Registry.mmdead3mp3,10,false);
				//var dd:int=Math.random()*3
				
				var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				//if(dd==0){
					f1.setBody1(superdead1png,true,6,[0,1,2,3],120,120)
					Registry.deadobjects.add(f1)
				//}
//				else if(dd==1)
//				{
//					f1.setBody1(superdead1png,true,6,[0,1,2,3,4],120,150)
//					Registry.deadobjects.add(f1)
//				}
//				else
//				{
//					var bone:FlxSprite=new FlxSprite(x,y)
//					bone.loadGraphic(superdead1png,true,true,120,150)
//					bone.facing=facing
//					bone.addAnimation("dead", [6,6,7,7,8,8,8,9],5, false);
//					bone.play("dead")
//					Registry.deadobjects.add(bone)
//				}
//				
				
				
				
				
				this.kill()
				//return	
			}
			
			super.update();
		}
		
		
	}
}