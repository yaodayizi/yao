package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;

	/**
	 * ...
	 * @author yaoyi
	 */
	[Frame(factoryClass="Preloader")]
	public class Main extends Sprite 
	{
		private var keyButtons:Array = [];
		private var keys:Array = ["A", "S", "D", "F"];
		private var textFeild:TextField;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}

		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			var i:int;
			
			for (i = 0; i < 4; i++)
			{
				keyButtons[i] = new KeyButton(keys[i]);
				KeyButton(keyButtons[i]).x = 100 + (100 * i);
				KeyButton(keyButtons[i]).y =  50;
				addChild(KeyButton(keyButtons[i]));
			}
			ComboHandler.initialize(stage);
			//ComboHandler.registerCombo("AAA combo", [65, 65, 65]);
			//ComboHandler.registerCombo("SSS Combo", [83, 83, 83]);
			//ComboHandler.registerCombo("ASDF Combo", [65, 83, 68, 70]);
			ComboHandler.registerComboByLetter("气功波","SDJ");
			ComboHandler.registerComboByLetter("升龙拳", "DSDJ");
			ComboHandler.registerComboByLetter("跑", "DD");
			
			textFeild = new TextField();
			textFeild.defaultTextFormat = new TextFormat("Verdana", 20, 0x000000, true);
			textFeild.x = 100;
			textFeild.y = 200;
			textFeild.width = 300;
			textFeild.text = "No combo";
			addChild(textFeild);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			ComboHandler.dispatcher.addEventListener(ComboEvent.COMBO_FINISHED, onComboComplete);
			
			
		}
		
		private function onComboComplete(e:ComboEvent):void 
		{
			textFeild.text = e.params.comboName;
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			for (var i = 0; i < 4; i++)
			{
				if (String.fromCharCode(e.keyCode) == keys[i])
				{
					KeyButton(keyButtons[i]).onUp();
					break;
				}
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void 
		{
			for (var i = 0; i < 4; i++)
			{
				if (String.fromCharCode(e.keyCode) == keys[i])
				{
					KeyButton(keyButtons[i]).onDown();
					break;
				}
			}
		}
		
		

	}

}