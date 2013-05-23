package 
{
	
	//雑魚のモーション
	class Hero extends CharctorBase
	{
		
		//アニメパターン
		private const $HERO_A:Array = [[0, 1, 2, 3], //歩く
			[32, 33, 34, 35, 36, 37], //走る
			[4, 5, 6, 7, 4], //飛ぶ
			[8, 9], //パンチ
			[10, 11, 12], //強いパンチ
			[13, 4], //ジャンプパンチ
			[14, 4], //ジャンプキック
			[29, 15], //キック
			[16], //弱ダメージ
			[17], //中ダメージ
			[18], //強ダメージ
			[19, 20, 21, 22, 22], //ダウン
			[7, 4], //落下
			[24, 25, 26, 27, 0] //投擲 
			];
		
		//ウェイト
		private const $HERO_B:Array = [[8, 8, 8, 8], //歩く
			[5, 5, 5, 5, 5, 5], //走る
			[2, 2, 5, 2, 5], //飛ぶ
			[9, 9], //パンチ
			[7, 7, 8], //強いパンチ
			[2, 5], //ジャンプパンチ
			[2, 5], //ジャンプキック
			[3, 6], //キック
			[15], //弱ダメージ
			[15], //中ダメージ
			[15], //強ダメージ
			[9, 9, 9, 9, 99], //ダウン
			[2, 5], //落下
			[20, 7, 4, 12, 5] //投擲
			];
		
		//入力の許可 1=移動 + 2=攻撃 + 4=ジャンプ + 8=投擲
		private const $HERO_C:Array = [[15, 15, 15, 15], //歩く
			[15, 15, 15, 15, 15, 15], //走る
			[0, 2, 2, 2, 0], //飛ぶ
			[0, 0], //パンチ
			[0, 0, 0], //強いパンチ
			[0, 0], //ジャンプパンチ
			[0, 0], //ジャンプキック
			[0, 0], //キック
			[0], //弱ダメージ
			[0], //中ダメージ
			[0], //強ダメージ
			[0, 0, 0, 0, 0], //ダウン
			[0, 0], //落下
			[0, 0, 0, 0, 0] //投擲
			];
		
		//アニメーションの条件 0=ウェイト 1=_velocity.yが+方向 2=地面に接地 3=終わらない
		private const $HERO_D:Array = [[0, 0, 0, 0], //歩く
			[0, 0, 0, 0, 0, 0], //走る
			[0, 1, 0, 2, 0], //飛ぶ
			[0, 0], //パンチ
			[0, 0, 0], //強いパンチ
			[2, 0], //ジャンプパンチ
			[2, 0], //ジャンプキック
			[0, 0], //キック
			[0], //弱ダメージ
			[0], //中ダメージ
			[0], //強ダメージ
			[0, 0, 0, 0, 3], //ダウン
			[2, 0], //落下
			[0, 0, 0, 0, 0] //投擲
			];
		
		//アニメーション切り替わりの際の特殊動作ＩＤ 1=ジャンプ 2=[歩くor落下]状態に戻る 3=飛び道具発生
		private const $HERO_E:Array = [[0, 0, 0, 0], //歩く
			[0, 0, 0, 0, 0, 0], //走る
			[1, 0, 0, 0, 2], //飛ぶ
			[0, 2], //パンチ
			[0, 0, 2], //強いパンチ
			[0, 2], //ジャンプパンチ
			[0, 2], //ジャンプキック
			[0, 2], //キック
			[2], //弱ダメージ
			[2], //中ダメージ
			[2], //強ダメージ
			[0, 0, 0, 0, 2], //ダウン
			[0, 2], //落下
			[0, 0, 3, 0, 2] //投擲
			];
		
		//攻撃判定
		private const $HERO_F:Array = [[0, 0, 0, 0], //歩く
			[0, 0, 0, 0, 0, 0], //走る
			[0, 0, 0, 0, 0], //飛ぶ
			[0, 1], //パンチ
			[0, 1, 0], //強いパンチ
			[1, 0], //ジャンプパンチ
			[1, 0], //ジャンプキック
			[0, 1], //キック
			[0], //弱xダメージ
			[0], //中ダメージ
			[0], //強ダメージ
			[0, 0, 0, 0, 0], //ダウン
			[0, 0], //落下
			[0, 0, 0, 0, 0] //投擲
			];
		
		public function Hero(B:Bitmap, C:ColorTransform = null):void
		{
			super(B, C, $HERO_A, $HERO_B, $HERO_C, $HERO_D, $HERO_E, $HERO_F);
		}

}