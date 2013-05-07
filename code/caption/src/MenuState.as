package
{
	import anim.SailorAnim;
	
	import org.flixel.FlxG;
	import org.flixel.FlxState;
	


	public class MenuState extends FlxState
	{
		private var startanim:SailorAnim=new SailorAnim()
		override public function create():void
		{
	startanim=new SailorAnim()
		add(startanim)	
		}
	
		override public function update():void
		{
			if (FlxG.keys.justPressed("J"))
			{
				//FlxG.fade(0xff000000, 2, changeState);
				//FlxG.music.fadeOut(2);
				//
				
				
				trace("menu J")
				changeState()
			}
			super.update();
		}
		
		private function changeState():void
		{
			FlxG.switchState(new SelectState);
		}
		
		override public function destroy():void
		{
			//FlxSpecialFX.clear();
			startanim.destroy()
			startanim=null
			super.destroy();
		}
	
	}



}