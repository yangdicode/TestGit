package mmo.nurturance.ui
{
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.play.panel.MovieLayerPanel;

	public class NurAdvertisePanel
	{
		private var _mlp:MovieLayerPanel;
		
		public function NurAdvertisePanel()
		{
		}
		
		public function show():void{
			var curGameId:int = NurGameManager.instance.curGameId;
			var path:String = "nurturance/nurext/nur" + curGameId + "res/nurad";
			var cls:String = "mmo.nurturance.nur" + curGameId + ".AdvertisePanel";
			_mlp = new MovieLayerPanel();
			_mlp.addClickFunc("btnStart", onBtnStart);
			_mlp.loadRes(path, cls, onDispose, onLoadedRes);
		}
		
		private function onDispose():void{
			_mlp = null;
		}
		
		private function onLoadedRes():void{
			var latestChapterId:int = NurGameManager.instance.gameStateProxy.getCurGameState().myLatestChapter;
			_mlp.getMc("mcBonus").gotoAndStop(latestChapterId);
			_mlp.getMc("mcIcon").gotoAndStop(latestChapterId);
			_mlp.showPanel();
		}
		
		private function onBtnStart():void{
			_mlp.closePanel();
			NurGameManager.instance.checkAndStartGame(NurGameManager.instance.curGameId);
		}
	}
}