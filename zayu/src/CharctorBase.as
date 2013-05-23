package
{
	
	class CharctorBase extends ActorParam implements Iactor
	{
		
		//アニメーションテーブル
		private var $A:Array = null;
		private var $B:Array = null;
		private var $C:Array = null;
		private var $D:Array = null;
		private var $E:Array = null;
		private var $F:Array = null;
		
		//体力
		private var _hp:int = 0;
		private var _death:Boolean = false;
		private var _death_cnt:int = 0;
		
		//アニメーション用
		private var _anim:int = 0;
		private var _animwait:int = 0;
		private var _action:int = 0;
		private var _actionstep:int = 0;
		private var _dirc:Boolean = false;
		
		//入力用
		private var _input_damage:Boolean = false;
		private var _input_attack:Boolean = false;
		private var _input_jump:Boolean = false;
		private var _target_x:int = 0;
		private var _target_z:int = 0;
		private var _speed:Number = 0;
		
		//ジャンプ管理
		private var _jump_state:Boolean = false;
		
		//攻撃管理
		private var _attack_state:int = 0;
		private var _attack_shake:int = 0;
		private var _hitRegist:Vector.<int> = new Vector.<int>;
		
		//被ダメージ管理
		private var _damage_action:int = 0;
		private var _damage_shake:int = 0;
		
		////////////////////////////////////
		public function CharctorBase(B:Bitmap, C:ColorTransform, $$A:Array, $$B:Array, $$C:Array, $$D:Array, $$E:Array, $$F:Array)
		{
			
			super(B, C, 64);
			
			$A = $$A;
			$B = $$B;
			$C = $$C;
			$D = $$D;
			$E = $$E;
			$F = $$F;
			
			_hp = 3;
			_death = false;
			_death_cnt = 0;
			input(Math.random() * 400, 300 + Math.random() * 150, false, false);
		
		}
		
		////////////////////////////////////
		public function input(x:int, y:int, keyA:Boolean, keyJ:Boolean):void
		{
			_input_attack = keyA;
			_input_jump = keyJ;
			_target_x = x;
			_target_z = y;
		}
		
		////////////////////////////////////
		public function inputAuto():void
		{
			
			_input_attack = Math.random() < 0.03;
			_input_jump = Math.random() < 0.01;
			
			var V:Vector3D = _pos.clone();
			V.x -= _target_x;
			V.z -= _target_z;
			if (V.length < 20 * SCALE)
			{
				_target_x = Math.random() * 465;
				_target_z = Math.random() * 120 + 300;
			}
		}
		
		////////////////////////////////////
		public function getDeath():Boolean
		{
			return _death;
		}
		
		////////////////////////////////////
		public function update(item:Vector.<Item>, mainHero:CharctorBase):void
		{
			
			var CHK:Boolean = true;
			var TC:int = $C[_action][_actionstep];
			var Ba:int = _action;
			var Bas:int = _actionstep;
			var X:Number = 0;
			var Y:Number = 0;
			var L:Number = 0;
			
			if (_death)
			{
				
				if (60 < ++_death_cnt && this != mainHero)
				{
					
					_hp = 3;
					_death = false;
					_death_cnt = 0;
					
					_pos.x = (Math.random() < .5) ? -100 : 500;
					_pos.y = 0;
					_velocity.y = 0;
					
					_action = 12;
					
				}
				
			}
			
			if (0 < _damage_shake)
			{
				CHK = false;
				--_damage_shake;
			}
			
			if (0 < _attack_shake)
			{
				CHK = false;
				--_attack_shake;
			}
			
			{ //入力の反映
				
				if (1 & TC)
				{
					
					X = _pos.x - _target_x;
					Y = _pos.z - _target_z;
					L = X * X + Y * Y;
					_action = (10 * 10 < L) ? 1 : 0;
					
				}
				
				if (2 & TC)
				{
					
					if (_input_attack)
					{
						
						if (_jump_state)
						{
							
							_action = 6;
							
						}
						else
						{
							
							switch (_attack_state)
							{
								case 0: 
									_attack_state = 1;
									_action = 3;
									break;
								case 1: 
									_attack_state = 2;
									_action = 7;
									break;
								case 2: 
									_attack_state = 0;
									_action = 4;
									break;
							}
						}
						
					}
					else
					{
						
						_attack_state = 0;
						
					}
					
				}
				
				if (4 & TC)
				{
					if (_input_jump)
					{
						_action = 2;
					}
				}
				
				if (8 & TC)
				{
					if (_input_attack && _input_jump)
					{
						_action = 13;
					}
				}
				
				//強制動作
				if (_damage_action)
				{
					_action = _damage_action;
					_damage_action = 0;
				}
				
				if (Ba != _action)
				{
					_actionstep = 0;
					_animwait = 0;
				}
			
			}
			
			if (CHK)
			{ //アニメーション
				
				var TD:int = $D[_action][_actionstep];
				switch (TD)
				{
					
					case 0: 
						++_animwait;
						break;
					
					case 1: 
						if (0 < _velocity.y)
						{
							++_animwait;
						}
						break;
					
					case 2: 
						if (false == _jump_state)
						{
							++_animwait;
						}
						break;
					
					case 3: 
						break;
				}
				
				if ($B[_action][_actionstep] <= _animwait)
				{
					
					_animwait = 0;
					
					switch ($E[_action][_actionstep])
					{
						case 1: 
							_velocity.y = -5;
							break;
						case 2: 
							_action = (_jump_state) ? 12 : 0;
							break;
						case 3: 
							item.push(new Item(id, _pos, new Vector3D((_dirc) ? -8 : 8, -3, 0)));
							break;
						default: 
							break;
					}
					
					if ($A[_action].length <= ++_actionstep)
					{
						_actionstep = 0;
					}
					
					while (_hitRegist.length)
					{
						_hitRegist.pop();
					}
					
				}
				
			}
			
			if (CHK && (1 & TC))
			{ //加速
				
				_dirc = (_target_x < _pos.x);
				
				var ty:Number = _velocity.y;
				_velocity.y = 0;
				
				X = (_target_x - _pos.x);
				Y = (_target_z - _pos.z);
				L = X * X + Y * Y;
				if (10 * 10 < L)
				{
					_velocity.x += X * .01;
					_velocity.z += Y * .01;
				}
				
				_speed = _velocity.length;
				_speed = (2 < _speed) ? 2 : _speed;
				
				_velocity.normalize();
				_velocity.scaleBy(_speed);
				
				_velocity.y = ty;
				
			}
			
			if (CHK)
			{ //移動
				
				_pos.x += _velocity.x * SCALE;
				_pos.y += _velocity.y * SCALE;
				_pos.z += _velocity.z * SCALE * .5;
				_velocity.y += .2;
				
				if (false == _jump_state)
				{
					_velocity.x *= .9;
					_velocity.z *= .9;
				}
				
				if (0 <= _pos.y)
				{
					_pos.y = 0;
					_jump_state = false;
				}
				else
				{
					_jump_state = true;
				}
				
				if (_pos.z < ZMAX)
				{
					_pos.z = ZMAX;
				}
				
			}
			
			_anim = $A[_action][_actionstep];
		
		}
		
		////////////////////////////////////
		public function attackChk(e:Hero, effect:Effect, mainHero:Hero):void
		{
			
			if (this == e)
			{
				return;
			}
			
			if (e._death)
			{
				return;
			}
			
			for each (var N:int in _hitRegist)
			{
				if (N == e.id)
				{
					return;
				}
			}
			
			var temp:int = $F[_action][_actionstep];
			if (temp != 0)
			{
				
				var V:Vector3D = _pos.subtract(e._pos);
				
				if (_dirc)
				{
					V.x -= 16 * SCALE;
				}
				else
				{
					V.x += 16 * SCALE;
				}
				
				if (V.length < 30)
				{
					
					_attack_shake = 10;
					
					if (e.damage() && this == mainHero)
					{
						if (_end == false)
						{
							++_score;
						}
					}
					
					_hitRegist.push(e.id);
					effect.push(e.pos.x, e.pos.z + e.pos.y);
				}
				
			}
		
		}
		
		////////////////////////////////////
		public function damage():Boolean
		{
			
			var B:Boolean = false;
			
			//死亡チェック
			if (--_hp <= 0)
			{
				
				_death = true;
				_death_cnt = 0;
				_damage_action = 11;
				B = true;
				
			}
			else
			{
				
				_damage_action = 8 + Math.floor(Math.random() * 3);
				
			}
			
			//ノックバック
			_velocity.x = (_dirc) ? -1 : 1;
			_damage_shake = 15;
			
			return B;
		}
		
		////////////////////////////////////
		public function moveChk(e:Hero):void
		{
			
			if (this == e)
			{
				return;
			}
			
			var V:Vector3D = _pos.subtract(e._pos);
			if (V.length < 20 * SCALE)
			{
				V.normalize();
				_velocity.x = V.x * 1;
				_velocity.z = V.z * 1;
			}
		
		}
		
		////////////////////////////////////
		public function render_shadow():void
		{
			_shadowpos.x = _pos.x - SIZE / 4 / 2 * SCALE;
			_shadowpos.y = _pos.z - SIZE / 8 / 2 * SCALE;
			Global._canvas.copyPixels(_shadow, _shadow.rect, _shadowpos);
		}
		
		////////////////////////////////////
		public function render():void
		{
			
			if (_death)
			{
				if (_death_cnt % 10 < 5)
				{
					return;
				}
			}
			
			_anim %= 40;
			_render_rect.x = Math.floor(_anim % 8) * SIZE;
			_render_rect.y = Math.floor(_anim / 8) * SIZE;
			
			_renderpos.x = _pos.x - SIZE / 2;
			_renderpos.y = _pos.z + _pos.y - SIZE;
			
			if (_damage_shake)
			{
				_renderpos.x += Math.random() * 10 - 5;
				_renderpos.y += Math.random() * 10 - 5;
			}
			
			if (_dirc)
			{
				Global._canvas.copyPixels(_img_r, _render_rect, _renderpos);
			}
			else
			{
				Global._canvas.copyPixels(_img, _render_rect, _renderpos);
			}
		
		}
	
	}

}