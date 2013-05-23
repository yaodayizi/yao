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
	public class SeekFleeTest2 extends Sprite
	{
		private var _vehicleA:SteeredVehicle;
		private var _vehicleB:SteeredVehicle;
		private var _vehicleC:SteeredVehicle;
		public function SeekFleeTest2() 
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_vehicleA = new SteeredVehicle();
			_vehicleA.position = new Vector2D(200, 200);
			_vehicleA.edgeBehavior = Vehicle.BOUNCE;
			_vehicleA.maxSpeed = 4;
			_vehicleA.mass = 2;
			addChild(_vehicleA); 
			
			_vehicleB = new SteeredVehicle();
			_vehicleB.position = new Vector2D(400, 300);
			_vehicleB.edgeBehavior = Vehicle.BOUNCE;
			_vehicleB.maxSpeed = 5;
			_vehicleB.mass = 1;
			addChild(_vehicleB);
			
			_vehicleC = new SteeredVehicle();
			_vehicleC.position = new Vector2D(300, 260);
			_vehicleC.edgeBehavior = Vehicle.BOUNCE;
			_vehicleB.maxSpeed = 5;
			_vehicleB.mass = 2;
			addChild(_vehicleC);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);	
		}
		
		private function onEnterFrame(e:Event):void 
		{
			_vehicleA.seek(_vehicleB.position);
			_vehicleA.flee(_vehicleC.position);
			
			_vehicleB.seek(_vehicleC.position);
			_vehicleB.flee(_vehicleA.position);
			
			_vehicleC.seek(_vehicleA.position);
			_vehicleC.flee(_vehicleB.position);
			
			_vehicleA.update();
			_vehicleB.update();
			_vehicleC.update();
		}
		
	}

}