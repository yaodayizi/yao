package
{
	
	class ImageButton extends Sprite
	{
		
		private var IT:ITween = null;
		
		///////////
		public function ImageButton(data:Bitmap, cnt:int)
		{
			
			addChild(data);
			
			var X:int = Math.floor(cnt % 5) * (90) + 15 / 2;
			var Y:int = Math.floor(cnt / 5) * (90) + 90 / 2;
			
			var SIT:ITween = BetweenAS3.delay(BetweenAS3.tween(this, {_blurFilter: {blurX: 0, blurY: 0}, alpha: 1, x: X, y: Y}, {_blurFilter: {blurX: 20, blurY: 20}, alpha: 0, x: X, y: Y + 20}, .5, Cubic.easeOut), Math.random() * .5);
			
			SIT.addEventListener(Event.COMPLETE, run);
			SIT.play();
		
		}
		
		///////////
		private function run(e:Event):void
		{
			addEventListener(MouseEvent.CLICK, click);
			addEventListener(MouseEvent.MOUSE_OVER, over);
			addEventListener(MouseEvent.MOUSE_OUT, out);
		}
		
		///////////
		private function click(e:MouseEvent):void
		{
			
			var decide:Bitmap = null;
			decide = getChildAt(0) as Bitmap;
			if (null != decide)
			{
				
				var SX:Number = 465 / decide.width * decide.scaleX;
				var SY:Number = 465 / decide.height * decide.scaleY;
				
				var M:Matrix = new Matrix;
				if (SX < SY)
				{
					M.scale(SY, SY);
				}
				else
				{
					M.scale(SX, SX);
				}
				
				Global._back.draw(decide, M);
				
				if (IT)
				{
					IT.stop();
				}
				IT = BetweenAS3.to(this, {transform: {colorTransform: {redOffset: 250, greenOffset: 250, blueOffset: 250}}}, .2, Cubic.easeOut);
				IT.play();
				
				dispatchEvent(new Event("DECIDE"));
				
			}
		
		}
		
		///////////
		private function over(e:MouseEvent):void
		{
			if (IT)
			{
				IT.stop();
			}
			IT = BetweenAS3.to(this, {transform: {colorTransform: {redOffset: 60, greenOffset: 60, blueOffset: 60}}}, .2, Cubic.easeOut);
			IT.play();
		}
		
		///////////
		private function out(e:MouseEvent):void
		{
			if (IT)
			{
				IT.stop();
			}
			IT = BetweenAS3.to(this, {transform: {colorTransform: {redOffset: 0, greenOffset: 0, blueOffset: 0}}}, .2, Cubic.easeOut);
			IT.play();
		}
		
		///////////
		public function release():void
		{
			removeEventListener(MouseEvent.CLICK, click);
			removeEventListener(MouseEvent.MOUSE_OVER, over);
			removeEventListener(MouseEvent.MOUSE_OUT, out);
		}
	
	}

}