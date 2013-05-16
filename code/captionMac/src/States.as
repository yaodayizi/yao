package
{
	import objects.GameObject;
	import org.flixel.FlxG;
	import org.flixel.FlxObject;
	import org.flixel.FlxSprite;

	public class States
	{
		public function States()
		{
		}
	
		/**
		 *   用于设置不同的状态,应该封装单独的类
		 * @param value 状态值  只能更新一次
		 * @param action   该状态对应的行为,比如状态value=攻击,攻击行为对应不同的攻击方式切换动画和速度/加速度,攻击数值.伤害等
		 * @param interrupted  标志此行为动画是否可以被打断  true表示不可以被打断
		 */	
	/*
		public static function setState(obj:GameObject,value:String,action:String,interrupted:Boolean=true,statechance:Boolean=true):void
		{
			if(interrupted && !obj.finished)return;
			
			if(statechance && obj.currentstate==value) return;  //不能不断更新状态
			trace("action "+action)
			obj.laststate=obj.currentstate
			obj.currentstate=value 	             //旧状态记录当前状态,更新当前状态为最新的状态
		   if(action==Actions.DROPDOWN_FACE)
		   {
			obj.x=100
			obj.starty=obj.y
			obj.velocity.y=-250
			obj.acceleration.y=420	
			   obj.play(action)
		   }
		   else
		   {
			   obj.play(action)
		   }
		   }
		*/
		public static function chancestate(obj:GameObject):void
		{
		//if(!isinterrupt())return;
		if(obj.acceleration.y==0 && obj.finished && obj.currentstate!=Actions.WALK)
		{
		obj.play(Actions.IDLE)
		obj.velocity.x=0
		obj.velocity.y=0	
		obj.currentstate=Actions.IDLE
		}
		}
		
		public static function setDamagePlayerState(value:String,obj:GameObject,damage:Number):void
		{
			obj.iscatch=false
			obj.isrun=false	
		    obj.isjump=false 
			if(value==obj.currentstate)	{return}
			if(obj.currentstate==Actions.DROPDOWN_FACE && !obj.finished)	{return}
			if(value==Actions.DAMAGE_NORMAL || value==Actions.DAMAGE_NORMAL1)
			{
				obj.velocity.x=0
				obj.velocity.y=0	
			}
			
			if((value==Actions.DROPDOWN_FACE))
			{
				obj.starty=obj.y
				obj.acceleration.y=520
				//obj.velocity.y=-250
				
				if(obj.facing==FlxObject.LEFT){
					
					//if(value==Actions.DROPDOWN_BACKFACE){
						obj.velocity.y=-200
						obj.velocity.x=-100
					}
				else 
				{
					obj.velocity.y=-200
					obj.velocity.x=100
					
				}
			}
				obj.currentstate=value
				//currentstate=value
				obj.health-=damage
				if(obj.currentstate==Actions.DAMAGE_NORMAL ||  obj.currentstate==Actions.DAMAGE_NORMAL1 || obj.currentstate==Actions.DROPDOWN_FACE)
				{
					FlxG.play(Registry.roledamagemp3,10,false);
				}
				obj.play(obj.currentstate)
				//trace("obj.health "+obj.health)
		}
		
		public static function setState(value:String,obj:GameObject):void
		{
			
			if(obj.acceleration.y!=0 ){
				obj.iscatch=false
			//if(!(value!=obj.currentstate && (  value==Actions.ATTACK_JUMPATTACK1 || value==Actions.ATTACK_JUMPATTACK2)))
				if(value!=obj.currentstate && (value==Actions.ATTACK_JUMPATTACK1 || value==Actions.ATTACK_RUNJUMP)){
					obj.currentstate=value
				}else{
				return
					}
					}
			//trace("aa  "+value)
		//if(obj.acceleration.y!=0 || (obj.currentstate==value && obj.currentstate!=Actions.WALK && obj.currentstate!=Actions.RUN))return
			//trace("value  "+value)
			
			if(!obj.finished && obj.currentstate==Actions.ATTACK_SUPER){return}
			if(!obj.finished && obj.currentstate==Actions.PICK){return}
			if(!obj.finished && obj.currentstate==Actions.WEAPONSHIT){return}
			if(!obj.finished && obj.currentstate==Actions.DAMAGE_NORMAL){return}
			if(!obj.finished && obj.currentstate==Actions.DAMAGE_NORMAL1){return}
			if(!obj.finished && obj.currentstate==Actions.DROPDOWN_FACE){return}
			if(!obj.finished && obj.currentstate==Actions.ATTACK_RUN){return}
			if(!obj.finished && obj.currentstate==Actions.ATTACK_THROW){return}
			if(!obj.finished && obj.currentstate==Actions.ATTACK_CATCH){return}
			if(!obj.finished && obj.currentstate==Actions.JUMP){return}
			//if(!obj.finished && obj.currentstate==Actions.ATTACK_JUMPATTACK1){return}
			//if(!obj.finished && value==Actions.STATE_CATCH){return}
			/*
			if(!obj.finished){
				if(value==Actions.RUN || value==Actions.WALK )
				{
				return	
				}
				if(value==Actions.IDLE && !(obj.currentstate==Actions.WALK  || obj.currentstate==Actions.RUN || obj.currentstate==Actions.IDLE))
				{
					return
				}
			
			}*/
//			if((!obj.finished && !( obj.currentstate==Actions.RUN || obj.currentstate==Actions.WALK || obj.currentstate==Actions.IDLE)) && (value==Actions.RUN  || value==Actions.WALK) ){
//			trace("ni ma da b")
//			return}
		//if(!obj.finished && ( obj.currentstate!=Actions.WALK  || obj.currentstate!=Actions.RUN || obj.currentstate!=Actions.IDLE)){return}
		//	if(!obj.finished && ( obj.currentstate==Actions.ATTACK_RUN ) && ( value==Actions.RUN || value==Actions.WALK)){return}
			
			obj.currentstate=value
		//trace("starty "+starty)	
		//if(acceleration.y==0){
		
		if(obj.currentstate==Actions.JUMP  )
		{
		if(obj.facing==FlxObject.RIGHT){
			obj.velocity.x=100}
		else
		{
			obj.velocity.x=-100
		}
			obj.velocity.y=0	
			obj.starty=obj.y
			obj.velocity.y=-250
			obj.acceleration.y=620
		}
		else if(obj.currentstate==Actions.ATTACK_CATCH || obj.currentstate==Actions.ATTACK_CONTINUE || obj.currentstate==Actions.ATTACK_NORMAL || obj.currentstate==Actions.ATTACK_RUN || obj.currentstate==Actions.ATTACK_THROW || obj.currentstate==Actions.POSE)
		{
			obj.velocity.x=0
			obj.velocity.y=0	
		}
		
		
//		if(obj.currentstate==Actions.WALK){
//		
//			obj.play(Actions.WALK)  
//		
//		}
//		else{
		//if(value==Actions.ATTACK_RUN){trace("attack run--"+obj.currentstate)}
		if(obj.currentstate==Actions.ATTACK_SUPER)
		{
			obj.health-=10
		}
	
		obj.play(obj.currentstate)
		//}
			
		}
		
		
	
	}
}