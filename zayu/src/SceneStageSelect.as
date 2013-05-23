package 
{
	
	//ステージセレクト
	class SceneStageSelect extends SceneBase
	{
		
		private var _mrss:Mrss = new Mrss;
		
		////////////////////////////////////
		public function SceneStageSelect():void
		{
			
			_mrss.addEventListener("DECIDE", function(e:Event):void
				{
					_mrss.removeEventListener("DECIDE", arguments.callee);
					SceneManager._next = new SceneBattle;
				});
			
			addChild(_mrss);
		
		}
		
		public override function release():void
		{
			_mrss.release();
		}

	}
	
}