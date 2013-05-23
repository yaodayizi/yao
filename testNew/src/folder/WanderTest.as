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
	public class WanderTest extends Sprite 
	{
		private var _vehicle:SteeredVehicle;
		public function WanderTest() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_vehicle = new SteeredVehicle();
			addChild(_vehicle);
			_vehicle.position = new Vector2D(200, 200);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			
		}
		
		private function onEnterFrame(e:Event):void 
		{
			//_vehicle.seek(new Vector2D(mouseX, mouseY));
			//_vehicle.arrive(new Vector2D(mouseX, mouseY));
			_vehicle.wander();
			_vehicle.update();
		}
		
	}

}