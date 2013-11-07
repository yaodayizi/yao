package  
{
	import flash.display.Sprite;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import SWCAssets.KeyButtonImage;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class KeyButton extends Sprite 
	{
		private var _image:KeyButtonImage;
		private var _text:TextField;
		public function KeyButton(letter:String) 
		{
			_image = new KeyButtonImage();
			_image.stop();
			addChild(_image);
			
			_text = new TextField();
			_text.defaultTextFormat = new TextFormat("Verdana", 28, 0xFFFFFF, true);
			_text.text = letter;
			_text.height = 38;
			
			_text.x = (_text.width / 2);
			_text.y = (_text.height / 2);
			_text.mouseEnabled = false;
			addChild(_text);
			
		}
		
		public function onUp():void
		{
			_image.gotoAndStop("Up");
		}
		
		public function onDown():void
		{
			_image.gotoAndStop("Down");
		}
		
		
		
	}

}