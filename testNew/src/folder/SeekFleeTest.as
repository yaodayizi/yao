package folder 
{
	import com.foed.SteeredVehicle;
	import com.foed.Vector2D;
	import com.foed.Vehicle;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class SeekFleeTest extends Sprite
	{
		private var _seeker:SteeredVehicle;
		private var _fleer:SteeredVehicle;
		public function SeekFleeTest() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_seeker = new SteeredVehicle();
			_seeker.position = new Vector2D(200, 200);
			_seeker.edgeBehavior = Vehicle.BOUNCE;
			_seeker.maxSpeed = 4;
			_seeker.mass = 2;
			addChild(_seeker); 
			
			_fleer = new SteeredVehicle();
			_fleer.position = new Vector2D(400, 300);
			_fleer.edgeBehavior = Vehicle.WRAP;
			_fleer.maxSpeed = 5;
			_fleer.mass = 1;
			addChild(_fleer);
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void 
		{
			_seeker.seek(_fleer.position);
			_fleer.flee(_seeker.position);
			_seeker.update();
			_fleer.update();
		}
		
	}

}