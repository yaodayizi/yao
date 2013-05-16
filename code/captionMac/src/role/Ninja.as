package role
{
    import enemy.Enemy;
    import enemy.PrettySoldier;
    
    import flash.utils.getTimer;
    
    import objects.GameObject;
    
    import org.flixel.FlxG;
    import org.flixel.FlxObject;
    import org.flixel.FlxSprite;
    import org.flixel.FlxU;
    import org.flixel.plugin.photonstorm.FlxCollision;

	public class Ninja extends GameObject
	{
		[Embed(source = '../img/t.png')] public   var t:Class;
		[Embed(source = '../img/playrole/ninja.png')] public   var ninjapng:Class;
		[Embed(source = '../img/playrole/blade.png')] public   var bladepng:Class;
		[Embed(source = '../img/playrole/duizhang.png')] public   var duizhangpng:Class;
		[Embed(source = '../img/playrole/baby.png')] public   var babypng:Class;
		
	    public var isweapon:Boolean=false
		public var currentweapon:Weapon=null
		//	public var type:int
		public function Ninja(X:Number,Y:Number,Type:int)
		{
			//super(X,Y)
			
			speed=80
			x=X
			y=Y
			type=Type	
           this.maxlife=300
		health=this.maxlife
		if(type==2){
			this.loadGraphic(ninjapng,true,true,140,100)
			this.addAnimation("robot",[66],0,false)
			this.addAnimation(Actions.WEAPONPOSE,[50],0,false)
			this.addAnimation(Actions.WEAPONSHIT,[39,50],6,false)
			this.addAnimation(Actions.JUMP,[48,48,17,33,33,0,0],10,false)	
			this.addAnimation(Actions.WALK,[52,53,54,55,56,57,58],10,false)
			this.addAnimation(Actions.IDLE,[50],0,false)
			this.addAnimation(Actions.RUN,[40,41,42,43,44,45],10,false)
			this.addAnimation(Actions.ATTACK_NORMAL,[4,5,6],10,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[4,5,6,7,8,9,10,11,12,13,14,15],8,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[38,37],5,false)
			this.addAnimation(Actions.ATTACK_THROW,[37,36,35,34,33],5,false)
			this.addAnimation(Actions.ATTACK_RUN,[2,3,4],6,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[51,51,51,46],8,false)
			this.addAnimation(Actions.ATTACK_RUNJUMP,[18,19,19,19,46],8,false)
			this.addAnimation(Actions.STATE_CATCH,[39],0,false)	
			this.addAnimation(Actions.PICK,[59,35],5,false)	
			this.addAnimation(Actions.DAMAGE_NORMAL,[32,31,30,29],8,false)
			this.addAnimation(Actions.DAMAGE_NORMAL1,[28,27,26,25],8,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[60,61,61,62,62,63,64,65],20,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[25,25,24,24,24,23,23,23,22,22,22,22],6,false)	
			this.play("idle")
		}
		else if(type==0){
			this.loadGraphic(bladepng,true,true,150,120)
			this.addAnimation(Actions.JUMP,[15,15,16,16,17,17,18],12,false)	
			this.addAnimation(Actions.WALK,[59,60,61,62,63,64],10,false)
			this.addAnimation(Actions.IDLE,[19],0,false)
			this.addAnimation("robot",[69],0,false)
			this.addAnimation(Actions.WEAPONPOSE,[67],0,false)
			this.addAnimation(Actions.WEAPONSHIT,[68,67],6,false)
			this.addAnimation(Actions.RUN,[53,54,55,56,57,58],10,false)
			this.addAnimation(Actions.ATTACK_NORMAL,[19,20],15,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[20,21,22,23,24,25,26],8,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[51,50,49,48],10,false)
			this.addAnimation(Actions.ATTACK_THROW,[47,46,46,45,45],10,false)
			this.addAnimation(Actions.ATTACK_RUN,[8,9,9,9],6,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[6,6,7,7,7],8,false)
			this.addAnimation(Actions.ATTACK_RUNJUMP,[10,11,12,13,13],8,false)
			this.addAnimation(Actions.STATE_CATCH,[51],0,false)	
			this.addAnimation(Actions.PICK,[31,14],5,false)	
			this.addAnimation(Actions.DAMAGE_NORMAL,[44,43,42,41],8,false)
			this.addAnimation(Actions.DAMAGE_NORMAL1,[34,33,32],8,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[39,39,39,39,38,38,38,37,36,35,15],6,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[30,29,28,27,30,29,28,27,30,29,28,27,30,29,28,27,30,29,28,27],20,false)	
			this.play("idle")
		}
		else if(type==1){
			this.loadGraphic(duizhangpng,true,true,130,105)
			this.addAnimation("robot",[68],0,false)
			this.addAnimation(Actions.WEAPONPOSE,[34],0,false)
			this.addAnimation(Actions.WEAPONSHIT,[69,34],6,false)
			this.addAnimation(Actions.JUMP,[30,31,32,33],8,false)	
			this.addAnimation(Actions.WALK,[51,52,53,54,55,56,57,58],10,false)
			this.addAnimation(Actions.IDLE,[34],0,false)
			this.addAnimation(Actions.RUN,[45,46,47,48,49,50],10,false)
			this.addAnimation(Actions.ATTACK_NORMAL,[4,3,4],15,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[35,36,37,38,39,40,41,42,43,44],8,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[23,22,21,20],10,false)
			this.addAnimation(Actions.ATTACK_THROW,[19,18,17,16],10,false)
			this.addAnimation(Actions.ATTACK_RUN,[24,25,26],6,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[27,28,29],8,false)
			this.addAnimation(Actions.ATTACK_RUNJUMP,[0,1,2],8,false)
			this.addAnimation(Actions.STATE_CATCH,[23],0,false)	
			this.addAnimation(Actions.PICK,[34,59],5,false)	
			this.addAnimation(Actions.DAMAGE_NORMAL,[15,14,13,12],8,false)
			this.addAnimation(Actions.DAMAGE_NORMAL1,[15,14,13,12],8,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[11,10,9,9,9,8,7,6,5],8,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[60,61,62,63,64,65,66],10,false)	
			this.play("idle")
		}
		else if(type==3){
			this.loadGraphic(babypng,true,true,140,110)
			this.addAnimation("robot",[58],0,false)
			this.addAnimation(Actions.WEAPONPOSE,[48],0,false)
			this.addAnimation(Actions.WEAPONSHIT,[57,48],6,false)
			this.addAnimation(Actions.JUMP,[36,37,37,36],8,false)	
			this.addAnimation(Actions.WALK,[54,53,52,51,50,49],10,false)
			this.addAnimation(Actions.IDLE,[48],0,false)
			this.addAnimation(Actions.RUN,[55,56],10,false)
			this.addAnimation(Actions.ATTACK_NORMAL,[21,22],15,false)
			this.addAnimation(Actions.ATTACK_CONTINUE,[42,43,44,45,46,47],8,false)	
			this.addAnimation(Actions.ATTACK_CATCH,[9,8,7],10,false)
			this.addAnimation(Actions.ATTACK_THROW,[6,5,4,3],10,false)
			this.addAnimation(Actions.ATTACK_RUN,[41,40,39],6,false)
			this.addAnimation(Actions.ATTACK_JUMPATTACK1,[23,23,36],8,false)
			this.addAnimation(Actions.ATTACK_RUNJUMP,[34,33,32],8,false)
			this.addAnimation(Actions.STATE_CATCH,[9],0,false)	
			this.addAnimation(Actions.PICK,[1,2],5,false)	
			this.addAnimation(Actions.DAMAGE_NORMAL,[20,19,18],8,false)
			this.addAnimation(Actions.DAMAGE_NORMAL1,[20,19,18],8,false)	
			this.addAnimation(Actions.DROPDOWN_FACE,[17,16,16,15,15,14,14,13,12,11,10],8,false)	
			this.addAnimation(Actions.ATTACK_SUPER,[31,30,29,28,27,26,25,24],10,false)	
			this.play("idle")
		}
		}
	
	public function resetWeapon():void
	{
		isweapon=false
		//currentweapon=null
	}
		
	
		public function chancestate():void
		{
			
			if(currentstate==Actions.ATTACK_THROW)
			{
				if(finished){
				iscatch=false
				}
				else{
					velocity.x=0
					velocity.y=0	
				}
				}

			if(currentstate==Actions.ATTACK_NORMAL && finished){
			FlxG.play(Registry.blademp3,10,false);}
			if(currentstate==Actions.WALK || currentstate==Actions.RUN  || currentstate==Actions.STATE_CATCH )
			{
				//play(Actions.IDLE)
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
			if(isweapon){
				States.setState(Actions.WEAPONPOSE,this)
			}else{
				States.setState(Actions.IDLE,this)
			}	
			}
		}
		private function userobot(a:FlxObject,b:FlxObject):void
		{
//			if(b is Item && FlxU.abs(a.y+a.height-b.y-b.height)<6)
//			{
//				Registry.robot.x=b.x
//				Registry.robot.x=b.y	
//				b.exists=false
//				Registry.robot.exists=true	
//				//(Registry.robot as Robot).isuse=true 
//				Registry.player1.exists=false
//				Registry.player=Registry.robot
//			}
			if(b is Robot && b.exists && FlxU.abs(a.y+a.height-b.y-b.height)<6)
			{
			
				(b as Robot).isuse=true
				isrobot=true
			//	(b as Robot).leftx=this.leftx
					//(b as Robot).
					
				//Registry.player1.exists=false
				//Registry.player1.
				Registry.player=(b as Robot)
				Registry.player.leftx=this.leftx
				Registry.player.rightx=this.rightx	
			}
		}
		private function pickweapon():void
		{
			for each(var w:GameObject in Registry.gameobjects.members)
			{
				if((w is Weapon) && w.alive && !w.isuse && w.exists && FlxCollision.pixelPerfectCheck(this as FlxSprite,w as FlxSprite)) 
				{
					if(isweapon){
						currentweapon.diuqiweapon()
					}
					currentweapon=w as Weapon
					isweapon=true
				w.x=x
				w.y=y
				w.isuse=true	
				States.setState(Actions.PICK,this)
				break
				}
				
				if(w is ItemBox && w.exists &&  w.currentstate==Actions.IDLE && FlxCollision.pixelPerfectCheck(this as FlxSprite,w as FlxSprite))
				{
					(w as ItemBox).setDamageState("broken",0)
				break
				}
				if(w is ItemBox && !w.exists)
				{
					Registry.gameobjects.remove(w)
				}
				if(w is Food && FlxCollision.pixelPerfectCheck(this as FlxSprite,w as FlxSprite))
				{
					var tmplife:int=health+(w as Food).getLife()
					health=(tmplife>maxlife)? maxlife:tmplife
					Registry.gameobjects.remove(w)
					break
				}
			
			}
		}
		
		private function checkCatch():void
		{
			//			   if(FlxU.abs(a.x+a.width-b.x-b.width)<10 && (b as PrettySoldier).isinterrupt() && Registry.player.currentstate!=Actions.RUN){
			//			   if(!Registry.player.iscatch){Registry.player.iscatch=true
			//				   Registry.player.catchtarget=null
			//				   Registry.player.catchtarget=b as PrettySoldier
			//			   Registry.player.catchtarget.setState(Actions.STATE_CATCH)
			//			   return
			//				   }
			
		if(!iscatch){
			
			for each(var m:GameObject in Registry.gameobjects.members)
			{
				//&& FlxU.abs(m.x+m.width-x-width)<10 && FlxU.abs(m.y+m.height-y-height)<10
				if(m!=null && m.exists && (m is Enemy)  && FlxU.abs(m.x+m.width-x-width)<10 && FlxU.abs(m.y+m.height-y-height)<10 &&  (m as Enemy).isinterrupt() && currentstate!=Actions.RUN){
					
					if(!m.iscatch  )
					{
					//catchtarget=m
					catchtarget=m as Enemy
					catchtarget.setState(Actions.STATE_CATCH)
					iscatch=true
				
					break
				}    
				}
			}
		  }  //iscatch
		else
		{
			States.setState(Actions.STATE_CATCH,this)
			if((catchtarget.currentstate!=Actions.STATE_CATCH  && catchtarget.currentstate!=Actions.DAMAGE_CATCH && catchtarget.currentstate!=Actions.DAMAGE_THROWOUT) || catchtarget.exists==false)
			{
				iscatch=false
				catchtarget=null
			if(currentstate==Actions.STATE_CATCH)
			{
				currentstate=Actions.IDLE
			}
			}
		}
		
		
		}
		override public function update():void
		{
			if(isrobot){
			//y-=30	
			play("robot")
			return
			}
//			if(this.currentstate==Actions.ATTACK_NORMAL && !finished)
//			{
				//return
			//}
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
			else if(y>downy && this.acceleration.y==0)
			{
				y=downy
			}
			
			checkCatch()
			if( this.acceleration.y>0 && velocity.y>0 && y>starty )
			{
				if(this.currentstate!=Actions.DROPDOWN_FACE){
				FlxG.overlap(Registry.player,Registry.gameobjects,userobot)
				}
				velocity.x=0
			velocity.y=0
			acceleration.y=0
				
			}
			chancestate()
			
			if(!iscatch && currentstate!=Actions.DAMAGE_NORMAL   && currentstate!=Actions.DROPDOWN_FACE){
				//测试
				if (FlxG.keys.J && FlxG.keys.K )
				{
					States.setState(Actions.ATTACK_SUPER,this)
				}
				
				if (FlxG.keys.justPressed("J") )
				{
					//isattack=true
					pickweapon()
					
					if(!isrun){
						if(acceleration.y!=0)
						{
							States.setState(Actions.ATTACK_JUMPATTACK1,this)
						}
						else if(!iscontinue){
							if(this.isweapon && currentstate!=Actions.PICK){
								States.setState(Actions.WEAPONSHIT,this)
								currentweapon.fire()}
								
							else{
								trace("ni ma b gong ji  wei he bu xing")
								States.setState(Actions.ATTACK_NORMAL,this)}
							velocity.x=0
							velocity.y=0	
						}
						else{
							if(this.isweapon && currentstate!=Actions.PICK){
								States.setState(Actions.WEAPONSHIT,this)
								currentweapon.fire()}
							else{
								States.setState(Actions.ATTACK_CONTINUE,this)}
						}
					}
					else
					{
						if(acceleration.y!=0)
						{
							States.setState(Actions.ATTACK_RUNJUMP,this)
						}else{
							isrun=false
							States.setState(Actions.ATTACK_RUN,this)
						}
					}
				}
					
				else if (FlxG.keys.justPressed("K") )
				{
					//trace("fuck me")
					//States.setDamagePlayerState(Actions.DAMAGE_NORMAL,this,10)
					States.setState(Actions.JUMP,this)
					
				}
				
				if(FlxG.keys.justPressed("A") )
			{
				justrun()
			}
			else if(FlxG.keys.justPressed("D") )
			{
				justrun()
			}
			
			if (FlxG.keys.A && this.acceleration.y==0)
			{
				facing=FlxObject.LEFT
			
			
		 if(!isrun){
				velocity.x=-this.speedx
			}
			else{
				velocity.x=-this.speedx*2
				}
			}
			else if (FlxG.keys.D && this.acceleration.y==0)
			{
				facing=FlxObject.RIGHT
				
					
				
			 if(!isrun){
					velocity.x=this.speedx
						}
				else{
					velocity.x=this.speedx*2
				}		
			}
			
			if (FlxG.keys.W && this.acceleration.y==0 && this.gamemode==0)
			{
				if(!isrun){
					velocity.y=-this.speedy
				}
				else{
					velocity.y=-this.speedy*2
				}				
			}
			else if (FlxG.keys.S && this.acceleration.y==0 && this.gamemode==0)
			{
				if(!isrun){
					velocity.y=this.speedy
					}
				else{
					velocity.y=this.speedy*2
					}			
			}
		

		
			
			
			}
			if(iscatch && currentstate!=Actions.DAMAGE_NORMAL   && currentstate!=Actions.DROPDOWN_FACE)
			{
				
				//catchtarget.setState(Actions.STATE_CATCH)
									if (FlxG.keys.justPressed("J"))
									{
									if(FlxG.keys.A){
										facing=FlxObject.LEFT
										catchtarget.facing=FlxObject.LEFT
										States.setState(Actions.ATTACK_THROW,this)
										iscatch=false
											//catchtarget.setDamageState(Actions.DROPDOWN_FACE,10)
									}
									else if(FlxG.keys.D){
										facing=FlxObject.RIGHT
										catchtarget.facing=FlxObject.RIGHT
										States.setState(Actions.ATTACK_THROW,this)
										//catchtarget.setDamageState(Actions.DROPDOWN_FACE,10)
										iscatch=false
									}
									else
									  {
										States.setState(Actions.ATTACK_CATCH,this)
									 //   catchtarget.setDamageState(Actions.DAMAGE_CATCH,1)
									}
									//pan duN 
								 if(currentstate==Actions.ATTACK_CATCH){
										catchtarget.setDamageState(Actions.DAMAGE_CATCH,2)
									 }
									 else if(currentstate==Actions.ATTACK_THROW){
										 catchtarget.setDamageState(Actions.DAMAGE_THROWOUT,10)
								     if(finished){
										 iscatch=false
									 }
									 }
									trace("ccxv "+currentstate)

									
									}
				
									
			}
			
			if(velocity.x==0 && velocity.y==0 && (currentstate==Actions.WALK || currentstate==Actions.RUN ))
			{
				isrun=false
				//else{
				if(isweapon){
				States.setState(Actions.WEAPONPOSE,this)
				}
				else{
				States.setState(Actions.IDLE,this)
				}
			}
			else if((currentstate==Actions.ATTACK_NORMAL || currentstate==Actions.ATTACK_THROW || currentstate==Actions.WEAPONSHIT || currentstate==Actions.ATTACK_CONTINUE) && !finished)
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
				
			super.update();
		}
	
	}
}