package mmo.nurturance.ui
{
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	
	import mmo.nurturance.NurturanceAdvertiseHelper;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.ui.util.NurUIUtil;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.panel.MovieLayerPanel;

	public class NurBonusPanel
	{
		private var _mlp:MovieLayerPanel;
		
		public function NurBonusPanel()
		{
		}
		
		private function get gameId():int
		{
			return NurGameManager.instance.curGameId;
		}
		
		private function get subPath():String{
			return "nurturance/nurext/nur" + gameId + "res/";
		}
		
		private function get subCls():String{
			return "mmo.nurturance.nur" + gameId  + ".";
		}
		
		public function show():void{
			_mlp = new MovieLayerPanel();
			_mlp.addClickFunc("btnAoYa", gotoAoYa);
			_mlp.addClickFunc("btnShare", gotoShare);
			_mlp.loadRes(subPath + "nurbonus", subCls + "TaskBonusPanel", onDispose, onLoadedRes);
		}
		
		private function onLoadedRes():void
		{
//			initBtnChapterBonus();
//			initMcCantainer();
			
			_mlp.showPanel();
		}
		
		private function initBtnChapterBonus():void{
			for(var i:int = 0; i < 48; i++){
				if(_mlp.getBtn("btnChapterBonus" + i)){
					var btnChapterBonus:SimpleButton = _mlp.getBtn("btnChapterBonus" + i);
					var mcTips:MovieClip = SceneDomainResLoader.getResByName(subCls + "ChapterBonusTips");
					NurUIUtil.addReplaceTips(btnChapterBonus, mcTips, i);
				}
			}
		}
		
		private function initMcCantainer():void{
			var finishEndings:Array = NurGameManager.instance.gameStateProxy.getCurGameState().finishEnding;
			for(var i:int = 0; i < 48; i++){
				if(MovieClip(_mlp.getMc("mcContainer")["mcEndingBonus" + i])){
					var mcEndingBonus = MovieClip(_mlp.getMc("mcContainer")["mcEndingBonus" + i]);
					var mcTips:MovieClip = SceneDomainResLoader.getResByName(subCls + "EndingBonusTips");
					NurUIUtil.addReplaceTips(mcEndingBonus, mcTips, i);
				}
			}
		}
		
		private function gotoAoYa():void
		{
			NurturanceAdvertiseHelper.gotoAoYa();
		}
		
		private function gotoShare():void
		{
			NurGameManager.instance.share();
		}
		
		private function onDispose():void{
			_mlp = null;
		}
	}
}