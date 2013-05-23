package 
{
	import flash.display.Sprite;
	import flash.display.Graphics;
	//投擲アイテム
	class Item extends BaseActor implements Iactor
	{
		
		private const SIZE:int = 10;
		
		//画像
		private var _img:BitmapData = null;
		private var _shadow:BitmapData = null;
		
		//
		private var _manage_id:uint = 0;
		private var _timer:int = 0;
		private var _hit:Boolean = false;
		
		////////////////////////////////////
		public function Item(manage_id:uint, pos:Vector3D, velocty:Vector3D):void
		{
			
			super();
			
			_manage_id = manage_id;
			_timer = 80;
			
			//描画用
			var S:Sprite = new Sprite;
			var G:Graphics = S.graphics;
			
			//石本体
			G.clear();
			G.beginFill(0x404040, 1);
			G.drawCircle(SIZE / 2, SIZE / 2, SIZE / 2);
			G.endFill();
			_img = new BitmapData(SIZE, SIZE, true, 0);
			_img.draw(S);
			
			//影
			G.clear();
			G.beginFill(0, .5);
			G.drawEllipse(0, 0, SIZE, SIZE / 2);
			G.endFill();
			_shadow = new BitmapData(SIZE, SIZE / 2, true, 0);
			_shadow.draw(S);
			
			//座標
			_pos.x = pos.x;
			_pos.y = pos.y - 40;
			_pos.z = pos.z;
			_velocity.x = velocty.x;
			_velocity.y = velocty.y;
			_velocity.z = velocty.z;
		
		}
		
		////////////////////////////////////
		public function release():void
		{
			_img.dispose();
			_img = null;
		}
		
		////////////////////////////////////
		public function update():void
		{
			
			--_timer;
			
			_velocity.y += .3;
			_pos.x += _velocity.x;
			_pos.y += _velocity.y;
			_pos.z += _velocity.z * .5;
			
			if (0 <= _pos.y)
			{
				_pos.y = 0;
				_velocity.y = -_velocity.y * .5;
			}
		
		}
		
		////////////////////////////////////
		public function get death():Boolean
		{
			return _timer < 0;
		}
		
		////////////////////////////////////
		public function render_shadow():void
		{
			_shadowpos.x = _pos.x - SIZE / 2;
			_shadowpos.y = _pos.z - SIZE / 2 / 2;
			Global._canvas.copyPixels(_shadow, _shadow.rect, _shadowpos);
		}
		
		////////////////////////////////////
		public function render():void
		{
			_renderpos.x = _pos.x - SIZE / 2;
			_renderpos.y = _pos.z + _pos.y - SIZE;
			Global._canvas.copyPixels(_img, _img.rect, _renderpos);
		}
		
		////////////////////////////////////
		public function attackChk(e:Hero, effect:Effect, mainHero:Hero):void
		{
			
			if (death)
			{
				return;
			}
			
			if (_hit)
			{
				return;
			}
			
			if (_manage_id == e.id)
			{
				return;
			}
			
			var V:Vector3D = _pos.subtract(e.pos);
			V.y += 30;
			
			if (V.length < 30)
			{
				
				_hit = true;
				_velocity.x = -_velocity.x * .2;
				_velocity.y = -6;
				_timer = 40;
				
				if (e.damage())
				{
					if (_end == false)
					{
						++_score;
					}
				}
				
				effect.push(e.pos.x, e.pos.z + e.pos.y);
				
			}
		
		}

	}
	
}