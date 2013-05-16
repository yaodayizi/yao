package
{
	import enemy.Enemy;
	import enemy.PrettySoldier;
	
	import objects.GameObject;
	
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSound;
	import org.flixel.FlxSprite;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxWeapon;
	
	import role.Ninja;

	public class Weapon extends GameObject
	{
		[Embed(source = '../img/weapon/hjt.png')] public   var hjtPNG:Class;
		[Embed(source = '../img/weapon/hjtbullet.png')] public   var hjtbulletPNG:Class;
		[Embed(source = '../img/weapon/feibiao.png')] public   var  feibiaoPNG:Class;
		[Embed(source = '../img/weapon/bullet2.png')] public   var  bullet2PNG:Class;
		[Embed(source = '../img/weapon/humer.png')] public   var    humerPNG:Class;
		[Embed(source = '../img/weapon/jiqiang.png')] public   var  jiqiangPNG:Class;
		[Embed(source = '../img/weapon/watergun.png')] public   var watergunPNG:Class;
		[Embed(source = '../img/weapon/yungun.png')] public   var   yungunPNG:Class;
		//新增加4种抢
		[Embed(source = '../img/weapon/shortgun.png')] public   var   shortgunPNG:Class;
		[Embed(source = '../img/weapon/longgun.png')] public   var   longgunPNG:Class;
		[Embed(source = '../img/weapon/firegun.png')] public   var   firegunPNG:Class;
		[Embed(source = '../img/weapon/misslegun.png')] public   var   misslegunPNG:Class;
		//子弹
		[Embed(source = '../img/weapon/hjpbullet.png')] public   var   hjpPNG:Class; //hjp
		[Embed(source = '../img/weapon/bullet3.png')] public   var   b3PNG:Class; //long
		[Embed(source = '../img/weapon/gunbullet.png')] public   var shortgunpng:Class;
		private var ey:Number
		//public var type:int
		public var canpick:Boolean=false
		public var lifespan:Number=10000
		public var expiresTime:uint;
		public var isfire:Boolean=false
        public var shoot:FlxWeapon
		public var count:int=0
		private var sx:Number
		private var sy:Number
		
		
		public function Weapon(X:Number,Y:Number,endY:Number,Type:int)
		{
		//	super(X,Y)
			x=X
			y=Y	
			type=Type 
			ey=endY	
			count=10	
			//this.acceleration.y=420
			if(type==0){
				this.loadGraphic(hjtPNG,true,true,100,100)
				this.addAnimation(Actions.WALK,[1,2,3,4],6,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[1],0,false)
				this.addAnimation(Actions.JUMP,[6,5,7,8],5,false)
				this.addAnimation("fire",[9,10],10,false)
				this.addAnimation("diuqi",[8,7,6,5,4,8,7,0],10,false)
				play("nopick")
				shoot=new FlxWeapon("hjt", this, "x", "y");
//				shoot.onPreFireSound=new FlxSound()
//				shoot.onPreFireSound.loadEmbedded(Registry.missleshit)
					
				shoot.makeAnimatedBullet(1,hjtbulletPNG, 50, 20, [0,1], 2, true,0,0);
				shoot.setBulletGravity(0,220);
				//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
				shoot.setBulletLifeSpan(3000)
				shoot.setFireRate(1000);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
				shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
			}
		//shortgun
			else if(type==1){
				//count=200
				this.loadGraphic(shortgunPNG,true,true,65,20)
				this.addAnimation(Actions.WALK,[1],0,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[1],0,false)
				this.addAnimation(Actions.JUMP,[1],0,false)
				this.addAnimation("fire",[1],5,false)
				this.addAnimation("diuqi",[0],0,false)
				play("nopick")
				
				shoot=new FlxWeapon("shortgun", this, "x", "y");
				//shoot.makePixelBullet(8, 2, 2, 0xffffffff, 0, 0);
				
				shoot.makeImageBullet(15,shortgunpng)
				shoot.setBulletLifeSpan(1000)
				shoot.setFireRate(40);
				shoot.setBulletBounds(new FlxRect(0, 0, 3000, 500));
				//shoot.
				shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
			}
			//水枪
			else if(type==2){
				this.loadGraphic(watergunPNG,true,true,50,40)
				this.addAnimation(Actions.WALK,[1,2,5,4],6,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[1],0,false)
				this.addAnimation(Actions.JUMP,[1,2,5,4],5,false)
				this.addAnimation("fire",[4],5,false)
				this.addAnimation("diuqi",[1,2,5,4,1,2,5,4],10,false)
				play("nopick")
				
				shoot=new FlxWeapon("water", this, "x", "y");
				//shoot.makeAnimatedBullet(1,feibiaoPNG, 50, 20, [0,2], 5, true,0,0);
				shoot.makePixelBullet(1, 200, 1, 0xffffffff, 0, 0);
				//shoot.setBulletGravity(0,220);
				//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
				shoot.setBulletLifeSpan(1000)
				shoot.setFireRate(1000);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
				shoot.setPreFireCallback(friewateranim)
				Registry.bulletsgroup.add(shoot.group)	
			}
				//机关枪
		/*
			else if(type==3){
				//count=200
				this.loadGraphic(jiqiangPNG,true,true,105,50)
				this.addAnimation(Actions.WALK,[5,4,8,7],6,true)
				this.addAnimation("nopick",[3],0,false)
				this.addAnimation(Actions.IDLE,[7],0,false)
				this.addAnimation(Actions.JUMP,[5,7,8,6],5,false)
				this.addAnimation("fire",[0,1,2],5,false)
				this.addAnimation("diuqi",[5,7,8,6,5,7,8,6],10,false)
				play("nopick")
				
				shoot=new FlxWeapon("jiqiang", this, "x", "y");
				shoot.makePixelBullet(8, 2, 2, 0xffffffff, 0, 0);
				
				//shoot.setBulletGravity(0,220);
				//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
				shoot.setBulletLifeSpan(2000)
				shoot.setFireRate(20);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
				shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
			}
			*/
			else if(type==3){
				count=30
				this.loadGraphic(longgunPNG,true,true,110,22)
				this.addAnimation(Actions.WALK,[1],0,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[1],0,false)
				this.addAnimation(Actions.JUMP,[1],0,false)
				this.addAnimation("fire",[1],5,false)
				this.addAnimation("diuqi",[0],0,false)
				play("nopick")
				
				shoot=new FlxWeapon("longgun", this, "x", "y");
				//shoot.makePixelBullet(8, 2, 2, 0xffffffff, 0, 0);
				
				shoot.makeImageBullet(15,b3PNG)
				shoot.setBulletLifeSpan(1000)
				shoot.setFireRate(30);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
			
				shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
			}
			//晕枪
				
			else if(type==4){
				count=100
				this.loadGraphic(yungunPNG,true,true,40,40)
				this.addAnimation(Actions.WALK,[1,2,3,4],6,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[2],0,false)
				this.addAnimation(Actions.JUMP,[1,2,3,4],5,false)
				this.addAnimation("fire",[3,2],5,false)
				this.addAnimation("diuqi",[1,2,3,4,1,2,3,4],10,false)
				play("nopick")
				
				shoot=new FlxWeapon("yungun", this, "x", "y");
				shoot.makeImageBullet(1,bullet2PNG)
					//shoot.makeAnimatedBullet(1,feibiaoPNG, 50, 20, [0,2], 5, true,0,0);
				//shoot.setBulletGravity(0,220);
				//shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 250);
				shoot.setBulletLifeSpan(1000)
				shoot.setFireRate(1000);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 4000));
				shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
			}
			else if(type==5){
				count=1000
				this.loadGraphic(humerPNG,true,true,70,50)
				this.addAnimation(Actions.WALK,[2,3,4],6,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[3],0,false)
				this.addAnimation(Actions.JUMP,[2,3,4],5,false)
				this.addAnimation("fire",[1,6,5],8,false)
				this.addAnimation("diuqi",[2,3,4,2,3,4,2,3,4],10,false)
				play("nopick")
			}
			else if(type==6){
				//count=200
				this.loadGraphic(misslegunPNG,true,true,75,25)
				this.addAnimation(Actions.WALK,[1],0,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[1],0,false)
				this.addAnimation(Actions.JUMP,[1],0,false)
				this.addAnimation("fire",[1],5,false)
				this.addAnimation("diuqi",[0],0,false)
				play("nopick")
				
				shoot=new FlxWeapon("misslegun", this, "x", "y");
				//shoot.makePixelBullet(8, 2, 2, 0xffffffff, 0, 0);
				
				shoot.makeImageBullet(1,hjpPNG)
				shoot.setBulletLifeSpan(2000)
				shoot.setFireRate(2000);
				shoot.setBulletBounds(new FlxRect(0, 0, 4000, 500));
				//shoot.
				shoot.setPreFireCallback(frieanim)
				Registry.bulletsgroup.add(shoot.group)	
			}
			else if(type==7){
				count=30
				this.loadGraphic(firegunPNG,true,true,80,30)
				this.addAnimation(Actions.WALK,[1],0,true)
				this.addAnimation("nopick",[0],0,false)
				this.addAnimation(Actions.IDLE,[1],0,false)
				this.addAnimation(Actions.JUMP,[1],0,false)
				this.addAnimation("fire",[1],5,false)
				this.addAnimation("diuqi",[0],0,false)
				play("nopick")	
			}
			
		}
		public function resetweapon():void
		{
		exists=true
		isuse=true
		isfire=false	
		this.alive=true
		
		flicker(0)
	    }
	    public function killweapon():void
		{
			(Registry.player1 as Ninja).resetWeapon()
			isuse=false
			isfire=false	
			this.alive=false
			this.acceleration.y=320	
			this.velocity.y=-200	
			play("diuqi")
			}
		public function diuqiweapon():void
		{
			(Registry.player1 as Ninja).resetWeapon()
			isuse=false
			isfire=false	
			//this.alive=false
			this.acceleration.y=320	
			this.velocity.y=-200	
			this.starty=y
			play("diuqi")
		}
		public function frieanim():void
		{
			
			count--
			if(count==2)
			{
				flicker(10)
				
			}

		//	var hjtexpole2:Expolre=new Expolre(x,bazooka.y-40,2,bazooka.facing)
		//	add(hjtexpole2)	
			if(type==0 || type==6){
				FlxG.play(Registry.missleshit,10,false);}
			else if(type==1 || type==3){
				FlxG.play(Registry.jiqiang,10,false);}
			else if(type==4){
				FlxG.play(Registry.watershit,10,false);}
			play("fire")
			if(Registry.player1.facing==FlxObject.RIGHT)
			{
				shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 200)
				shoot.setFiringPosition(this.x,this.y+200,50,20)
				sy=this.y
				shoot.currentBullet.facing=FlxObject.RIGHT
			}
			else if(Registry.player1.facing==FlxObject.LEFT)
			{
				shoot.setBulletDirection(FlxWeapon.BULLET_LEFT, 200)
				shoot.setFiringPosition(this.x,this.y,30,20)
				sy=this.y
				shoot.currentBullet.facing=FlxObject.LEFT
			}
			
		trace("shoot.currentBullet.facing "+shoot.currentBullet.facing)
		}
		public function friewateranim():void
		{
			
			count--
			if(count==2)
			{
				flicker(10)
				
			}
			
			//	var hjtexpole2:Expolre=new Expolre(x,bazooka.y-40,2,bazooka.facing)
			//	add(hjtexpole2)	
			
				FlxG.play(Registry.watershit,10,false);
				play("fire")
			if(Registry.player1.facing==FlxObject.RIGHT)
			{
				//if(type==0){
				shoot.setBulletDirection(FlxWeapon.BULLET_RIGHT, 300)
				shoot.setFiringPosition(this.x,this.y+200,50,20)
				sy=this.y
				shoot.currentBullet.facing=FlxObject.RIGHT
				//}
				
				
				
				}
			else if(Registry.player1.facing==FlxObject.LEFT)
			{
				 //if(type==0){
				shoot.setBulletDirection(FlxWeapon.BULLET_LEFT, 300)
				shoot.setFiringPosition(this.x,this.y,-150,20)
				sy=this.y
				shoot.currentBullet.facing=FlxObject.LEFT
				 //}
				 }
			
			trace("shoot.currentBullet.facing "+shoot.currentBullet.facing)
		}
	public function fire():void
	{
		
		if(alive){
		isfire=true
		if(type!=5 && type!=7){
			
		shoot.fire()
		}
		else if(type==5)
		{
			FlxG.play(Registry.humerhit,10,false);
			play("fire")
		//this.currentstate="fire"
		}
		if(type==7)
		{
			var hjtexpole3:Expolre
			
				hjtexpole3=new Expolre(x-30,y,5,(this as FlxSprite).facing)
			Registry.fxgroup.add(hjtexpole3)
			count--
		}
		
		}
	}
		
		override public function update():void
		{
//			if (lifespan > 0 && getTimer() > expiresTime)
//			{
//				kill();
//			}
//			else if(lifespan > 0 &&  expiresTime-getTimer() < 3000)
//			{
//				this.flicker(4)
//			}
//			if(y>=ey){
//				this.acceleration.y=0
//				this.velocity.y=0
//				canpick=true
//			}
			if( this.acceleration.y>0 && velocity.y>0 && y>starty )
			{
				velocity.x=0
				velocity.y=0
				acceleration.y=0
				
			}
			if(!alive && finished)
			{
				exists=false
			}
			if(this.isuse && !isfire)
			{
				if(type==0){
				x=Registry.player.x+10
				y=Registry.player.y
				}
				else if(type==2)
				{
					if(facing==FlxObject.RIGHT){
						x=Registry.player.x+80
					}
					else
					{
						x=Registry.player.x+20
					}
					if((Registry.player as Ninja).type==2){
						if(facing==FlxObject.RIGHT){
							x-=20
						}
						else{
							x+=10
						}
						y=Registry.player.y+10
					}else{
					y=Registry.player.y+30
					}
					}
//				else if(type==1 || type==3)
//				{
//					if(facing==FlxObject.RIGHT){
//					//x=Registry.player.x+40
//						x=Registry.player.x
//					}
//					else
//					{
//						x=Registry.player.x
//					}
//					if((Registry.player as Ninja).type==2){
//						y=Registry.player.y-5
//					}else{
//					y=Registry.player.y+25}
//				}
				else if(type==1 || type==3 || type==6 || type==7)
				{
					//if(facing==FlxObject.RIGHT){
						//x=Registry.player.x+40
						x=Registry.player.x+30
					//}
					//else
					//{
						y=Registry.player.y+35
					//}
					//if((Registry.player as Ninja).type==2){
					//	y=Registry.player.y-5
					//}else{
					//	y=Registry.player.y+25}
				}
				else if(type==4)
				{
					if(facing==FlxObject.RIGHT){
					x=Registry.player.x+70}
				
				else{
					x=Registry.player.x+30
				}
					y=Registry.player.y+20
				}
				else if(type==5)
				{
					if(facing==FlxObject.RIGHT){
						x=Registry.player.x+70}
						
					else{
						x=Registry.player.x+30
					}
					y=Registry.player.y+20
				}
				facing=	Registry.player.facing
				if(Registry.player.velocity.x!=0 && Registry.player.acceleration.y==0){
				play(Actions.WALK)
			}
			else if( Registry.player.acceleration.y!=0)
			{
				play(Actions.JUMP)
			}
			else if( Registry.player.velocity.x==0 && Registry.player.velocity.y==0)
			{
				play(Actions.IDLE)
			}
			}
			else if(isfire)
			{
				if(finished)
				{
					isfire=false
				}
			}
			
			if(type==0){
			for each(var bullet:FlxObject in shoot.group.members)
			{
				//trace("lll "+bullet.y+"当地的 "+(sy+50))
				if(bullet.exists && bullet.y>sy+50)
				{
					//trace("ni ma b avaga"+sy+50)
					var hjtexpole1:Expolre
					if(bullet.velocity.x<0){
					hjtexpole1=new Expolre(bullet.x-200,bullet.y-100,0,(bullet as FlxSprite).facing)
					}
					else if(bullet.velocity.x>0){
						hjtexpole1=new Expolre(bullet.x-50,bullet.y-100,0,(bullet as FlxSprite).facing)
					}
					FlxG.play(Registry.expolehjt,10)
					Registry.fxgroup.add(hjtexpole1)	
					bullet.kill()
				   // break
				}
			}
			}
			/*
			else if(type==1){
				for each(var bullet1:FlxObject in shoot.group.members)
				{
					//trace("lll "+bullet.y+"当地的 "+(sy+50))
					if(bullet1.exists)
					{
						for each(var m:GameObject in Registry.gameobjects.members)
						{
							//trace("ni ma b avaga"+sy+50)
							if((m is PrettySoldier) && FlxU.abs(bullet1.y+bullet1.height-m.y-m.height)<20 && FlxCollision.pixelPerfectCheck(bullet1 as FlxSprite,m as FlxSprite))
							{
								(m as PrettySoldier).setDamageState(Actions.DROPDOWN_FACE,10)
								bullet1.kill()
							// break
						}
					}
				}}}
			*/
			else if(type==2){
				for each(var bullet2:FlxObject in shoot.group.members)
				{
					//trace("lll "+bullet.y+"当地的 "+(sy+50))
					if(bullet2.exists)
					{
						for each(var m2:GameObject in Registry.gameobjects.members)
						{
							//trace("ni ma b avaga"+sy+50)
							if((m2 is Enemy) && FlxU.abs(bullet2.y+bullet2.height-m2.y-m2.height)<80 && FlxCollision.pixelPerfectCheck(bullet2 as FlxSprite,m2 as FlxSprite))
							{
								(m2 as Enemy).setDamageState(Actions.DROPDOWN_FACE,10)
								//bullet1.kill()
								// break
							}
						}
					}}}
			
			else if(type==1 || type==3){
				for each(var bullet3:FlxObject in shoot.group.members)
				{
					//trace("lll "+bullet.y+"当地的 "+(sy+50))
					if(bullet3.exists)
					{
						for each(var m3:GameObject in Registry.gameobjects.members)
						{
							//trace("ni ma b avaga"+sy+50)
							if((m3 is Enemy) && FlxU.abs(bullet3.y+bullet3.height-m3.y-m3.height)<100 && FlxCollision.pixelPerfectCheck(bullet3 as FlxSprite,m3 as FlxSprite))
							{
								if(type==1){
								(m3 as Enemy).setDamageState(Actions.DAMAGE_NORMAL,20)
								}
								else if(type==3)
								{
									(m3 as Enemy).setDamageState(Actions.DAMAGE_NORMAL,20)
								}
								bullet3.kill()
								// break
							}
						}
					}}}
			
			else if(type==4){
				for each(var bullet4:FlxObject in shoot.group.members)
				{
					//trace("lll "+bullet.y+"当地的 "+(sy+50))
					if(bullet4.exists)
					{
						for each(var m4:GameObject in Registry.gameobjects.members)
						{
							//trace("ni ma b avaga"+sy+50)
							if((m4 is Enemy) && FlxU.abs(bullet4.y+bullet4.height-m4.y-m4.height)<100 && FlxCollision.pixelPerfectCheck(bullet4 as FlxSprite,m4 as FlxSprite))
							{
								(m4 as Enemy).setDamageState(Actions.DAMAGE_NORMAL,20)
							//	bullet3.kill()
								// break
							}
						}
					}}}
			
			else if(type==5 ){

				if(isfire){
				for each(var m5:GameObject in Registry.gameobjects.members)
				{
				if((m5 is Enemy) && FlxU.abs(this.y+this.height-m5.y-m5.height)<100 && FlxCollision.pixelPerfectCheck(this as FlxSprite,m5 as FlxSprite))
				{
					(m5 as Enemy).setDamageState(Actions.DROPDOWN_BACKFACE,20)
				count--
				}
				}
			}}
			
			//--
			else if(type==6){
				for each(var bullet6:FlxObject in shoot.group.members)
				{
				
					if(bullet6.exists)
					{
						for each(var m6:GameObject in Registry.gameobjects.members)
						{
							//trace("ni ma b avaga"+sy+50)
							if((m6 is Enemy) && FlxU.abs(bullet6.y+bullet6.height-m6.y-m6.height)<100 && FlxCollision.pixelPerfectCheck(bullet6 as FlxSprite,m6 as FlxSprite))
							{
								var hjtexpole2:Expolre
								if(bullet6.velocity.x<0){
									hjtexpole2=new Expolre(bullet6.x-200,bullet6.y-100,0,(bullet6 as FlxSprite).facing)
								}
								else if(bullet6.velocity.x>0){
									hjtexpole2=new Expolre(bullet6.x-50,bullet6.y-100,0,(bullet6 as FlxSprite).facing)
								}
								FlxG.play(Registry.expolehjt,10)
								Registry.fxgroup.add(hjtexpole2)	
								bullet6.kill()
								// break
							}
						}
					
				}
			}}
			
//			else if(type==7){
//				if( Registry.player1.currentstate==Actions.WEAPONSHIT &&  Registry.player1.finished){
//				var hjtexpole3:Expolre
//				if(bullet6.velocity.x<0){
//					hjtexpole3=new Expolre(x,y,5,(this as FlxSprite).facing)
//				}
//				else if(bullet6.velocity.x>0){
//					hjtexpole3=new Expolre(x,y,5,(this as FlxSprite).facing)
//				}
//				Registry.fxgroup.add(hjtexpole3)
//				hjtexpole3.x=Registry.player1.x
//				hjtexpole3.y=Registry.player1.y
//				count--
//				}
//			
//			}
			
			
				if(count<=1){
					
					killweapon()
					//return;
				}
			//}
			super.update()
		}
	
	}
}