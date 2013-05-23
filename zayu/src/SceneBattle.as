package 
{
	import com.bit101.components.*;
	import flash.display.*;
	import flash.events.*;
	import flash.filters.*;
	import flash.geom.*;
	import flash.net.*;
	import flash.net.navigateToURL;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.utils.escapeMultiByte;
	import org.libspark.betweenas3.*;

	
	//戦闘シーン
	class SceneBattle extends SceneBase
	{
		
		private var _rendering_container:Vector.<Iactor> = new Vector.<Iactor>();
		private var _h:Vector.<Hero> = null;
		private var _i:Vector.<Item> = null;
		private var _mainHero:Hero = null;
		private var _effect:Effect = null;
		private var _scoreText:TextField = new TextField;
		
		//宣伝用//////////////////////
		private var _S0:PushButton;
		private var _S1:PushButton;
		private var _S2:PushButton;
		
		/////////////////////////////
		
		////////////////////////////////////
		public function SceneBattle()
		{
			
			//角色用
			_h = new Vector.<Hero>;
			
			//项目用
			_i = new Vector.<Item>;
			
			//ヒットマーク用
			_effect = new Effect;
			
			//キャラクタ画像読み込み(雑魚)
			var L:Loader = new Loader;
			L.contentLoaderInfo.addEventListener(Event.COMPLETE, compLoad);
			L.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, function():void
				{
				});
			L.load(new URLRequest(Global.FILENAME), new LoaderContext(true));
			
			addChild(new Bitmap(Global._canvas));
			
			//宣伝用////////////////////////////////////////////////////
			_S0 = new PushButton(this, 465 - 100, 0, "Ad:kuma-flashgame");
			_S0.addEventListener(MouseEvent.CLICK, function():void
				{
					var url:URLRequest = new URLRequest("http://kuma-flashgame.blogspot.com/");
					navigateToURL(url);
				});
			////////////////////////////////////////////////////////////
			
			//送信ボタン////////////////////////////////////////////////////
			_score = 0;
			_scoreText.autoSize = "left";
			_scoreText.defaultTextFormat = new TextFormat(null, 50, 0xFFFFFF);
			_scoreText.text = _score.toString();
			addChild(_scoreText);
			_S1 = new PushButton(this, 0, 0, "Tweet");
			_S1.x = (465 - _S1.width) / 2;
			_S1.y = (465 - _S1.height) / 2;
			_S1.visible = false;
			_S1.addEventListener(MouseEvent.CLICK, function():void
				{
					navigateToURL(new URLRequest("http://twitter.com/home?status=" + escapeMultiByte("score=" + _score + "  http://kuma-flashgame.blogspot.com/2010/08/blog-post_20.html #ZAKOgame")));
				});
			//////////////////////////////////////////////////////////
			_S2 = new PushButton(this, 0, 0, "Retry");
			_S2.x = (465 - _S1.width) / 2;
			_S2.y = (465 - _S1.height) / 2 + 40;
			_S2.visible = false;
			_S2.addEventListener(MouseEvent.CLICK, function():void
				{
					SceneManager._next = new SceneStageSelect;
				});
			////////////////////////////////////////////////////////////
			
			_end = false;
		
		}
		
		////////////////////////////////////
		public override function release():void
		{
			
			_mainHero = null;
			
			_S0 = null;
			_S1 = null;
			_S2 = null;
			
			_effect.release();
			
			for each (var H:Hero in _h)
			{
				H.release();
			}
			
			for each (var I:Item in _i)
			{
				I.release();
			}
			
			_h = null;
			_i = null;
		
		}
		
		////////////////////////////////////
		private function compLoad(e:Event):void
		{
			
			var B:Bitmap = e.target.content as Bitmap;
			
			_mainHero = new Hero(B);
			_h.push(_mainHero);
			
			_h.push(new Hero(B, new ColorTransform(.2, 1, .4, 1)));
			_h.push(new Hero(B, new ColorTransform(.2, 1, .4, 1)));
			_h.push(new Hero(B, new ColorTransform(.2, 1, .4, 1)));
			_h.push(new Hero(B, new ColorTransform(.2, 1, .4, 1)));
		
		}
		
		////////////////////////////////////
		public override function core():void
		{
			
			var TH1:Hero;
			var TH2:Hero;
			var ITEM:Item;
			var SB:Iactor;
			
			//背景
			Global._canvas.copyPixels(Global._back, Global._back.rect, Global.ZERO_POINT);
			
			if (_mainHero == null)
			{
				return;
			}
			
			//アイテム更新
			for each (ITEM in _i)
			{
				ITEM.update();
			}
			
			//アイテム消去
			for (var I:int = 0; I < _i.length; ++I)
			{
				if (_i[I].death)
				{
					_i.splice(I, 1);
				}
			}
			
			//入力
			for each (TH1 in _h)
			{
				if (TH1 == _mainHero)
				{
					_mainHero.input(mouseX, mouseY, Global._key[90], Global._key[88]);
				}
				else
				{
					TH1.inputAuto();
				}
			}
			
			//更新
			for each (TH1 in _h)
			{
				TH1.update(_i, _mainHero);
			}
			
			//攻撃判定
			for each (TH1 in _h)
			{
				for each (TH2 in _h)
				{
					TH1.attackChk(TH2, _effect, _mainHero);
				}
			}
			
			//アイテムの攻撃判定
			for each (ITEM in _i)
			{
				for each (TH1 in _h)
				{
					ITEM.attackChk(TH1, _effect, _mainHero);
				}
			}
			
			//移動判定
			for each (TH1 in _h)
			{
				for each (TH2 in _h)
				{
					TH1.moveChk(TH2);
				}
			}
			
			//描画順決定
			_rendering_container = _rendering_container.concat(_h);
			_rendering_container = _rendering_container.concat(_i);
			_rendering_container.sort(function(A:Iactor, B:Iactor):Number
				{
					return A.pos.z - B.pos.z;
				});
			
			//影描画
			for each (SB in _rendering_container)
			{
				SB.render_shadow();
			}
			
			//描画
			for each (SB in _rendering_container)
			{
				SB.render();
			}
			
			while (_rendering_container.length)
			{
				_rendering_container.pop();
			}
			
			_effect.update();
			_effect.render();
			
			_scoreText.text = _score.toString();
			if (_mainHero.getDeath())
			{
				_end = true;
				_S1.visible = true;
				_S2.visible = true;
			}
		
		}

	}
	
}