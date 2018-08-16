package mmo.nurturance.ui
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.ui.util.NurUIUtil;
	import mmo.play.dialog.NewDialog;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.panel.MovieLayerPanel;

	public class NurTaskRolesPanel
	{
		private var _mlp:MovieLayerPanel;
		
		public function NurTaskRolesPanel()
		{
			var path:String = "nurturance/nurext/nur" + gameId + "res/nurroles";
			var cls:String = "mmo.nurturance.nur" + gameId + ".TaskRolesPanel";
			
			_mlp = new MovieLayerPanel();
			_mlp.loadRes(path, cls, null, onLoadedRes);
		}
		
		private function onLoadedRes():void{
			var spRoles:Sprite = _mlp.getSp("spRoles");
			
			for(var i:int = 0; i < 99; i++){
				var spNpc:Sprite = spRoles["spNpc"+i];
				if (spNpc != null){
					spNpc.buttonMode = true;
					spNpc.addEventListener(MouseEvent.CLICK, onClickBtnNpc);
				}
			}
			
			var mc:MovieClip = new MovieClip();
			mc.x = spRoles.x;
			mc.y = spRoles.y;
			mc.graphics.beginFill(0, 0);
			mc.graphics.drawRect(0, 0, 800, 390);
			mc.graphics.endFill();
			
			NurUIUtil.initScrollPanel(_mlp.panel, mc, _mlp["spRoles"]);
			
			_mlp.showPanel();
		}
		
		private function onClickBtnNpc(evt:MouseEvent):void{
			var index:int = int(evt.currentTarget.name.substr(5));
			var panel:Sprite = SceneDomainResLoader.getResByName("mmo.nurturance.nur" + gameId + ".NpcInfo" + index);
			MovieClip(panel["mcInfo"]).gotoAndStop(myLatestChapter + 1);
			NewDialog.show(panel, null, 0, 0);
		}
		
		private function get myLatestChapter():int{
			return NurGameManager.instance.gameStateProxy.getCurGameState().myLatestChapter;
		}
		
		private function get gameId():int
		{
			return  NurGameManager.instance.curGameId;
		}
	}
}