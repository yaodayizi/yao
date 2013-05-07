package
{
	import anim.SailorAnim;
	
	import enemy.AmiRobot;
	import enemy.Ano;
	import enemy.BossRobot;
	import enemy.CarBoss;
	import enemy.Enemy;
	import enemy.Gongzhu;
	import enemy.GunWomen;
	import enemy.Huowu;
	import enemy.Nakururu;
	import enemy.PreBoss;
	import enemy.Predator;
	import enemy.PrettySoldier;
	import enemy.QueenBoss;
	import enemy.Sg;
	import enemy.Supergirl1;
	import enemy.Supergirl2;
	import enemy.Tinv;
	import enemy.Yadiana;
	import enemy.Yoko;
	
	import flash.utils.getTimer;
	
	import objects.GameObject;
	
	import org.flixel.FlxBasic;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxU;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	import org.flixel.plugin.photonstorm.FlxCollision;
	import org.flixel.plugin.photonstorm.FlxDelay;
	
	import role.Ninja;
	import role.Robot;

	public class PlayState extends FlxState
	{
		//private var ninja:Ninja
		[Embed(source = '../img/map/level1.png')] public   var map1png:Class;
		[Embed(source = '../img/map/level21.png')] public   var map2png:Class;
		[Embed(source = '../img/map/level22.png')] public   var map3png:Class;
		[Embed(source = '../img/map/level31.png')] public   var map4png:Class;
		[Embed(source = '../img/map/level32.png')] public   var map5png:Class;
		[Embed(source = '../img/map/level33.png')] public   var map6png:Class;
		[Embed(source = '../img/map/level41.png')] public   var map7png:Class;
		[Embed(source = '../img/map/level42.png')] public   var map8png:Class;
		[Embed(source = '../img/map/level43.png')] public   var map9png:Class;
		[Embed(source = '../img/map/level44.png')] public   var map10png:Class;
		[Embed(source = '../img/map/avp41.png')] public   var avp41png:Class;
		
		[Embed(source = '../img/map/avp6.png')] public   var avp6png:Class;
		[Embed(source = '../img/map/avp7.png')] public   var avp7png:Class;
		[Embed(source = '../img/map/avp8.png')] public   var avp8png:Class;
		[Embed(source = '../img/map/avp9.png')] public   var avp9png:Class;
		[Embed(source = '../img/map/avp10.png')] public   var avp10png:Class;
		private var gameover:Boolean=false
		private var scorerecord:int=0
		public static var scoreFont:FlxBitmapFont
		private var countorder:int=0
		//private var killcount:int=0
		private var lifebar:FlxBar
		private var delay:FlxDelay
		private var theboss:Enemy=null
		private  var bossbar:FlxBar	
		private  var bossicon:FlxSprite	
		private var themap:FlxSprite=null
		private var ismove:Boolean=false
		
		private function gamescript():void
		{
			if(delay.hasExpired)
			{
			var maxscene:int=0
				if(Registry.killcount==0)
				{
					Registry.scene++
				if(Registry.level==1){	
					maxscene=6
				}	
				else if(Registry.level==2){	
					maxscene=2
				}	
				else if(Registry.level==3){	
					maxscene=3
				}
				else if(Registry.level==4){	
					maxscene=4
				
				}
				else if(Registry.level==5){	
					maxscene=4
				}else if(Registry.level==6){	
					maxscene=1
				}
				else if(Registry.level==7){	
					maxscene=1
				}
				else if(Registry.level==8){	
					maxscene=1
				}
				else if(Registry.level==9){	
					maxscene=1
				}
				else if(Registry.level==10){	
					maxscene=8
				}
				else if(Registry.level==11){	
					maxscene=5
				}
				else if(Registry.level==12){	
					maxscene=8
				}
				else if(Registry.level==13){	
					maxscene=8
				}
				else if(Registry.level==14){	
					maxscene=4
				}
				else if(Registry.level==15){	
					maxscene=6
				}
				else if(Registry.level==16){	
					maxscene=6
				}
				//---------------
				//trace("Registry.scene "+Registry.scene)
				
				
				if(Registry.scene<maxscene){
					var oldrightx:Number=Registry.player.rightx
					Registry.player.rightx+=300
					
				
					for each(var mm:GameObject in Registry.gameobjects.members)
				{
					if( mm is Enemy && mm.exists==false){
						Registry.gameobjects.remove(mm)
				//	mm.destroy()	
					}
					}
				randomEnemy(oldrightx)
				var boss:Enemy
				var rndx1:int=Math.random()*300+oldrightx
				var rndy1:int=Math.random()*150+80
				if(Registry.scene==(maxscene-1)){
					Registry.player.rightx=themap.width-Registry.player.width/2
					if(Registry.level==1 )
				{
					
					boss=new GunWomen(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				
				//ismove=true	
				}
					else if(Registry.level==2 )
					{
						//var d:Ano
						boss=new Ano(rndx1,rndy1,0)
						boss.leftx=oldrightx
						boss.rightx=Registry.player.rightx
						Registry.gameobjects.add(boss)
						Registry.killcount++
							theboss=boss
					}
				else if(Registry.level==3 )
				{
					
					boss=new Predator(rndx1,rndy1,0)
					//boss=new AmiRobot(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				}
				else if(Registry.level==10)
				{
					
					boss=new Yoko(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				}
				
				else if(Registry.level==11)
				{
					
					//boss=new AmiRobot(rndx1,rndy1,0)
					//boss=new CarBoss(rndx1,rndy1,0)
				//boss=new BossRobot(rndx1,rndy1,0)
					//boss=new QueenBoss(rndx1,rndy1,0)
					boss=new PreBoss(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
					
					//---nakururu test
//					var naku:Nakururu=new Nakururu(rndx1,rndy1,0)
//					naku.leftx=oldrightx
//					naku.health=120
//					naku.rightx=Registry.player.rightx
//					Registry.gameobjects.add(naku)
//					Registry.killcount++
//						
//					var ss:Sg=new Sg(rndx1,rndy1,0)
//					ss.leftx=oldrightx
//					ss.health=120
//					ss.rightx=Registry.player.rightx
//					Registry.gameobjects.add(ss)
//					Registry.killcount++
//						
//					var hw:Huowu=new Huowu(rndx1,rndy1,0)
//					hw.leftx=oldrightx
//					hw.health=120
//					hw.rightx=Registry.player.rightx
//					Registry.gameobjects.add(hw)
//					Registry.killcount++
//						
						
						theboss=boss
				

					
				}
				else if(Registry.level==12)
				{
					boss=new AmiRobot(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				}
				else if(Registry.level==13)
				{
					boss=new CarBoss(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				}
				else if(Registry.level==14)
				{
					boss=new BossRobot(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				}
				else if(Registry.level==15)
				{
										var ss:AmiRobot=new AmiRobot(rndx1,rndy1,0)
										ss.leftx=oldrightx
										ss.health=500
										ss.rightx=Registry.player.rightx
										Registry.gameobjects.add(ss)
										Registry.killcount++
										var ss1:AmiRobot=new AmiRobot(rndx1,rndy1,0)
										ss1.leftx=oldrightx
										ss1.health=500
										ss1.rightx=Registry.player.rightx
										Registry.gameobjects.add(ss1)
										Registry.killcount++
										var ss2:AmiRobot=new AmiRobot(rndx1,rndy1,0)
										ss2.leftx=oldrightx
										ss2.health=500
										ss2.rightx=Registry.player.rightx
										Registry.gameobjects.add(ss2)
										Registry.killcount++
										var ss3:CarBoss=new CarBoss(rndx1,rndy1,0)
										ss3.leftx=oldrightx
										ss3.health=500
										ss3.rightx=Registry.player.rightx
										Registry.gameobjects.add(ss3)
										Registry.killcount++
				}
				else if(Registry.level==16)
				{
					boss=new QueenBoss(rndx1,rndy1,0)
					boss.leftx=oldrightx
					boss.rightx=Registry.player.rightx
					Registry.gameobjects.add(boss)
					Registry.killcount++
						theboss=boss
				}
					
				}
				}
				
				else
				   {
					//private var scorerecord:int=0
					//public static var scoreFont:FlxBitmapFont
					scorerecord++
						if(scorerecord==1)	
						{
							var score1: FlxBitmapFont = new FlxBitmapFont(Registry.knightHawksPurpleFontPNG, 31, 25, FlxBitmapFont.TEXT_SET6, 10, 1, 1);
							score1.setFixedWidth(500, FlxBitmapFont.ALIGN_RIGHT);
							score1.scrollFactor.x=0
							score1.scrollFactor.y=0	
							score1.scale.x=0.5
							score1.scale.y=0.5
							score1.x = 100;
							score1.y = 50;
							score1.setText("LEVEL "+Registry.level+" FINISHED", true, 1, 8, FlxBitmapFont.ALIGN_LEFT);
							Registry.afterlayer.add(score1)
							
						}
						if(scorerecord==2)	
						{
							var score2: FlxBitmapFont = new FlxBitmapFont(Registry.knightHawksPurpleFontPNG, 31, 25, FlxBitmapFont.TEXT_SET6, 10, 1, 1);
							score2.setFixedWidth(500, FlxBitmapFont.ALIGN_RIGHT);
							score2.scrollFactor.x=0
							score2.scrollFactor.y=0	
							score2.scale.x=0.5
							score2.scale.y=0.5
							score2.x = 100;
							score2.y = 150;
							score2.setText("BOSS "+1000, true, 1, 8, FlxBitmapFont.ALIGN_LEFT);
							Registry.afterlayer.add(score2)
							
						}
					if(scorerecord>2){
					Registry.level++
							if(Registry.level>16)
							{
								Registry.level=1
							}
							
							if(Registry.level==4){
								FlxG.switchState(new LevelScrollState)
							}
							else{
					changeState()}
				}
				}
				
				}
			delay.start()
				}}
	
		private function changeState():void
		{
			//Registry.gameobjects.add(Registry.player1)
			//Registry.level=2
			Registry.scene=0
			FlxG.switchState(new PlayState);
		}
		override public function destroy():void
		{
			//if(gameover){
			//scoreFont.text="SCORE "+0
				Registry.destroy()
			//}

			super.destroy();
		}
		private function addRoleIcon():void
		{
			//
			var roleicon:FlxSprite=new FlxSprite(0,0)
			roleicon.scrollFactor.x=0
			roleicon.scrollFactor.y=0	
			if(Registry.selectindex==0)
			{
				roleicon.loadGraphic(Registry.icon1png)
			}
			else if(Registry.selectindex==1)
			{
				roleicon.loadGraphic(Registry.icon2png)
			}
			else if(Registry.selectindex==2)
			{
				roleicon.loadGraphic(Registry.icon3png)
			}
			else if(Registry.selectindex==3)
			{
				roleicon.loadGraphic(Registry.icon4png)
			}
			
			
			Registry.afterlayer.add(roleicon)
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
//		private function initlevel():void
//		{
//			initmap()
//			createEnemy()
//		}
		
		private function randomEnemy(oldrightx:Number,offsetx:Number=300,count:int=0):void
		{
			if(count==0){
				count=Math.random()*5+5
			}
			Registry.killcount=count
			var rndweapon:int=Math.random()*8
			var weapon:GameObject
			/*
			if(rndweapon<=1)
			{
				weapon=new Weapon(Math.random()*offsetx+oldrightx,Math.random()*150+80,50,0)
			}
			else if(rndweapon==2)
			{
				weapon=new Weapon(Math.random()*offsetx+oldrightx,Math.random()*150+80,50,2)
			}
			else if(rndweapon==3)
			{
				weapon=new Weapon(Math.random()*offsetx+oldrightx,Math.random()*150+80,50,3)
			}
			else if(rndweapon==4)
			{
				weapon=new Weapon(Math.random()*offsetx+oldrightx,Math.random()*150+80,50,4)
			}
			else if(rndweapon==5)
			{
				weapon=new Weapon(Math.random()*offsetx+oldrightx,Math.random()*150+80,50,5)
			}
			*/
			if(rndweapon<6)
			{
				weapon=new ItemBox(Math.random()*offsetx+oldrightx,Math.random()*150+80)
				//Registry.gameobjects.add(tong)
			}
			else if(rndweapon>=6)
			{
				weapon=new Robot(Math.random()*offsetx+oldrightx,Math.random()*150+80,Math.random()*3)
			}
			Registry.gameobjects.add(weapon)
			for(var i:int=0;i<count;i++){
			var rand:int=Math.random()*14
			var rndx:int=Math.random()*offsetx+oldrightx
			var rndy:int=Math.random()*150+80
			var theenemy:Enemy	
			if(rand<=5)
				{
				theenemy=new PrettySoldier(rndx,rndy,rand) 
				}
			else if(rand==6)
			{
				theenemy=new Supergirl1(rndx,rndy,0)
			}
			else if(rand==7)
			{
				theenemy=new Supergirl2(rndx,rndy,0)
			}
			else if(rand==8)
			{
				theenemy=new Tinv(rndx,rndy,0)
			}
			else if(rand==9)
			{
				theenemy=new Gongzhu(rndx,rndy,0)
			}
			else if(rand==10)
			{
				theenemy=new Yadiana(rndx,rndy,0)
			}
			
			else if(rand==11)
			{
				theenemy=new Nakururu(rndx,rndy,0)
			}
			else if(rand==12)
			{
				theenemy=new Sg(rndx,rndy,0)
			}
			else if(rand==13)
			{
				theenemy=new Huowu(rndx,rndy,0)
			}
			
			
		
			theenemy.leftx=oldrightx
			theenemy.rightx=Registry.player.rightx
			Registry.gameobjects.add(theenemy)
			}
			//return theenemy
				
		}
		
		
		/*
		private function createEnemy(oldrightx:Number):void
		{
			if(Registry.level==1){
				
			if(Registry.scene==0){
//			var ww:Weapon=new Weapon(50,140,50,0)
//			
//			Registry.gameobjects.add(ww)
//			var boss2:GunWomen=new GunWomen(120,100,0)
//			var boss3:Yoko=new Yoko(130,100,0)
//			var boss4:Yadiana=new Yadiana(140,100,0)
//			Registry.gameobjects.add(boss2)
//			Registry.gameobjects.add(boss3)
//			Registry.gameobjects.add(boss4)
//			var girl1:Supergirl1=new Supergirl1(100,100,0)	
//			Registry.gameobjects.add(girl1)
//			var girl2:Supergirl2=new Supergirl2(150,100,0)	
//			Registry.gameobjects.add(girl2)
//			Registry.killcount=5
//			var robot:Robot=new  Robot(100+50,100+50,2)
//			Registry.gameobjects.add(robot)	
			
			
			}
			else if(Registry.scene==1)
			{
				for(var i:int=0;i<6;i++){
					var mercury:Enemy=new PrettySoldier(Math.random()*300+oldrightx,150,Math.random()*6) 
					mercury.leftx=oldrightx
					mercury.rightx=Registry.player.rightx
					Registry.gameobjects.add(mercury)	
					Registry.killcount+=1
				}
				var ww1:Weapon=new Weapon(Math.random()*300+oldrightx,80+Math.random()*50,50,0)
				Registry.gameobjects.add(ww1)
			}
			else if(Registry.scene==2)
			{
				for(var i:int=0;i<10;i++){
					var mercury:Enemy=new PrettySoldier(Math.random()*300+oldrightx,150,Math.random()*6) 
					mercury.leftx=oldrightx
					mercury.rightx=Registry.player.rightx
					Registry.gameobjects.add(mercury)	
					Registry.killcount+=1
				}
				var m1:Tinv=new Tinv(100,100,0)	
				Registry.gameobjects.add(m1)
				var girl2:Supergirl2=new Supergirl2(150,100,0)	
				Registry.gameobjects.add(girl2)
			//	var ww1:Weapon=new Weapon(Math.random()*300+oldrightx,80+Math.random()*50,50,0)
				//Registry.gameobjects.add(ww1)
			}
			
			
			
			
			}
			
		}
		*/
		
		override public function create():void
		{
		
				Registry.init()
				Registry.player1=new Ninja(100,100,Registry.selectindex)
				Registry.gameobjects.add(Registry.player1)
				Registry.player=Registry.player1
				
			//FlxG.playMusic(Registry.bgmp3, 1);
			initmap()
			add(Registry.dolly)
			add(Registry.deadobjects)
			add(Registry.bulletsgroup)
			add(Registry.fxgroup)
//			add(Registry.bloodeffect)
			//createEnemy(0)
			randomEnemy(400)
			add(Registry.gameobjects)
			addRoleIcon()
			lifebar= new FlxBar(30, 30, FlxBar.FILL_LEFT_TO_RIGHT)
			//lifebar.scale.x=10
			lifebar.createImageBar(null, Registry.healthBarPNG, 0xffff0000)
			lifebar.percent = 100
			lifebar.scrollFactor.x=0
			lifebar.scrollFactor.y=0
			add(lifebar)
			bossbar=new FlxBar(30, 300, FlxBar.FILL_LEFT_TO_RIGHT)
			//bossbar.scale.x=10
			bossbar.createImageBar(null,Registry.bar1png, 0xffff0000)	
			//bossbar.percent = 100
			bossbar.scrollFactor.x=0
			bossbar.scrollFactor.y=0	
			add(bossbar)
			bossicon=new FlxSprite(0,300)
			bossicon.scrollFactor.x=0
			bossicon.scrollFactor.y=0
			if(Registry.level==1){
			bossicon.loadGraphic(Registry.b1iconpng)
			}
			else if(Registry.level==2){
				bossicon.loadGraphic(Registry.b4iconpng)
			}
			else if(Registry.level==3){
			bossicon.loadGraphic(Registry.b2iconpng)
			}
			else if(Registry.level==10){
				bossicon.loadGraphic(Registry.b3iconpng)
			}
			else if(Registry.level==11){
				bossicon.loadGraphic(Registry.b9iconpng)
			}
			else if(Registry.level==12){
				bossicon.loadGraphic(Registry.b5iconpng)
			}
			else if(Registry.level==13){
				bossicon.loadGraphic(Registry.b6iconpng)
			}
			else if(Registry.level==14){
				bossicon.loadGraphic(Registry.b7iconpng)
			}
			else if(Registry.level==16){
				bossicon.loadGraphic(Registry.b8iconpng)
			}
			add(bossicon)	
			//4000,770
//			FlxG.camera.setBounds(0,0,themap.width, themap.height)
//			FlxG.worldBounds = new FlxRect(0, 0, themap.width, themap.height);
			FlxG.camera.setBounds(0,0,themap.width, 500)
			FlxG.worldBounds = new FlxRect(0, 0, themap.width, 500);
				Registry.dolly.x=Registry.player1.x-50
				Registry.dolly.y=Registry.player1.y	
				Registry.dolly.visible=false
				FlxG.camera.follow(Registry.dolly)
				delay=new FlxDelay(4000)
				delay.start()   
			}
		
		private function initmap():void
		{
			var map1:FlxSprite=new FlxSprite(0,0)
			if(Registry.level==1){
			map1.loadGraphic(map1png)
			}
			else if(Registry.level==2)
			{
				map1.loadGraphic(map2png)
			}
			else if(Registry.level==3)
			{
				
				map1.loadGraphic(map3png)
			  
			}
			else if(Registry.level==4)
			{
				map1.loadGraphic(map4png)
			}
			else if(Registry.level==5)
			{
				map1.loadGraphic(map5png)
			}
			else if(Registry.level==6)
			{
				map1.loadGraphic(map6png)
			}
			else if(Registry.level==7)
			{
				map1.loadGraphic(map7png)
			
			}
			else if(Registry.level==8)
			{
				map1.loadGraphic(map8png)
				
			}
			else if(Registry.level==9)
			{
				map1.loadGraphic(map9png)
				
			}
			else if(Registry.level==10)
			{
				map1.loadGraphic(map10png)
				addTheNpc()
			}
			else if(Registry.level==11)
			{
				map1.loadGraphic(avp41png)
				addTheNpc()
			}
			else if(Registry.level==12)
			{
				map1.loadGraphic(avp6png)
				addTheNpc()
			}
			else if(Registry.level==13)
			{
				map1.loadGraphic(avp7png)
				addTheNpc()
			}
			else if(Registry.level==14)
			{
				map1.loadGraphic(avp8png)
				addTheNpc()
			}
			else if(Registry.level==15)
			{
				map1.loadGraphic(avp9png)
				addTheNpc()
			}
			else if(Registry.level==16)
			{
				map1.loadGraphic(avp10png)
				addTheNpc()
			}
			add(map1)
			themap=map1
		}
		
		private function addTheNpc():void
		{
			var n:Npc=new Npc(0)
			n.x=200+Math.random()*1500
			n.y=0	   
			Registry.deadobjects.add(n) 
			var n1:Npc=new Npc(0)
			n1.x=200+Math.random()*1500
			n1.y=50	   
			Registry.deadobjects.add(n1)
			var n2:Npc=new Npc(1)
			n2.x=200+Math.random()*1500
			n2.y=100	   
			Registry.afterlayer.add(n2)
			var n3:Npc=new Npc(1)
			n3.x=200+Math.random()*1500
			n3.y=100	   
			Registry.afterlayer.add(n3)
		}
		
		
		//根据y的方向进行重新排序
		private function deeporder():void
		{
			var len:int=Registry.gameobjects.members.length
			
			for(var i:int=0;i<len-1;i++)
			{
				//trace(Registry.enemys.members[i])
				if(Registry.gameobjects.members[i]==null){continue}
				var tmpa:*=(Registry.gameobjects.members[i]) as FlxSprite
				for(var j:int=i+1;j<len;j++)
				{
					if(Registry.gameobjects.members[j]==null){continue}
					
					var tmpb:*=(Registry.gameobjects.members[j]) as FlxSprite
					if(tmpa.y+tmpa.height>tmpb.y+tmpb.height)
					{
						var tmp:*=Registry.gameobjects.members[i]
						Registry.gameobjects.members[i]=Registry.gameobjects.members[j]
						Registry.gameobjects.members[j]=tmp
						
					}
				}
			}
		}
		private function attackplay(a:FlxObject,b:FlxObject):void
		{
			if(Registry.player.iscatch)return
			if(!(b is Enemy))return
			if(Registry.player.acceleration.y==0){
			if(FlxU.abs(a.y+a.height-b.y-b.height)<12 && FlxCollision.pixelPerfectCheck(a as FlxSprite,b as FlxSprite))
			{
//			   if(FlxU.abs(a.x+a.width-b.x-b.width)<10 && (b as PrettySoldier).isinterrupt() && Registry.player.currentstate!=Actions.RUN){
//			   if(!Registry.player.iscatch){Registry.player.iscatch=true
//				   Registry.player.catchtarget=null
//				   Registry.player.catchtarget=b as PrettySoldier
//			   Registry.player.catchtarget.setState(Actions.STATE_CATCH)
//			   return
//				   }
//
//			   }
//			   else{
				  
				    if((a as GameObject).currentstate==Actions.ATTACK_NORMAL){
			  
				   (b as Enemy).setDamageState(Actions.DAMAGE_NORMAL1,5)
					
			   Registry.player.iscontinue=true
			   }

			   else if((a as GameObject).currentstate==Actions.ATTACK_CONTINUE || (a as GameObject).currentstate==Actions.ATTACK_RUN || (a as GameObject).currentstate==Actions.ATTACK_SUPER){

				   if(Registry.player.finished){
					  
				   if(Registry.player.facing==(b as Enemy).facing)
					  {
						  (b as Enemy).setDamageState(Actions.DROPDOWN_BACKFACE,10)
							 // (b as PrettySoldier).setDropSpeed(100)
				   }
				   else{
					   (b as Enemy).setDamageState(Actions.DROPDOWN_FACE,10)
						   //(b as PrettySoldier).setDropSpeed(-100)
				   }
					  }
				   else
				   {
					   (b as Enemy).setDamageState(Actions.DAMAGE_NORMAL,5)
				   }
					 Registry.player.iscontinue=true
			   }
			   }
			   

		   }
		 // }
		  
		   else{
			   if(FlxU.abs((a as GameObject).starty+(a as GameObject).height-b.y-b.height)<6 && FlxCollision.pixelPerfectCheck(a as FlxSprite,b as FlxSprite))
			   {
				   if((a as GameObject).currentstate==Actions.ATTACK_JUMPATTACK1){
					   (b as Enemy).setDamageState(Actions.DROPDOWN_FACE,10)
					   Registry.player.iscontinue=true
				   }
				   else if((a as GameObject).currentstate==Actions.ATTACK_RUNJUMP){
					   (b as Enemy).setDamageState(Actions.DROPDOWN_FACE,20)
					   Registry.player.iscontinue=true
				   }
			   } 
		   }
		}
		
		//机器坐骑的控制
		private function attackrobot(a:FlxObject,b:FlxObject):void
		{
			if(!(b is Enemy))return
			if(Registry.player.acceleration.y==0){
				if(FlxU.abs(a.y+a.height-b.y-b.height)<20 && FlxCollision.pixelPerfectCheck(a as FlxSprite,b as FlxSprite))
				{
				
						if((a as GameObject).currentstate==Actions.ATTACK_NORMAL){
							
							(b as Enemy).setDamageState(Actions.DAMAGE_NORMAL1,10)
							
							Registry.player.iscontinue=true
						}
						else if((a as GameObject).currentstate==Actions.RUN ){
							(b as Enemy).setDamageState(Actions.DROPDOWN_FACE,10)
						}
							
						else if((a as GameObject).currentstate==Actions.ATTACK_CONTINUE ){
							
							if(Registry.player.finished){
								
								if(Registry.player.facing==(b as Enemy).facing)
								{
									(b as Enemy).setDamageState(Actions.DROPDOWN_BACKFACE,20)
									// (b as PrettySoldier).setDropSpeed(100)
								}
								else{
									(b as Enemy).setDamageState(Actions.DROPDOWN_FACE,20)
									//(b as PrettySoldier).setDropSpeed(-100)
								}
							}
							else
							{
								(b as Enemy).setDamageState(Actions.DAMAGE_NORMAL,10)
							}
							Registry.player.iscontinue=true
						}
					}
					
					
				}
			
				
			else{
				if(FlxU.abs((a as GameObject).starty+(a as GameObject).height-b.y-b.height)<6 && FlxCollision.pixelPerfectCheck(a as FlxSprite,b as FlxSprite))
				{
					if((a as GameObject).currentstate==Actions.JUMP){
						(b as Enemy).setDamageState(Actions.DROPDOWN_FACE,20)
						Registry.player.iscontinue=true
					}
					
				} 
			}
		}
		
		
		
		override public function update():void
		{
			if(!gameover){
			countorder++
			if(countorder%20==0)
			{
				countorder=0
				
			deeporder()
			}
			scoreFont.text="SCORE "+Registry.score
		   
				if(themap!=null){
//			if(!ismove){
//				Registry.dolly.x=Registry.player.x
//			}
//			else{
//					Registry.dolly.x=themap.width-200
//			}
					Registry.dolly.x=Registry.player.x
					Registry.dolly.y=Registry.player.y	
				}
			if(Registry.player.exists){
			if(Registry.player is Ninja){
				FlxG.overlap(Registry.player,Registry.gameobjects,attackplay)
			}
			else if(Registry.player is Robot){
			FlxG.overlap(Registry.player,Registry.gameobjects,attackrobot)	
			}		
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
//			else{
//					Registry.player1.setState(Actions.DROPDOWN_FACE)	
//			}
			}
				else{
			lifebar.percent=(Registry.player.health/Registry.player.maxlife)*100
				}
			}	
			if(theboss!=null && theboss.exists)
			{
				if(!bossbar.exists){bossbar.exists=true
					bossicon.exists=true
				}
				bossbar.percent=int((theboss.health/theboss.maxlife)*100)
			}
			else
			{
				bossbar.exists=false
				bossicon.exists=false
			}
			gamescript()
			}
			else
			{
				if(FlxG.keys.any())
				{
					FlxG.switchState(new PlayState);	
				}
			}
			super.update();
		}
			}
	
	
	
}