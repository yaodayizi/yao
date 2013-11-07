package  
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.errors.IOError;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class tesLoader extends Sprite 
	{
		private var loader:Loader;
		private var bitmap:Bitmap;
		public function tesLoader() 
		{
			init();
		}
		
		private function init():void 
		{
			bitmap = new Bitmap();
			loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, complete);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, iOError);
			loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityError);
			var url:String = "http://i3.vanclimg.com/users/26/1307/0712/af1/star2_130713.jpg";
			loader.load(new URLRequest(url));
		}
		
		private function complete(e:Event):void 
		{
			trace(e);
			//addChild(loader.content);
			//loader.content.width = 100;
			//loader.content.height = 100;
			var tmpBitmapData:BitmapData = Bitmap(loader.content).bitmapData;
			bitmap.smoothing = true;
			bitmap.bitmapData = new BitmapData(loader.content.width, loader.content.height);
			bitmap.bitmapData.copyPixels(tmpBitmapData,new Rectangle(0, 0, loader.content.width, loader.content.width),new Point(0,0));
			addChild(bitmap);
			bitmap.width = 150;
			bitmap.height = 150;
			//bitmap.smoothing = true;
			
		}
		
		private function iOError(e:IOErrorEvent):void 
		{
			trace(e);
		}
		
		private function securityError(e:SecurityErrorEvent):void 
		{
			trace(e);
		}

		
	}

}