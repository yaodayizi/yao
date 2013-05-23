package 
{
	import flash.display.*;
	import flash.events.*;
	import com.bit101.components.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.*;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.net.URLVariables;
	
	[SWF(width=465,height=465,backgroundColor='#FFFFFF',frameRate='60')]
	
	public class Main extends Sprite
	{
		
		private var _sceneManager:SceneManager;
		
		public function Main()
		{
			
			//入力用
			var I:int = 0;
			for (I = 0; I < 256; ++I)
			{
				Global._key[I] = false;
			}
			stage.addEventListener(KeyboardEvent.KEY_DOWN, function(E:KeyboardEvent):void
				{
					Global._key[E.keyCode] = true;
				});
			stage.addEventListener(KeyboardEvent.KEY_UP, function(E:KeyboardEvent):void
				{
					Global._key[E.keyCode] = false;
				});
			
			//ゲーム開始
			_sceneManager = new SceneManager;
			SceneManager._next = new SceneStageSelect;
			addChild(_sceneManager);
		
		}
	
	}

}