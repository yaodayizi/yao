package
{
	import effect.HitEffectManager;
	
	import enemy.Enemy;
	
	import objects.GameObject;
	
	import org.flixel.FlxGroup;
	import org.flixel.plugin.photonstorm.FlxBar;
	import org.flixel.plugin.photonstorm.FlxBitmapFont;
	
	import role.Ninja;
	import role.Robot;

	public class Registry
	{
		//[Embed(source = '../img/icons/healthbar.png')] public  static var healthBarPNG:Class;
		[Embed(source = '../img/icons/5.png')] public  static var healthBarPNG:Class;
		[Embed(source = '../img/sailor/mercurydeadbone.png')] public  static var merbonePNG:Class;
		[Embed(source = '../img/sailor/venudeadbone.png')] public  static var venubonePNG:Class;
		//
		[Embed(source = '../music/selectrole.mp3')] public static var selectmp3:Class;
		//[Embed(source = '../music/bg/bg.mp3')] public static var bgmp3:Class;
		[Embed(source = '../music/mmattack1.mp3')] public static var mmattack1mp3:Class;
		[Embed(source = '../music/roledamage.mp3')] public static var roledamagemp3:Class;
		//武器声音
		[Embed(source = '../music/missleshit.mp3')] public static var missleshit:Class;
		[Embed(source = '../music/weapon/watergunshit.mp3')] public static var watershit:Class;
		[Embed(source = '../music/expolehjt.mp3')] public static var expolehjt:Class;
		[Embed(source = '../music/weapon/jiquanqiang.mp3')] public static var jiqiang:Class;
		[Embed(source = '../music/weapon/humerhit.mp3')] public static var humerhit:Class;
		//打斗声音
		[Embed(source = '../music/dropdown/mmdropdown1.mp3')] public static var dropdown1mp3:Class;
		[Embed(source = '../music/dropdown/mmdropdown2.mp3')] public static var dropdown2mp3:Class;
		[Embed(source = '../music/dropdown/mmdropdown3.mp3')] public static var dropdown3mp3:Class;
		[Embed(source = '../music/dropdown/mmdropdown4.mp3')] public static var dropdown4mp3:Class;
		[Embed(source = '../music/dropdown/mmdropdown5.mp3')] public static var dropdown5mp3:Class;
		[Embed(source = '../music/catch/mmcatchdm1.mp3')] public static var mmcatchdm1mp3:Class;
		[Embed(source = '../music/catch/mmcatchdm2.mp3')] public static var mmcatchdm2mp3:Class;
		[Embed(source = '../music/catch/mmcatchdm3.mp3')] public static var mmcatchdm3mp3:Class;
		[Embed(source = '../music/catch/mmcatchdm4.mp3')] public static var mmcatchdm4mp3:Class;
		[Embed(source = '../music/catch/mmcatchdm5.mp3')] public static var mmcatchdm5mp3:Class;
		[Embed(source = '../music/hitblade.mp3')] public static var hitblademp3:Class;
		[Embed(source = '../music/blade.mp3')] public static var blademp3:Class;
		[Embed(source = '../music/mmdead1.mp3')] public static var mmdead1mp3:Class;
		[Embed(source = '../music/mmdead2.mp3')] public static var mmdead2mp3:Class;
		[Embed(source = '../music/dead/mmdead3.mp3')] public static var mmdead3mp3:Class;
		[Embed(source = '../music/dead/mmdead4.mp3')] public static var mmdead4mp3:Class;
		
		[Embed(source = '../music/mmdamage2.mp3')] public static var mmdamage2mp3:Class;
		[Embed(source = '../music/mmdamage1.mp3')] public static var mmdamage1mp3:Class;
		[Embed(source = '../music/damage/mmdamage3.mp3')] public static var mmdamage3mp3:Class;
		[Embed(source = '../music/damage/mmdamage4.mp3')] public static var mmdamage4mp3:Class;
		[Embed(source = '../music/damage/mmdamage5.mp3')] public static var mmdamage5mp3:Class;
		[Embed(source = '../music/damage/mmdamage6.mp3')] public static var mmdamage6mp3:Class;
		[Embed(source = '../music/damage/mmdamage7.mp3')] public static var mmdamage7mp3:Class;
		[Embed(source = '../music/damage/mmdamage8.mp3')] public static var mmdamage8mp3:Class;
		[Embed(source = '../music/damage/mmdamage9.mp3')] public static var mmdamage9mp3:Class;
		[Embed(source = '../music/damage/mmdamage10.mp3')] public static var mmdamage10mp3:Class;
		[Embed(source = '../music/damage/mmdamage11.mp3')] public static var mmdamage11mp3:Class;
		[Embed(source = '../music/dead/mmdead6.mp3')] public static var mmdead6mp3:Class;
		[Embed(source = '../music/dead/mmdead7.mp3')] public static var mmdead7mp3:Class;
		[Embed(source = '../music/dead/mmdead8.mp3')] public static var mmdead8mp3:Class;
		[Embed(source = '../music/dead/mmdead9.mp3')] public static var mmdead9mp3:Class;
		[Embed(source = '../music/dead/mmdead10.mp3')] public static var mmdead10mp3:Class;
		[Embed(source = '../music/dead/mmdead11.mp3')] public static var mmdead11mp3:Class;
		
		[Embed(source = '../music/attack/mmattack1.mp3')] public static var mmattack2mp3:Class;
		[Embed(source = '../music/attack/mmattack2.mp3')] public static var mmattack3mp3:Class;
		[Embed(source = '../music/attack/mmattack3.mp3')] public static var mmattack4mp3:Class;
		[Embed(source = '../music/attack/mmattack4.mp3')] public static var mmattack5mp3:Class;
		[Embed(source = '../music/attack/mmattack5.mp3')] public static var mmattack6mp3:Class;
		[Embed(source = '../music/attack/mmattack6.mp3')] public static var mmattack7mp3:Class;
		[Embed(source = '../music/attack/mmattack7.mp3')] public static var mmattack8mp3:Class;
		[Embed(source = '../music/attack/mmattack8.mp3')] public static var mmattack9mp3:Class;
		[Embed(source = '../music/attack/mmattack9.mp3')] public static var mmattack10mp3:Class;
		[Embed(source = '../music/attack/mmattack10.mp3')] public static var mmattack11mp3:Class;
		[Embed(source = '../music/attack/mmattack11.mp3')] public static var mmattack12mp3:Class;
		[Embed(source = '../music/attack/mmattack12.mp3')] public static var mmattack13mp3:Class;
		//walk
		[Embed(source = '../music/robotwalk.mp3')] public static var robotwalkmp3:Class;
		[Embed(source = '../music/robotattack.mp3')] public static var robotattackmp3:Class;
		[Embed(source = '../music/robotfire.mp3')] public static var robotfiremp3:Class;
		[Embed(source = '../music/robotice.mp3')] public static var roboticemp3:Class;
		//icons
		[Embed(source = '../img/icons/1.png')] public static var icon1png:Class;
		[Embed(source = '../img/icons/2.png')] public static var icon2png:Class;
		[Embed(source = '../img/icons/3.png')] public static var icon3png:Class;
		[Embed(source = '../img/icons/4.png')] public static var icon4png:Class;
		[Embed(source = '../img/icons/bar1.png')] public static var bar1png:Class;
		[Embed(source = '../img/icons/boss1.png')] public static var b1iconpng:Class;
		[Embed(source = '../img/icons/boss2.png')] public static var b2iconpng:Class;
		[Embed(source = '../img/icons/boss3.png')] public static var b3iconpng:Class;
		[Embed(source = '../img/icons/boss4.png')] public static var b4iconpng:Class;
		[Embed(source = '../img/icons/boss5.png')] public static var b5iconpng:Class;
		[Embed(source = '../img/icons/boss6.png')] public static var b6iconpng:Class;
		[Embed(source = '../img/icons/boss7.png')] public static var b7iconpng:Class;
		[Embed(source = '../img/icons/boss8.png')] public static var b8iconpng:Class;
		[Embed(source = '../img/icons/boss9.png')] public static var b9iconpng:Class;
		[Embed(source = '../img/icons/knighthawks_font.png')] public static var knighthawksFontPNG:Class;
		
		[Embed(source = '../img/icons/bluepink_font.png')] public static var bluepinkFontPNG:Class;
		[Embed(source = '../img/icons/gold_font.png')] public static var goldFontPNG:Class;
		
		[Embed(source = '../img/icons/knight3.png')] public static var knightHawksPurpleFontPNG:Class;
		//knighthawks_font.png
		
		public static var gameobjects:FlxGroup
		public static var deadobjects:FlxGroup
		public static var itemobjects:FlxGroup
		public static var afterlayer:FlxGroup  //远景层
	//	public static var bloodeffect:HitEffectManager  //血液效果
		public static var dolly:GameObject
		public static var player:GameObject
		public  static var player1:GameObject
		public static var robot:GameObject
		public static var bulletsgroup:FlxGroup
		public static var fxgroup:FlxGroup
		public static  var killcount:int=0
		public static var scene:int=0	
		public static var selectindex:int=0	
		public static var level:int=1	
		public static var score:int=0	
			//加一个boss的bar
		//public static var bossbar:FlxBar	
		public static function init():void
		{
			//player1=new Ninja(100,100,0)
			//robot=new  Robot(100,100)
			//robot.exists=false
			itemobjects=new FlxGroup()
			gameobjects=new FlxGroup()
			deadobjects=new FlxGroup()
			bulletsgroup=new FlxGroup()
			//bloodeffect=new HitEffectManager()
			fxgroup=new FlxGroup()
			afterlayer=new FlxGroup()	
			dolly=new GameObject()	
		
				//scoreFont=new FlxBitmapFont
				//gameobjects.add(player1)
		//gameobjects.add(robot)
		//Registry.player=player1
		}
	
	public static function destroy():void
	{
		itemobjects.destroy()
		gameobjects.destroy()
		deadobjects.destroy()
		bulletsgroup.destroy()
			
		afterlayer.destroy()	
		fxgroup.destroy()
		dolly.destroy()	
		scene=0
		killcount=0
		player1.destroy()
	}
	

		
	public static function clearcurrentlevel():void
	{
		itemobjects.destroy()
		//gameobjects.destroy()
		deadobjects.destroy()
		bulletsgroup.destroy()
		//afterlayer.destroy()	
		fxgroup.destroy()
		itemobjects=new FlxGroup()
		deadobjects=new FlxGroup()
		bulletsgroup=new FlxGroup()
		fxgroup=new FlxGroup()
		/*
			for each(var ob:GameObject in gameobjects.members)
			{
				if(ob!=null){
				  if((ob is Weapon || ob is Robot) && !ob.isuse)
				  {
					  Registry.gameobjects.remove(ob,true)
						  ob.destroy()
						  ob=null	  
						 	  
				   }
				  else if(ob is Enemy)
				    {
					  Registry.gameobjects.remove(ob,true)
					  ob.destroy()
					  ob=null	  
				    }
				}
				
				}
		*/
		//dolly.destroy()	
		scene=0
		killcount=0
		//player1.destroy()
			
		player.x=10
		player.y=120
	}
	
	}
}