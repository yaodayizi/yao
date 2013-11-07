package  
{
	import org.flixel.system.FlxPreloader;
	
	/**
	 * ...
	 * @author yaoyi
	 */
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass="Preloader")]
	public class Preloader extends FlxPreloader 
	{
		
		public function Preloader() 
		{
			className = "Main";
			super();
			
		}
		
	}

}