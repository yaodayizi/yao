package 
{
	
	class Mrss extends Sprite
	{
		
		private const _feed:String = "http://api.flickr.com/services/feeds/photos_public.gne?tags=landscape&format=rss_200";
		private const _media:Namespace = new Namespace("http://search.yahoo.com/mrss/");
		private var _ib:Vector.<ImageButton> = new Vector.<ImageButton>;
		private var _v:Vector.<String> = new Vector.<String>;
		
		private var _decide:Bitmap = null;
		private var _cnt:int = 0;
		
		////////////////////////////////////
		public function Mrss()
		{
			
			var ldr:URLLoader = new URLLoader;
			
			ldr.addEventListener(Event.COMPLETE, function(e:Event):void
				{
					ldr.removeEventListener(Event.COMPLETE, arguments.callee);
					loadImg(XML(ldr.data).._media::thumbnail.@url.toXMLString().split('\n'));
				});
			
			ldr.load(new URLRequest(_feed));
		
		}
		
		////////////////////////////////////
		private function loadImg($images:Array):void
		{
			
			var len:uint = $images.length;
			for (var i:int = 0; i < len; ++i)
			{
				
				var ldr:Loader = new Loader;
				ldr.contentLoaderInfo.addEventListener(Event.COMPLETE, loadImgComp);
				
				var str:String = $images[i].replace("_s", "");
				ldr.load(new URLRequest(str), new LoaderContext(true));
				
			}
		
		}
		
		////////////////////////////////////
		private function loadImgComp(e:Event):void
		{
			
			var data:Bitmap = e.target.content as Bitmap;
			if (data)
			{
				
				data.scaleX = 80 / data.width;
				data.scaleY = 80 / data.height;
				data.filters = [new DropShadowFilter];
				
				var IB:ImageButton = new ImageButton(data, _cnt);
				
				IB.addEventListener("DECIDE", function(e:Event):void
					{
						IB.removeEventListener("DECIDE", arguments.callee);
						dispatchEvent(new Event("DECIDE"));
					});
				
				_ib.push(IB);
				addChild(IB);
				
				++_cnt;
			}
		
		}
		
		////////////////////////////////////
		public function release():void
		{
			
			for each (var IB:ImageButton in _ib)
			{
				IB.release();
			}
		
		}

	}
	
}