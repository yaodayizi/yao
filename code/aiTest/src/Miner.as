package  
{
	import enum.LocationType;
	import flash.media.Video;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class Miner extends BaseGameEntity
	{
		/**
		 * 矿工必须感到舒适
		 */
		private const  ComforLevel = 5;
		/**
		 * 可以携带最多的矿石
		 */
		private const MaxNuggets = 3;
		/**
		 * 超过这个值矿工就渴了
		 */
		private const ThirstLevel = 5;
		/**
		 * 超过这个值矿工就想睡觉了
		 */
		private const TirednessThreshold = 5;
		private var _CurrentState:State;
		private var _location:LocationType;
		/**
		 * 有多少矿在口袋里
		 */
		private var _goldCarried:int;
		private var _moneyInBank:int;
		/**
		 * 口渴
		 */
		private var _thirst:int;
		/**
		 * 疲劳
		 */
		private var _fatigue:int;
		public function Miner() 
		{
			
		}
		
		override public function update():void
		{
			_thirst += 1;
			i
		}
		
		public  function changeState(newState:State):void
		{
			
		}
		
		public  function set changeLoction(value):void
		{
			_location = value;
		}
		
		public function get goldCarried():int 
		{
			return _GoldCarried;
		}
		
		public function set goldCarried(value:int):void 
		{
			_GoldCarried = value;
		}
		
		public function addGarried(val:int):void
		{
			_goldCarried += val;
			if (_goldCarried < 0) goldCarried = 0;
		}
		
		/**
		 * Wealth 财富
		 * @param	val
		 */
		public function addToWealth(val:int):void
		{
			_moneyInBank += val
			if (_moneyInBank < 0 ) _moneyInBank = 0;
		}
		
		

	}

}