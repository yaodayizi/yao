

package enemy
{
	import fensi.Fensi;
	
	import objects.GameObject;
	
	import org.flixel.FlxCamera;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
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
	
	public class QueenBoss extends Enemy
	{
		
		[Embed(source = '../img/boss/queenboss1.png')] public   var queenpng:Class;
		[Embed(source = '../img/sailor/queendead.png')] public   var queendead1png:Class;
		//	[Embed(source = '../img/weapon/gunbullet.png')] public   var gunbulletpng:Class;
		//[Embed(source = '../img/sailor/superdead1.png')] public static  var superdead1png:Class;
		private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		private var daodan:FlxGroup	
		//public var type:int
		//	public var shoot:FlxWeapon
		private var sy:Number
		public function QueenBoss(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			health=1500
			maxlife=1500
			type=Type	
			starty=y	
			
			if(type==0){	
				this.loadGraphic(queenpng,true,true,300,200,false)
				this.addAnimation(Actions.STATE_CATCH,[18],0,false)	
				this.addAnimation(Actions.IDLE,[17],0,false)	
				//this.addAnimation(Actions.POSE,[4],0,false)	
				//this.addAnimation(Actions.ATTACK_SUPER,[59,60,26,27,28,29,30,31,32,25],10,false)	
				//this.addAnimation(Actions.RUN,[],10,false)
				this.addAnimation(Actions.WALK,[8,7,4,5,3],10,true)
				
				//this.addAnimation(Actions.DAMAGE_CATCH,[7,6,5,4],10,false)
				this.addAnimation(Actions.DAMAGE_NORMAL,[16,17,16,17],8,false)
				//this.addAnimation(Actions.DAMAGE_THROWOUT,[15,14,13,12,11,10,9,21,22,23],10,false)
				//this.addAnimation(Actions.DROPDOWN_BACKFACE,[27,28,29,30,31,32,33],8,false)	
				this.addAnimation(Actions.DROPDOWN_FACE,[7],8,false)	
				//this.addAnimation(Actions.RUN,[10,9,8,7,6,5],10,true)
				//this.addAnimation(Actions.ATTACK_RUN,[7,8,9,10,11,12,7,8,9,10,11,12,7,8,9,10,11,12],6,false) //枪	
				this.addAnimation(Actions.ATTACK_NORMAL,[0,9,11,12,13,14],10,false)		
				this.addAnimation(Actions.ATTACK_RUN,[1,1,2,2,3,4,1,1,2,2,3,4,1,2],10,false)		
			}
			
			play(Actions.IDLE)
			delayAI=new FlxDelay(1000)
			delayAI.start() 	
			
			
		}
		
		
		public override function isinterrupt():Boolean
		{
			if(currentstate==Actions.WALK || currentstate==Actions.IDLE  )
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
			
			//			if(currentstate==Actions.STATE_CATCH)
			//			{
			//				velocity.x=0
			//				velocity.y=0
			//				return
			//			}
			//&& FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)
			var player1:GameObject=Registry.player
			if(currentstate==Actions.ATTACK_RUN && !finished){
				if(player1.currentstate!=Actions.DROPDOWN_FACE && FlxU.abs(y+height-player1.y-player1.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player1 as FlxSprite) ){
					States.setDamagePlayerState(Actions.DROPDOWN_FACE,player1,1)
				}	
			}
			
			
			
			
			
			if(acceleration.y==0 && finished && currentstate!=Actions.WALK)
			{
				
				//				if(currentstate==Actions.DAMAGE_CATCH){
				//					setState(Actions.STATE_CATCH)
				//				}else {
				//play(Actions.IDLE)
				setState(Actions.IDLE)
				//}
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
			
			
			//if(currentstate==Actions.DAMAGE_CATCH  || currentstate==Actions.ATTACK_NORMAL  )
			if( currentstate==Actions.ATTACK_NORMAL  )
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
			//			if(value==Actions.DAMAGE_CATCH)
			//			{
			//				FlxG.play(Registry.mmdead2mp3,10,false);
			//			}
			/*
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
			*/
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
			//			if(b is Enemy)
			//			{
			//				
			//				if(FlxU.abs(a.y+a.height-b.y-b.height)<6 && FlxCollision.pixelPerfectCheck(a as FlxSprite,b as FlxSprite)){
			//					(b as Enemy).setDamageState(Actions.DROPDOWN_FACE,10)
			//				}
			//			}
		}
		override public function update():void
		{
			
			//			if(this.currentstate==Actions.DAMAGE_THROWOUT)
			//			{
			//				FlxG.overlap(this,Registry.gameobjects,throwhit)
			//			}
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
					if(distance<1050)
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
						//						if(FlxU.abs(this.y-Registry.player.y)<50 && FlxU.abs(this.x-Registry.player.x)<200 &&  rndmove==1){   //如果玩家在一条直线上,攻击他
						//							//if(FlxVelocity<200)
						//						}
						if(rndmove==0)
						{
//							var movex:Number=Math.random()*(Registry.player.x+100)
//							var movey:Number=Math.random()*(Registry.player.y+100)	
//							movex=movex>Registry.player.x-100?movex:Registry.player.x-100
//							movey=movey>Registry.player.y-100?movey:Registry.player.y-100
//							if(x-Registry.player.x>0){facing=FlxObject.LEFT}
//							else {facing=FlxObject.RIGHT}
//							FlxVelocity.moveTowardsPoint(this,new FlxPoint(movex,movey),speed)	
							FlxVelocity.moveTowardsPoint(this,new FlxPoint(Registry.player.x,Registry.player.y),speed)	
							setState(Actions.WALK)
						}
							
						else if(rndmove==1){
							var rndstate:int=Math.random()*2
							//var rndstate:int=0
							
							if(rndstate==0 && FlxU.abs(this.y+this.height-player.y-player.height)<50 && FlxU.abs(this.x+this.width-player.x-player.width)<200){
								FlxG.play(Registry.mmattack1mp3,10,false);
								setState(Actions.ATTACK_NORMAL)
								if(FlxU.abs(y+height-player.y-player.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
									States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,10)
								}	
							}
							else if(rndstate==1 && FlxU.abs(this.y+this.height-player.y-player.height)<50){
								FlxG.play(Registry.mmattack1mp3,10,false);
								setState(Actions.ATTACK_RUN)
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
				//	var dd:int=Math.random()*3
				//				if(dd==0){
				//					var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				//					f.setBody1(yadiandeadpng,true,6,[0,0,1,1],150,120)
				//					Registry.deadobjects.add(f)
				//				}
				//				else
				//				{
				var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				
				f1.setBody1(queendead1png)
				Registry.deadobjects.add(f1)
				//}
				
				
				//}
				
				
				
				this.kill()
				//return	
			}
			
			super.update();
		}
		
		
	}
}