package folder 
{
	import com.foed.SteeredVehicle;
	import com.foed.Vector2D;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class FleeTest extends Sprite 
	{
		private var _vehicle:SteeredVehicle;
		public function FleeTest() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_vehicle = new SteeredVehicle();
			_vehicle.x = 100;
			_vehicle.y = 100;
			addChild(_vehicle);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			_vehicle.flee(new Vector2D(mouseX, mouseY));
			_vehicle.update();
		}
		
	}

}