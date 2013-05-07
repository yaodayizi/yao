package
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	
	import role.Ninja;

	public class SelectState extends FlxState
	{
		[Embed(source = '../img/icons/selectborder.png')] public   var selectborderpng:Class;	
		[Embed(source = '../img/icons/selectplayer.png')] public   var selectplayerpng:Class;	
		private var border:FlxSprite
		private var playerboard:FlxSprite
		private var index:int=0
		private var offsetX:int=2
		private var offsetY:int=40	
		override public function create():void
		{
			border=new FlxSprite(offsetX,offsetY)
			border.loadGraphic(selectborderpng)	
			playerboard=new FlxSprite(0,0)	
			playerboard.loadGraphic(selectplayerpng)
		    add(playerboard)
			add(border)
		}
	
		override public function update():void
		{
			if (FlxG.keys.justPressed("A"))
			{
				FlxG.play(Registry.selectmp3,10,false);
				var tmpleft:int=(index-1<0)?0:(index-1)
					index=tmpleft
			        border.x=offsetX+index*96
			}
			else if (FlxG.keys.justPressed("D"))
			{
				FlxG.play(Registry.selectmp3,10,false);
				var tmpright:int=(index+1>3)?3:(index+1)
				index=tmpright
				border.x=offsetX+index*96
			}
			
			if (FlxG.keys.justPressed("J"))
			{
			trace("select J "+index)
			
				//FlxG.fade(0xff000000, 2, changeState);
				//FlxG.music.fadeOut(2);
			Registry.selectindex=index
//			Registry.init()
//			Registry.player1=new Ninja(100,100,index)
//			Registry.gameobjects.add(Registry.player1)
//			Registry.player=Registry.player1
				changeState()
			}
			super.update();
		}
		
		private function changeState():void
		{
		FlxG.switchState(new PlayState);
		//	FlxG.switchState(new LevelScrollState);
		}
		
		override public function destroy():void
		{
			//FlxSpecialFX.clear();
			
			super.destroy();
		}
	
	
	}
}