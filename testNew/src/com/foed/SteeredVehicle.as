package com.foed 
{
	import flash.display.SpreadMethod;
	/**
	 * ...
	 * @author yaoyi
	 */
	public class SteeredVehicle extends Vehicle
	{
		private var _maxForce:Number = 1;
		private var _steeringFoce:Vector2D;
		private var _arrivalThreshold:Number = 100;
		private var _wanderAngle:Number = 0;
		private var _wanderDistance:Number = 10;
		private var _wanderRadius:Number = 5;
		private var _wanderRange:Number = 1;
		public function SteeredVehicle() 
		{
			_steeringFoce = new Vector2D();
			super();
		}
		
		public function set MaxFoce(value:Number):void
		{
			_maxForce = value;
		}
		
		public function get maxForce():Number 
		{
			return _maxForce;
		}
		
		/**
		 * 到达临界值
		 */
		public function get arrivalThreshold():Number 
		{
			return _arrivalThreshold;
		}
		/**
		 * 到达临界值
		 */
		public function set arrivalThreshold(value:Number):void 
		{
			_arrivalThreshold = value;
		}
		
		public function get wanderAngle():Number 
		{
			return _wanderAngle;
		}
		
		public function set wanderAngle(value:Number):void 
		{
			_wanderAngle = value;
		}
		
		public function get wanderDistance():Number 
		{
			return _wanderDistance;
		}
		
		public function set wanderDistance(value:Number):void 
		{
			_wanderDistance = value;
		}
		
		public function get wanderRadius():Number 
		{
			return _wanderRadius;
		}
		
		public function set wanderRadius(value:Number):void 
		{
			_wanderRadius = value;
		}
		
		public function get wanderRange():Number 
		{
			return _wanderRange;
		}
		
		public function set wanderRange(value:Number):void 
		{
			_wanderRange = value;
		}
		
		override public function update():void
		{
			_steeringFoce.truncate(_maxForce);
			_steeringFoce = _steeringFoce.divide(_mass);
			_velocity = _velocity.add(_steeringFoce);
			super.update();
		}
		
		/**
		 * 寻找
		 * @param	target
		 */
		public function seek(target:Vector2D):void
		{
			//目标位置减现在位置 期望速度方向
			var desiredVelocity:Vector2D = target.subtract(_position);
			//单位化
			desiredVelocity.normalize();
			//单位化乘以最大速度 最快
			desiredVelocity = desiredVelocity.multiply(_maxSpeed);
			//还要减去本身的加速度
			var force:Vector2D = desiredVelocity.subtract(_velocity);
			_steeringFoce = _steeringFoce.add(force);
		}
		
		/**
		 * 躲避
		 * @param	target
		 */
		public function flee(target:Vector2D):void
		{
			//目标位置减现在位置 期望速度方向
			var desiredVelocity:Vector2D = target.subtract(_position);
			//单位化
			desiredVelocity.normalize();
			//单位化乘以最大速度 最快
			desiredVelocity = desiredVelocity.multiply(_maxSpeed);
			//还要减去本身的加速度
			var force:Vector2D = desiredVelocity.subtract(_velocity);
			//掉头
			_steeringFoce = _steeringFoce.subtract(force);
		}
		
		/**
		 * 到达
		 * 到了某个范围减速
		 * @param	target
		 */
		public function arrive(target:Vector2D):void
		{
			var desiredVelocity:Vector2D = target.subtract(_position);
			desiredVelocity.normalize();
			
			var dist:Number = _position.dist(target);
			if (dist > _arrivalThreshold)
			{
				desiredVelocity = desiredVelocity.multiply(_maxSpeed);
			}
			else
			{
				desiredVelocity = desiredVelocity.multiply(_maxSpeed * dist / _arrivalThreshold);
			}
			var force:Vector2D = desiredVelocity.subtract(_velocity);
			_steeringFoce = _steeringFoce.add(force);
			//_steeringFoce = force;
		}
		
		/**
		 * 预测追捕
		 * @param	target
		 */
		public function pursue(target:Vehicle):void
		{
			var lookAheadTime:Number = position.dist(target.position) / maxSpeed;
			var predictedTarget:Vector2D = target.position.add(target.velocity.multiply(lookAheadTime));
			seek(predictedTarget);
		}
		
		/**
		 * 预测躲避
		 * @param	target
		 */
		public function evade(target:Vehicle):void
		{
			var lookAheadTime:Number = position.dist(target.position) / maxSpeed;
			var predictedTarget:Vector2D = target.position.add(target.velocity.multiply(lookAheadTime));
			flee(predictedTarget);
		}
		
		/**
		 * 漫游
		 */
		public function wander():void
		{
			var center:Vector2D = velocity.clone().normalize().multiply(_wanderDistance);
			var offset:Vector2D = new Vector2D(0);
			offset.length = _wanderRadius;
			offset.angle = _wanderAngle;
			_wanderAngle += Math.random() * _wanderRange - _wanderRange * .5;
			var force:Vector2D = center.add(offset);
			_steeringFoce = _steeringFoce.add(force);
		}
	}

}