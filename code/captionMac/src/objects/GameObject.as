package objects
{
	import enemy.Enemy;
	import enemy.PrettySoldier;
	
	import flash.utils.getTimer;
	
	import org.flixel.FlxSprite;

	public class GameObject extends FlxSprite
	{
		//限制x,y方向的移动
		public var leftx:Number=-50
		public var rightx:Number=700
		public var upy:Number=50
		public var downy:Number=300
		public var gamemode:int=0	//游戏模式
		public var jumpspeed:Number=-250
		public var walktime:int=0
		//public var isrobot:Boolean=false
		public var type:int
		public var isrobot:Boolean=false
		public var isuse:Boolean=false
		public var speedx:Number=100
		public var speedy:Number=100
		public var starty:Number
		public var speed:Number=40
		public var laststate:String=Actions.IDLE
		public var currentstate:String=Actions.IDLE	
		//public var isattack:Boolean=false	
		public var iscontinue:Boolean=false
		public var isjump:Boolean=false
		public var isrun:Boolean=false
		public var iscatch:Boolean=false	
		public var maxlife:Number=100
		//public var isjump:Boolean=false
		public var runrecord:int=0	
		//public var isrun:Boolean=false
		public var runfirsttime:Number
		public var runtwotime:Number
		public var catchtarget:Enemy=null
			public var stx:Number
			public var sty:Number
		public function GameObject()
		{
		}
		public  function setState(value:String):void
		{
			
		}
		//判断是否双击进行奔跑
		public function justrun():void
		{
			if(runrecord==0){
				runrecord++	
					runfirsttime=getTimer()
			}
			else if(runrecord==1)
			{
				runtwotime=getTimer()
				if(runtwotime-runfirsttime<700)
				{
					runrecord++
				}
				else
				{
					runrecord=0
				}
			}
			if(runrecord==2){
				runrecord=0
				isrun=true
				//States.setState(Actions.RUN,this)
			}
		}
	
//	public override function update():void
//	{
//		
//	}
		
	}
}