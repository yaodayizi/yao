package
{
	import enemy.Enemy;
	import enemy.PrettySoldier;
	
	import flash.geom.Rectangle;
	
	import objects.GameObject;
	
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	import org.flixel.plugin.photonstorm.FlxScrollZone;
	
	import role.Ninja;

	public class LevelScrollState extends FlxState
	{
		[Embed(source = '../img/map/avp3.png')] public   var avp3png:Class;
		[Embed(source = '../img/map/car.png')] public   var carpng:Class;
		private var gameover:Boolean=false
		private var pic:FlxSprite;
		private var car:FlxSprite;
		public var gun:Weapon
		private var countnum:int=0
		public  var scoreFont:FlxBitmapFont
		private var countorder:int=0
		//private var killcount:int=0
		private var lifebar:FlxBar
		public function LevelScrollState()
		{
		}

		override public function create():void
		{
			
			
			
			if (FlxG.getPlugin(FlxScrollZone) == null)
			{
				FlxG.addPlugin(new FlxScrollZone);
			}
			
			//	Create a sprite from a 320x200 PNG
			pic = new FlxSprite(0, 0, avp3png);
			car = new FlxSprite(0, 230);
			car.loadGraphic(carpng,true,false,562,130)
			car.addAnimation("play",[0,1,2],30,true)
			car.play("play")	
			
			FlxScrollZone.add(pic, new Rectangle(0, 0, pic.width, pic.height), -4, 0, true);
			
			
			//if(Registry.gameobjects==null)
			//{
				Registry.init()
				//new Ninja
				add(pic);
				add(Registry.deadobjects)
				add(car)
				
				
				Registry.player1=new Ninja(100,145,Registry.selectindex)
				Registry.player1.leftx=0
				Registry.player1.gamemode=1
				Registry.player1.rightx=180	
				Registry.gameobjects.add(Registry.player1)
				Registry.player=Registry.player1
			
			//}
			gun=new Weapon(100,210,50,2)
			add(Registry.bulletsgroup)
			Registry.gameobjects.add(gun)	
//			(Registry.player1 as Ninja).currentweapon=(gun as Weapon)
//			(Registry.player1 as Ninja).isweapon=true
//			gun.isuse=true
//			gun.x=Registry.player1.x
//			gun.y=Registry.player1.y	
//			currentweapon=w as Weapon
//			isweapon=true
//			w.x=x
//			w.y=y
//			w.isuse=true	
			for (var i:int=0;i<10;i++){
			var p:PrettySoldier=new PrettySoldier(700+50*i,260,Math.random()*4)
			p.gamemode=1
			p.jumpspeed=-400	
			p.health=1
				p.downy=500	
					
			Registry.gameobjects.add(p)
			}
			add(Registry.gameobjects)
			
			//----
			lifebar= new FlxBar(30, 30, FlxBar.FILL_LEFT_TO_RIGHT)
			//lifebar.scale.x=10
			lifebar.createImageBar(null, Registry.healthBarPNG, 0xffff0000)
			lifebar.percent = 100
			lifebar.scrollFactor.x=0
			lifebar.scrollFactor.y=0
			add(lifebar)
			
			scoreFont = new FlxBitmapFont(Registry.knightHawksPurpleFontPNG, 31, 25, FlxBitmapFont.TEXT_SET6, 10, 1, 1);
			scoreFont.setFixedWidth(500, FlxBitmapFont.ALIGN_RIGHT);
			scoreFont.scrollFactor.x=0
			scoreFont.scrollFactor.y=0	
			scoreFont.scale.x=0.5
			scoreFont.scale.y=0.5
			scoreFont.x = 150;
			scoreFont.y = 0;
			//scoreFont.text = "SCORE "+0
			Registry.afterlayer.add(scoreFont)
			add(Registry.afterlayer)
		}
		
		private function changeState():void
		{
			//Registry.gameobjects.add(Registry.player1)
			//Registry.level=5
			//Registry.scene=0
			FlxG.switchState(new PlayState);
		}
		
		override public function update():void
		{
			if(!gameover){
			scoreFont.text="SCORE "+Registry.score
			if(Registry.player.health<=0)
			{
				lifebar.percent=0
				States.setDamagePlayerState(Actions.DROPDOWN_FACE,Registry.player,5)
				if(Registry.player1.currentstate==Actions.DROPDOWN_FACE && Registry.player1.acceleration.y==0)
				{
					var font:FlxBitmapFont = new FlxBitmapFont(Registry.knighthawksFontPNG, 31, 25, FlxBitmapFont.TEXT_SET2, 10, 1);
					font.setText("GAME OVER", true, 1, 8, FlxBitmapFont.ALIGN_LEFT);
					font.scrollFactor.x=0
					font.scrollFactor.y=0
					font.x=100  ;
					font.y = 150;
					Registry.afterlayer.add(font)
					Registry.player1.exists=false
					gameover=true
				}
				
			}
			else{
				lifebar.percent=(Registry.player.health/Registry.player.maxlife)*100
			}
			for each(var nimab:GameObject in Registry.gameobjects.members)
			{
				if(!nimab.exists && nimab is Enemy )
				{
					
					nimab.x=nimab.stx
					
					nimab.y=nimab.sty
					nimab.starty=nimab.sty
					nimab.acceleration.y=0	
					nimab.health=1	
					nimab.setState(Actions.RUN)
					nimab.revive()
					countnum++
						Registry.score+=200
				}
			}
			
//			
			if(countnum>20)
			{
				Registry.level=5
				changeState()
			}
			
			}
			else
			{
				if(FlxG.keys.any())
				{
					FlxG.switchState(new LevelScrollState);	
				}
			}
			super.update();
		}
		
		override public function destroy():void
		{
			//	Important! Clear out the scrolling image from the plugin, otherwise resources will get messed right up after a while
			FlxScrollZone.clear();
			Registry.destroy()
			super.destroy();
		}
	
	}
}






