package  
{
	import flash.display.Stage;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
	import flash.utils.getTimer;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class ComboHandler 
	{
		public static var dispatcher:EventDispatcher;
		private static var pressedKeys:Array;
		private static var combos:Dictionary;
		private static const MAX_INTERVAL:int = 250;
		private static var interval:int;
		
		public function ComboHandler() 
		{
			
		}
		
		public static function initialize(stageReference:Stage):void
		{
			combos = new Dictionary();
			interval = 0;
			dispatcher = new EventDispatcher();
			stageReference.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}
		
		private static function onKeyDown(e:KeyboardEvent):void
		{
			if (getTimer() - interval > MAX_INTERVAL)
			{
				pressedKeys = [];
			}
			
			interval = getTimer();
			pressedKeys.push(e.keyCode);
			trace(e.keyCode);
			checkFormCombo();
		}
		
		 static private function checkFormCombo():void 
		{
			var i:int;
			var comboFound:String = "";
			for (var comboName:String in combos)
			{
				if (pressedKeys.join(" ").indexOf((combos[comboName] as Array).join(" ")) > -1)
				{
					comboFound = comboName;
					break;
				}
			}
			
			if (comboFound != "")
			{
				pressedKeys = [];
				dispatcher.dispatchEvent(new ComboEvent(ComboEvent.COMBO_FINISHED, { comboName:comboFound } ));
			}
		}
		
		public static function registerCombo(comboName:String, comboKeys:Array):Boolean
		{
			if (combos[comboName])
			{
				return false;
			}
			trace(comboName, comboKeys);
			combos[comboName] = comboKeys;
			return true;
		}
		
		public static function removeCombo(comboName:String):Boolean
		{
			if (combos[comboName])
			{
				combos[comboName] = undefined;
				return true;
			}
			
			return false;
		}
		
		public static function registerComboByLetter(comboname:String, comKeysStr:String):Boolean
		{
			var codeArr:Array = [];
			for (var i = 0; i < comKeysStr.length; i++)
			{
				//var s:String = comKeysStr.charAt(i);
				codeArr.push(comKeysStr.charCodeAt(i));
			}
			return registerCombo(comboname, codeArr);
		}
	}

}