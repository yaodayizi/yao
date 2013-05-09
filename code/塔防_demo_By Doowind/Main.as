package 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Main extends MovieClip {
		private var gunNumber:int = 0;//记录炮台数量
		private var gold:int = 20;
		private var life:Number = 20;//命
		private var item1:Item_1;
		private var cannon:Gun;
		private var enemy:Enemy;
		private var deathNumer:int = 0;//死亡人数
		private var Time:int = 5;//倒计时数
		private var wave:int = 1;
		private var coDown:CountDown = new CountDown();//倒计时动画
		private var countTimer:Timer = new Timer(1000);
		private var enemyArr:Array = new Array(20);//存放敌人
		private var myTimer:Timer = new Timer(2000); //敌人间隔
		private var cannonArr:Array;//存放加农炮
		private var index:int = 0;
		private var gunIndex:int = 0;
		private var enemyIndex:int = 0;
		private var Start:Boolean = false; 
		private var group:Sprite;
		//地图，最后一列1是为了允许通过
		public var map:Array 
		
		public function Main() {
			if(Start == true)
			init();
			}
		public function init():void {
			 map = new Array (  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
		                        [1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1], 
								[0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1],
		                        [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1], 
								[0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1],
		                        [0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1], 
								[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
		                        [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1], 
								[0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1],
		                        [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1], 
								[0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1],
		                        [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1],
								[0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1], 
								[0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1],
		                        [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1])
			cannonArr = new Array();
		    group = new Sprite();
			life = 20;
			wave = 1;
			Time = 5;
			deathNumer = 0;
			gold = 20;
			goldText.text = String(gold);
			textWave.text =String(wave);
			coDown.x = 300;
			coDown.y = 250;
			coDown.visible = false;
			countTimer.addEventListener(TimerEvent.TIMER, oncount);
			countTimer.reset();
			countTimer.start();
		   for (var index:int = 0; index < 20; index++ )
		     enemyArr[index] = 0;
			 cannonArr[0] = 0;
		   addEventListener(Event.ENTER_FRAME, onframe);
		   myTimer.addEventListener(TimerEvent.TIMER, onShowEnemy);
		   addChild(group);
	    	for (var i:int = 0; i < 15; i++ )
			  for (var j:int = 0; j < 15; j++ )
			    if (map[i][j] == 0) { 
					item1 = new Item_1;
					item1.y = i*40;
			        item1.x = j * 40;
					group.addChild(item1);
			   }
		    addChild(coDown)
			}
		
		private function oncount(event:TimerEvent):void {
		      Time -= 1;
              if (Time < 4 && Time > 0) {
				  coDown.visible = true;
				  coDown.gotoAndPlay("count" + Time);
				  }
			  if (Time == 0) {
				  removeChild(coDown);
				  myTimer.reset();
				  myTimer.start();
			      countTimer.stop(); 
			  }
			 
			}
			
		private function onShowEnemy(event:TimerEvent):void {
			enemy = new Enemy(wave);
			enemy.x = 0;
			enemy.y = 0;
			enemy.value = 1+(wave-1)/2;
			enemy.speed = 1 + (wave-1) / 5;
			enemy.blood = wave * 10;
			enemyArr[index] = enemy;
			addChild(enemyArr[index]);
			enemyArr[index].x = 0;
			enemyArr[index].y = 60;
			enemyArr[index].move(0);
			index++;
			if (index >= 20)
			 {
				 myTimer.stop();
				 index = 0;
			 }
			 
		}
		private function clearAll():void {
			for (var i:int = 0; i < cannonArr.length; i++ ) 
				if (cannonArr[i] != 0) {
					removeChild(cannonArr[i]);
					cannonArr[i] = 0;
					}
			
			for (var j:int = 0; j < 20; j++ )
			 if (enemyArr[j] != 0) {
				 removeChild(enemyArr[j]);
			     enemyArr[j] = 0;
			 }
			   gunNumber = 0;
		       removeChild(group);
			   myTimer.stop();
			   countTimer.stop();
			   btnmotar.body.removeEventListener(MouseEvent.MOUSE_DOWN,onmotarCatch);
               btnmotar.body.removeEventListener(MouseEvent.MOUSE_OVER,onmotarShowTip);
               btnmotar.body.removeEventListener(MouseEvent.MOUSE_OUT,onmotarClearTip)
			   btncannon.body.removeEventListener(MouseEvent.MOUSE_DOWN,onCatch);
               btncannon.body.removeEventListener(MouseEvent.MOUSE_OVER,onShowTip);
               btncannon.body.removeEventListener(MouseEvent.MOUSE_OUT,onClearTip)
			   countTimer.removeEventListener(TimerEvent.TIMER, oncount);
			   myTimer.removeEventListener(TimerEvent.TIMER, onShowEnemy);
			   removeEventListener(Event.ENTER_FRAME, onframe);  
			}
		private function onframe(event:Event):void {
			//trace(cannonArr[0]);
			//各个敌人的转向
			for (var j:int = 0; j < 20; j++ )
			{   
				if (enemyArr[j]!=0 && enemyArr[j].derection == 0 && map[int(enemyArr[j].y/40)][int((enemyArr[j].x+20) / 40)] != 1 && map[int(enemyArr[j].y/40) - 1][int((enemyArr[j].x)/40)] != 1)
			    enemyArr[j].turnDown();
				else if (enemyArr[j]!=0 && enemyArr[j].derection == 0 && map[int(enemyArr[j].y/40)][int((enemyArr[j].x+20)/40)] != 1 && map[int(enemyArr[j].y/40) + 1][int(enemyArr[j].x/40)] != 1)
			    enemyArr[j].turnUp(); 
				else if (enemyArr[j]!=0 && enemyArr[j].derection == 1 && map[int((enemyArr[j].y+20)/40)][int(enemyArr[j].x/40)] != 1 && map[int(enemyArr[j].y/40)][int(enemyArr[j].x/40) + 1] != 1)
			    enemyArr[j].turnLeft();
			    else if (enemyArr[j]!=0 && enemyArr[j].derection == 1 && map[int((enemyArr[j].y+20)/40)][int(enemyArr[j].x/40)] != 1 && map[int(enemyArr[j].y/40)][int(enemyArr[j].x/40) - 1] != 1)
			    enemyArr[j].turnRight();
			    else if (enemyArr[j]!=0 && enemyArr[j].derection == 2 && map[int(enemyArr[j].y/40)][int((enemyArr[j].x - 20)/40)] != 1 && map[int(enemyArr[j].y/40) - 1][int(enemyArr[j].x/40)] != 1)
			    enemyArr[j].turnDown(); 
			    else if (enemyArr[j]!=0 && enemyArr[j].derection == 2 && map[int(enemyArr[j].y/40)][int((enemyArr[j].x - 20)/40)] != 1 && map[int(enemyArr[j].y/40) + 1][int(enemyArr[j].x/40)] != 1)
			    enemyArr[j].turnUp(); 
			    else if (enemyArr[j]!=0 && enemyArr[j].derection == 3 && map[int((enemyArr[j].y - 20)/40)][int(enemyArr[j].x/40)] != 1 && map[int(enemyArr[j].y/40)][int(enemyArr[j].x/40) - 1] != 1)
			    enemyArr[j].turnRight();
			    else if (enemyArr[j]!=0 && enemyArr[j].derection == 3 && map[int((enemyArr[j].y - 20)/40)][int(enemyArr[j].x/40)] != 1 && map[int(enemyArr[j].y/40)][int(enemyArr[j].x/40) + 1] != 1)
			    enemyArr[j].turnLeft();
			 }
			 //加农炮瞄准以及射击
			 for (var l:int = 0; l < cannonArr.length;l++ )
			   for (var i:int = 0; i < 20; i++ ) { 
				   if (cannonArr[l] != 0 && enemyArr[i] != 0 && cannonArr[l].inThisArea(enemyArr[i]) == true ) {
					   cannonArr[l].target = enemyArr[i];
				       gunIndex = l;
				       enemyIndex = i;
				       cannonArr[l].tempx = enemyArr[i].x;
				       cannonArr[l].tempy = enemyArr[i].y;
				       cannonArr[l].fireTimer.start();
				       cannonArr[l].guan.rotation = 180 + Math.atan2(cannonArr[l].x - enemyArr[i].x, enemyArr[i].y - cannonArr[l].y) * 180 / Math.PI;
				       break;
				  }
			   else if (cannonArr[l]!=0 && enemyArr[i]!=0 && i == 19 && cannonArr[l].inThisArea(enemyArr[i]) == false ){
					  //cannonArr[l].guan.rotation = 0;
					  cannonArr[l].fireTimer.stop();
			     }
			  
			  }
			  //加农炮的目标减血
			  for (var l:int = 0; l < cannonArr.length; l++ ){
			   if (cannonArr[l] != 0 && cannonArr[l].shootOk == true ) { 
				  cannonArr[l].target.wasShoot(cannonArr[l].power);
				  cannonArr[l].shootOk = false;
				}
				if (cannonArr[l] != 0 && cannonArr[l].target!=null&&cannonArr[l].target.blood <= 0)
				   cannonArr[l].fireTimer.stop();
				if (cannonArr[l]!=0 && cannonArr[l].menu.wasSold == true) {
					gold += cannonArr[l].value;
					goldText.text = String(gold);
					removeChild(cannonArr[l]);
					map[int(cannonArr[l].y / 40)][int(cannonArr[l].x / 40)] = 0;
					cannonArr[l] = 0;
					gunNumber --;
					}
				   
			  }
			   for (var i:int = 0; i < 20; i++ ) {
				   if (enemyArr[i] != 0 && enemyArr[i].x >= 600) {
					   life --;
					   lifeText.text = String(life);
					   enemyArr[i].stopMoving();
					   removeChild(enemyArr[i]);
					   deathNumer ++;
					   enemyArr[i] = 0;
					   }
					if(enemyArr[i] !=0 )
				      enemyArr[i].life.gotoAndStop(int(enemyArr[i].blood*10/wave)+1);
				  if ((enemyArr[i] != 0 && enemyArr[i].blood <= 0 )) {
					  gold += enemyArr[i].value;
					  goldText.text = String(gold);
				      enemyArr[i].stopMoving();
					  enemyArr[i].gotoAndPlay("bao");
					  enemyArr[i] = 0;
					  //removeChild(enemyArr[i]);
					  deathNumer ++;
					  enemyArr[i] = 0;
					  if (i == 19)
					        for (var j:int = 0; j < cannonArr.length; j++ ) {
								 if(cannonArr[j]!=0){
						          cannonArr[j].fireTimer.stop();
						         // cannonArr[j].guan.rotation = 0;
								}
					      }
				       }
				} 
			
			
			if (deathNumer == 20) {
				wave ++;
				textWave.text = String(wave);
				myTimer.reset();
				myTimer.start();
				deathNumer = 0;
			}
			if (life <= 0 || wave == 11 ) {
				if(wave == 11)
				  wave = 10
			   textWave.text = String(wave);
			   clearAll();
			   gotoAndStop("gameover");
			}	
			
			   
		}
		
	}
	
	
}