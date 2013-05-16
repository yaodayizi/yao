package enemy
{
	import effect.HitEffectManager;
	
	import fensi.Fensi;
	
	import objects.GameObject;
	
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
     
	public class PrettySoldier extends Enemy
	{
		[Embed(source = '../img/sailor/mercury.png')] public   var mercurypng:Class;
		[Embed(source = '../img/sailor/moon.png')] public   var moonpng:Class;
		[Embed(source = '../img/sailor/mar.png')] public   var marpng:Class;
		[Embed(source = '../img/sailor/jupiter.png')] public   var jupiterpng:Class;
		[Embed(source = '../img/sailor/venus.png')] public   var venuspng:Class;
		[Embed(source = '../img/sailor/dianv2.png')] public   var dianv2png:Class;
        private var delayAI:FlxDelay
		private var findtarget:Boolean=false
		
		//public var type:int
		public function PrettySoldier(X:Number,Y:Number,Type:int)
		{
			x=X
			y=Y	
			stx=X
			sty=Y	
			//health=2
			maxlife=120
			health=	maxlife
			type=Type	
		//	this.loadGraphic(mercurypng,true,true,100,110,false)
		//	this.addAnimation("dead",[0,2,1,3,4,5,6,7],5,false)	
		//	play("dead")
		starty=y	
		if(type==0){	
		this.loadGraphic(mercurypng,true,true,130,120,false)
		this.addAnimation(Actions.STATE_CATCH,[62],0,false)	
		this.addAnimation(Actions.IDLE,[0],0,false)	
		this.addAnimation(Actions.POSE,[0,1,2],5,false)	
		this.addAnimation(Actions.ATTACK_SUPER,[3,4,5,6,7,8,9,10,11,12,13,14],10,false)	
		this.addAnimation(Actions.RUN,[15,16,17,18,19],10,false)
		this.addAnimation(Actions.WALK,[21,22,23,24,25,26,27,28,29,30,31,32],10,true)
		this.addAnimation(Actions.UP,[33,34,35,36,37,38,39,40],10,true)
		this.addAnimation(Actions.ATTACK_THROW,[45,44,43,42,41],10,false)	
		this.addAnimation(Actions.ATTACK_CATCH,[47,46],5,false)
		this.addAnimation(Actions.ATTACK_CONTINUE,[55,56,58,54,53,52,51,50,49,48],10,false)	
		this.addAnimation(Actions.ATTACK_RUNJUMP,[69,68,61,60,59,64],5,false)	
		this.addAnimation(Actions.JUMP,[69,68,67,66,64],5,false)
		this.addAnimation(Actions.ATTACK_JUMPATTACK1,[69,68,65,65,64],5,false)	
		this.addAnimation(Actions.ATTACK_JUMPATTACK2,[69,68,63,63,64],5,false)	
		//this.addAnimation(Actions.DAMAGE_CATCH,[57,62],5,false)
		this.addAnimation(Actions.DAMAGE_CATCH,[97,98,99],5,false)
		//this.addAnimation(Actions.DAMAGE_NORMAL,[71,71,70],6,false)
		this.addAnimation(Actions.DAMAGE_NORMAL,[90,91,92,93],6,false)
		this.addAnimation(Actions.DAMAGE_THROWOUT,[42,41,89,88,87,86,85,84,83,87,73,72],6,false)
		this.addAnimation(Actions.DROPDOWN_BACKFACE,[77,76,75,74,73,72],5,false)	
		this.addAnimation(Actions.DROPDOWN_FACE,[89,87,86,85,84,83,87,73,72],5,false)		
		this.addAnimation(Actions.ATTACK_RUN,[78,79],5,false)	
		this.addAnimation(Actions.ATTACK_NORMAL,[82,81,80],10,false)		
		}
		else if(type==1)
		{
			this.loadGraphic(moonpng,true,true,130,120,false)
			this.addAnimation(Actions.STATE_CATCH,[1],0,false)	
			this.addAnimation(Actions.IDLE,[57],0,false)	
			this.addAnimation(Actions.POSE,[57,58,59],5,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[39,40,41,42,43,44,45,46,47,48,49,50],10,false)	
			this.addAnimation(Actions.RUN,[51,52,53,54,55,56],10,false)
			this.addAnimation(Actions.WALK,[68,69,70,71,72,73,74,75,76,77,78,79],10,true)
			this.addAnimation(Actions.UP,[60,61,62,63,64,65,66,67],10,true)
			this.addAnimation(Actions.ATTACK_THROW,[17,18,19,20],10,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[16,15],5,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[85,86,89,88,87],10,false)	
			this.addAnimation(Actions.ATTACK_RUNJUMP,[24,23,22,22,22,21],5,false)	
			this.addAnimation(Actions.JUMP,[31,30,29,28,27,32],5,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[26,26,25,25],5,false)	
			this.addAnimation(Actions.ATTACK_JUMPATTACK2,[26,26,25,25],5,false)	
			this.addAnimation(Actions.DAMAGE_CATCH,[0,1],5,false)
			this.addAnimation(Actions.DAMAGE_NORMAL,[80,81,82,83,84],10,false)
			this.addAnimation(Actions.DAMAGE_THROWOUT,[19,14,13,12,11],6,false)
			this.addAnimation(Actions.DROPDOWN_BACKFACE,[2,3,4,5,6,7,8],5,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[14,13,12,11,10],2,false)		
			this.addAnimation(Actions.ATTACK_RUN,[35,36,36],5,false)	
			this.addAnimation(Actions.ATTACK_NORMAL,[38,37],10,false)		
		}
		else if(type==2)
		{
			this.loadGraphic(marpng,true,true,130,120,false)
			this.addAnimation(Actions.STATE_CATCH,[8],0,false)	
			this.addAnimation(Actions.IDLE,[49],0,false)	
			this.addAnimation(Actions.POSE,[49,50,51],5,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[52,53,54,55,56,57,58,59,60,61,62,63],10,false)	
			this.addAnimation(Actions.RUN,[64,65,66,67,68,69],10,true)
			this.addAnimation(Actions.WALK,[78,79,80,81,82,83,84,85,86,87,88,89],10,true)
			//this.addAnimation(Actions.WALK,[89,88,87,86,85,84,83,82,81,80,79,78],10,true)
			this.addAnimation(Actions.UP,[70,71,72,73,74,75,76,77],10,true)
			//this.addAnimation(Actions.UP,[77,76,75,74,73,72,71,70],10,true)
			this.addAnimation(Actions.ATTACK_THROW,[12,11,10,9],10,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[14,15],5,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[6,5,4,3,2,1,0],8,false)	
			this.addAnimation(Actions.ATTACK_RUNJUMP,[35,34,33,41],5,false)	
			this.addAnimation(Actions.JUMP,[46,45,44,43,42,41],5,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[38,39,40,41],5,false)	
			this.addAnimation(Actions.ATTACK_JUMPATTACK2,[37,36,36,41],5,false)	
			this.addAnimation(Actions.DAMAGE_CATCH,[8,7],5,false)
			this.addAnimation(Actions.DAMAGE_NORMAL,[90,91,92,93],10,false)
			this.addAnimation(Actions.DAMAGE_THROWOUT,[9,10,27,26,25,24],6,false)
			this.addAnimation(Actions.DROPDOWN_BACKFACE,[19,18,17,16],5,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[28,27,26,25,24,23,22,21,20],5,false)		
			this.addAnimation(Actions.ATTACK_RUN,[30,29,32,31],6,false)	
			this.addAnimation(Actions.ATTACK_NORMAL,[48,47],10,false)		
		}
		else if(type==3)
		{
			this.loadGraphic(jupiterpng,true,true,130,120,false)
			this.addAnimation(Actions.STATE_CATCH,[23],0,false)	
			this.addAnimation(Actions.IDLE,[74],0,false)	
			this.addAnimation(Actions.POSE,[74,75,76],5,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14],10,false)	
			this.addAnimation(Actions.RUN,[68,69,70,71,72,73],10,false)
			this.addAnimation(Actions.WALK,[48,49,50,51,52,53,54,55,56,57,58,59],10,true)
			//this.addAnimation(Actions.WALK,[89,88,87,86,85,84,83,82,81,80,79,78],10,true)
			this.addAnimation(Actions.UP,[60,61,62,63,64,65,66,67],10,true)
			//this.addAnimation(Actions.UP,[77,76,75,74,73,72,71,70],10,true)
			this.addAnimation(Actions.ATTACK_THROW,[37,38,39],10,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[36,35,34],5,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[17,16,15],8,false)	
			this.addAnimation(Actions.ATTACK_RUNJUMP,[30,30,30,42],5,false)	
			this.addAnimation(Actions.JUMP,[44,43,42],5,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[41,40,42],5,false)	
			this.addAnimation(Actions.ATTACK_JUMPATTACK2,[30,30,30,42],5,false)	
			this.addAnimation(Actions.DAMAGE_CATCH,[23,24],5,false)
			this.addAnimation(Actions.DAMAGE_NORMAL,[77,78,79,28],10,false)
			this.addAnimation(Actions.DAMAGE_THROWOUT,[37,38,20,21,22],6,false)
			this.addAnimation(Actions.DROPDOWN_BACKFACE,[27,26,25],5,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[20,21,22,10,18],2,false)		
			this.addAnimation(Actions.ATTACK_RUN,[32,31,33],6,false)	
			this.addAnimation(Actions.ATTACK_NORMAL,[45,46],10,false)		
		}
		else if(type==4)
		{
			this.loadGraphic(venuspng,true,true,130,120,false)
			this.addAnimation(Actions.STATE_CATCH,[9],0,false)	
			this.addAnimation(Actions.IDLE,[69],0,false)	
			this.addAnimation(Actions.POSE,[88,89,90],5,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[17,34,33,32,31,30,29,28,27,31,30,29,28,26,25],10,false)	
			this.addAnimation(Actions.RUN,[82,83,84,85,86,87],10,false)
			this.addAnimation(Actions.WALK,[43,44,45,46,47,48,49,50,51,52,53,54],10,true)
			//this.addAnimation(Actions.WALK,[89,88,87,86,85,84,83,82,81,80,79,78],10,true)
			this.addAnimation(Actions.UP,[74,75,76,77,78,79,80,81],10,true)
			//this.addAnimation(Actions.UP,[77,76,75,74,73,72,71,70],10,true)
			this.addAnimation(Actions.ATTACK_THROW,[15,14,13,12,11,10],10,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[15,0,2,1],5,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[24,23,22,21,20,19,18],8,false)	
			this.addAnimation(Actions.ATTACK_RUNJUMP,[35,36,37,29,28],5,false)	
			this.addAnimation(Actions.JUMP,[32,31,30,29,28],5,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[5,6,29,28],5,false)	
			this.addAnimation(Actions.ATTACK_JUMPATTACK2,[7,7,29,28],5,false)	
			this.addAnimation(Actions.DAMAGE_CATCH,[9,8],5,false)
			this.addAnimation(Actions.DAMAGE_NORMAL,[61,91,62,92,93],12,false)
			this.addAnimation(Actions.DAMAGE_THROWOUT,[15,14,59,57,58],6,false)
			this.addAnimation(Actions.DROPDOWN_BACKFACE,[62,68,67,65,64,63],5,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[59,58,57,56,55],2,false)		
			this.addAnimation(Actions.ATTACK_RUN,[71,72,73],6,false)	
			this.addAnimation(Actions.ATTACK_NORMAL,[69,70],10,false)		
		}
		else if(type==5)
		{
			this.loadGraphic(dianv2png,true,true,160,100,false)
			this.addAnimation(Actions.STATE_CATCH,[8],0,false)	
			this.addAnimation(Actions.IDLE,[2],0,false)	
			this.addAnimation(Actions.POSE,[2,3],5,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[28,27,26,25,24,23,22,21,20],10,false)	
			this.addAnimation(Actions.RUN,[2,2,3,3,4,4],10,false)
			this.addAnimation(Actions.WALK,[2,3,4],6,true)
			//this.addAnimation(Actions.WALK,[89,88,87,86,85,84,83,82,81,80,79,78],10,true)
			this.addAnimation(Actions.UP,[2,3,4],10,true)
			//this.addAnimation(Actions.UP,[77,76,75,74,73,72,71,70],10,true)
			this.addAnimation(Actions.ATTACK_THROW,[12,11,13,14,15],10,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[16,17,18],5,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[16,17,18],8,false)	
			this.addAnimation(Actions.ATTACK_RUNJUMP,[0,0,0,1,1,1],5,false)	
			this.addAnimation(Actions.JUMP,[0,0,0,1,1,1],5,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[0,0,1,1],5,false)	
			this.addAnimation(Actions.ATTACK_JUMPATTACK2,[0,0,1,1],5,false)	
			this.addAnimation(Actions.DAMAGE_CATCH,[6,7,8,9],5,false)
			this.addAnimation(Actions.DAMAGE_NORMAL,[6,7,8,9],12,false)
			this.addAnimation(Actions.DAMAGE_THROWOUT,[12,11,13,14,15],6,false)
			this.addAnimation(Actions.DROPDOWN_BACKFACE,[13,13,14,14,15],2,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[13,14,15],8,false)		
			this.addAnimation(Actions.ATTACK_RUN,[0,0,1,1],6,false)	
			this.addAnimation(Actions.ATTACK_NORMAL,[0,0,1,1],10,false)		
		}
		play(Actions.IDLE)
		delayAI=new FlxDelay(1000)
		delayAI.start() 	
		}
	
		
		public override function isinterrupt():Boolean
		{
			if((currentstate==Actions.WALK || currentstate==Actions.IDLE || currentstate==Actions.RUN || currentstate==Actions.STATE_CATCH))
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
				
			//if(acceleration.y==0){
				
			if(currentstate==Actions.JUMP || currentstate==Actions.ATTACK_JUMPATTACK1 || currentstate==Actions.ATTACK_JUMPATTACK2 || currentstate==Actions.ATTACK_RUNJUMP)
			{starty=y
			velocity.y=jumpspeed
			acceleration.y=420
			}
			else if(currentstate==Actions.DAMAGE_CATCH || currentstate==Actions.ATTACK_CATCH || currentstate==Actions.ATTACK_CONTINUE || currentstate==Actions.ATTACK_NORMAL || currentstate==Actions.ATTACK_RUN || currentstate==Actions.ATTACK_THROW || currentstate==Actions.POSE)
			{
				velocity.x=0
				velocity.y=0	
			}
			
		   if(currentstate==Actions.WALK){
			   if(velocity.y<0)
			   {
				   play(Actions.UP)
			   }
			   else
			   {
				   play(Actions.WALK)  
			   }
		   }
		  
		   else{
			//trace("waraa "+currentstate)
			   play(currentstate)
		   }
				}
		
		private function damagesound():void
		{
			if(type==0)
			{
				FlxG.play(Registry.mmdamage8mp3,10,false);
			}
			else if(type==1)
			{
				FlxG.play(Registry.mmdamage9mp3,10,false);
			}
			else if(type==2)
			{
				FlxG.play(Registry.mmdamage10mp3,10,false);
			}
			else if(type==3)
			{
				FlxG.play(Registry.mmdamage11mp3,10,false);
			}
			else if(type==4)
			{
				FlxG.play(Registry.mmdamage7mp3,10,false);
			}
			else if(type==5)
			{
				FlxG.play(Registry.mmdamage6mp3,10,false);
			}
		}
		private function catchdmsound():void
		{
			if(type==0)
			{
				FlxG.play(Registry.mmcatchdm2mp3,10,false);
			}
			else if(type==1)
			{
				FlxG.play(Registry.mmcatchdm3mp3,10,false);
			}
			else if(type==2)
			{
				FlxG.play(Registry.mmcatchdm4mp3,10,false);
			}
			else if(type==3 )
			{
				FlxG.play(Registry.mmcatchdm5mp3,10,false);
			}
			else if(type==4 || type==5)
			{
				FlxG.play(Registry.mmcatchdm1mp3,10,false);
			}
		}
		private function deadsound():void
		{
			if(type==0)
			{
				FlxG.play(Registry.mmdead8mp3,10,false);
			}
			else if(type==1)
			{
				FlxG.play(Registry.mmdead9mp3,10,false);
			}
			else if(type==2)
			{
				FlxG.play(Registry.mmdead10mp3,10,false);
			}
			else if(type==3)
			{
				FlxG.play(Registry.mmdead11mp3,10,false);
			}
			else if(type==4)
			{
				FlxG.play(Registry.mmdead7mp3,10,false);
			}
			else if(type==5)
			{
				FlxG.play(Registry.mmdead6mp3,10,false);
			}
		}
		private function dropsound():void
		{
			if(type==0)
			{
				FlxG.play(Registry.dropdown3mp3,10,false);
			}
			else if(type==1)
			{
				FlxG.play(Registry.dropdown4mp3,10,false);
			}
			else if(type==2)
			{
				FlxG.play(Registry.dropdown5mp3,10,false);
			}
			else if(type==3)
			{
				FlxG.play(Registry.dropdown2mp3,10,false);
			}
			else if(type==4)
			{
				FlxG.play(Registry.dropdown1mp3,10,false);
			}
			else if(type==5)
			{
				FlxG.play(Registry.mmdead7mp3,10,false);
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
				 damagesound()
			//Registry.bloodeffect.fire(x,y)
				 velocity.x=0
				 velocity.y=0	
			 }
			 if(value==Actions.DAMAGE_CATCH)
			 {
				 catchdmsound()
				 FlxG.play(Registry.mmcatchdm1mp3,10,false);
			 }
			 if( value==Actions.DAMAGE_THROWOUT)
			 {
				 deadsound()
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
				 dropsound()
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
		
		private function gamemodeone():void
		{
			facing=FlxObject.LEFT
			if(FlxVelocity.distanceBetween(this,Registry.player)<200 && this.acceleration.y==0){
				setState(Actions.ATTACK_RUNJUMP)
			}
			else if(this.acceleration.y==0 && currentstate!=Actions.RUN){
			setState(Actions.RUN)
			
			}
			
		}
		override public function update():void
		{
			if(gamemode==1){
			velocity.x=-50
			
			if(this.acceleration.y>0 && FlxU.abs(y+height-Registry.player1.y-Registry.player1.height)<50 && FlxCollision.pixelPerfectCheck(this as FlxSprite,Registry.player1 as FlxSprite)){
				States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player1,20)
			}
			if(x<-70)
			{
				x=stx
			    y=sty 
			}
			}
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
			if(gamemode==1){
				gamemodeone()
			}
			if(delayAI.hasExpired )
			{
//				if(gamemode==1){
//					//gamesmodeone()
//				}
				if(gamemode==0){
					if( isinterrupt()){
				var player:GameObject=Registry.player
					if(this.currentstate==Actions.DROPDOWN_BACKFACE){(Registry.player as Ninja).iscatch=false
					x-=10
						
					}
					var distance:Number=FlxVelocity.distanceBetween(Registry.player,this)
					if(distance<150)
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
						var rndstate:int=Math.random()*9
						//var rndstate:int=4
						if(rndstate==0){
				setState(Actions.JUMP)
				}
				else if(rndstate==1){
					setState(Actions.ATTACK_JUMPATTACK1)
				
					if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,10)
					}
				}
				else if(rndstate==2){
					setState(Actions.ATTACK_JUMPATTACK2)
					if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,30)
					}
				
				}
				else if(rndstate==3){
					setState(Actions.ATTACK_RUNJUMP)
					if(FlxU.abs(starty+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,45)
					}
				}
				else if(rndstate==4){
					setState(Actions.ATTACK_CONTINUE)
					if(FlxU.abs(y+height-player.y-player.height)<10 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,50)
					}	
				}
				else if(rndstate==5){
					setState(Actions.ATTACK_NORMAL)
					if(FlxU.abs(y+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DAMAGE_NORMAL,player,15)
					}	
				}
				else if(rndstate==6){
					setState(Actions.ATTACK_CATCH)
					if(FlxU.abs(y+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DAMAGE_NORMAL1,player,30)
					}	
				}
				else if(rndstate==7){
					setState(Actions.ATTACK_THROW)
					
				}
				else if(rndstate==8){
					setState(Actions.ATTACK_SUPER)
					if(FlxU.abs(y+height-player.y-player.height)<12 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DROPDOWN_FACE,player,30)
					}	
				}
				else if(rndstate==9){
					setState(Actions.ATTACK_RUN)
					if(FlxU.abs(starty+height-player.y-player.height)<6 && FlxCollision.pixelPerfectCheck(this as FlxSprite,player as FlxSprite)){
						States.setDamagePlayerState(Actions.DAMAGE_NORMAL1,player,15)
					}	
				}
						}
					}
					else{   //no find player
						
						var rnd:int=Math.random()*10
//						var mx:Number=Math.random()*FlxG.width
//						var my:Number=Math.random()*FlxG.height
					
						var mx:Number=Math.random()*300+leftx
						var my:Number=Math.random()*(downy-upy)+upy
						FlxVelocity.moveTowardsPoint(this,new FlxPoint(mx,my),speed)
					if(rnd<=7)
					{
						FlxVelocity.moveTowardsPoint(this,new FlxPoint(mx,my),speed)
						if(velocity.x<0){facing=FlxObject.LEFT}
						else if(velocity.x>0){facing=FlxObject.RIGHT}
						setState(Actions.WALK)
					}
					else if	(rnd==8)
					{
						FlxVelocity.moveTowardsPoint(this,new FlxPoint(mx,my),speed*2)
						if(velocity.x<0){facing=FlxObject.LEFT}
						else if(velocity.x>0){facing=FlxObject.RIGHT}
						setState(Actions.RUN)
					}
					else if	(rnd==9)
					{
						
						setState(Actions.POSE)
					}
					
						
						
						}
				} //----
					
					}
				delayAI.start()
			}
			if(health<=0 )
			{
				deadsound()
				var deadmethod:int=Math.random()*2
				if(gamemode==1){deadmethod=0}
					//var deadmethod:int=1
				if(type==0){
				if(deadmethod==0){
				var f:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
				//if(gamemode==1){f.starty=200}
				f.setBody1(Fensi.mercuryfs1png,true,6,[3,2,1,0],130,120)
				f.setBody2(Fensi.mercuryfs2png,true,6,[3,2,1,0],130,120)
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
					var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
					f1.setBody1(Fensi.moonfs1png,true,6,[3,2,2,2,1,1,0],130,120)
					f1.setBody2(Fensi.moonfs2png,true,6,[3,2,2,2,1,1,0],130,120)
					Registry.deadobjects.add(f1)
						/*
					if(deadmethod==0){
					var f1:fensi.Fensi=new Fensi(this.x,this.y,this.facing)
					f1.setBody1(Fensi.moonfs1png,true,6,[3,2,2,2,1,1,0],130,120)
					f1.setBody2(Fensi.moonfs2png,true,6,[3,2,2,2,1,1,0],130,120)
					Registry.deadobjects.add(f1)
					}
					else if(deadmethod==1)
					{
						var bone1:FlxSprite=new FlxSprite(x,y)
						bone1.loadGraphic(Registry,true,true,100,120)
						bone1.facing=facing
						bone1.addAnimation("dead", [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7],5, false);
						bone1.play("dead")
						Registry.deadobjects.add(bone1)
					}
						*/
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
			
super.update();
		}
	
	
	}
}