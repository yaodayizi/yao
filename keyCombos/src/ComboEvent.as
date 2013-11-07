package  
{
	import flash.events.Event;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	public class ComboEvent extends Event 
	{
		public static const COMBO_FINISHED:String = "comboFinished";
		public var params:Object;
		
		public function ComboEvent(type:String, params:Object,bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			this.params = params;
			
		}
		
		 override public function clone():Event
		{
			return new ComboEvent(type, this.params, bubbles, cancelable);
		}
		
		override public function toString():String
		{
			return formatToString("ComboEvent", "params", "type", "bubbles", "cancelable");
		}
	}

}