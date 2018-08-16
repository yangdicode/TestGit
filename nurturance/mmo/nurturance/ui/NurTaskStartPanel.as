package mmo.nurturance.ui
{
	import mmo.nurturance.NurturanceAdvertiseHelper;
	import mmo.nurturance.NurturanceDoc;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.play.panel.MovieLayerPanel;

	public class NurTaskStartPanel
	{
		private var _mlp:MovieLayerPanel;
		
		public function NurTaskStartPanel()
		{
		}
		
		public function show():void{
			var path:String = "nurturance/nurext/nur" + gameId + "res/nurstart" ;
			var cls:String = "mmo.nurturance.nur" + gameId + ".TaskStartPanel";
			
			_mlp = new MovieLayerPanel();
			_mlp.addClickFunc("btnStart", onStart);
			_mlp.addClickFunc("btnLoadSave", onLoadSave);
			_mlp.addClickFunc("btnBonus", onBonus);
			_mlp.addClickFunc("btnCG", onCG);
			_mlp.addClickFunc("btnRoles", onRoles);
			_mlp.addClickFunc("btnAoYa", onAoYa);
			_mlp.addClickFunc("btnMore", openMore);
			
			_mlp.loadRes(path, cls, onDispose);
		}
		
		private function openMore():void
		{
			var _stageHold:* = NurturanceDoc.serviceHold;
			if (_stageHold){
				_stageHold.showGameList();
			}
		}
		
		private function get gameId():int
		{
			return  NurGameManager.instance.curGameId;
		}
		
		private function onDispose():void{
			_mlp = null;
		}
		
		private function onStart():void{
			NurGameManager.instance.checkAndStartGame(NurGameManager.instance.curGameId);
		}
		
		private function onLoadSave():void{
			new NurLoadSavePanel().show();
		}
		
		private function onBonus():void{
			new NurBonusPanel().show();
		}
		
		private function onCG():void{
			new NurCGPanel().show();
		}
		private function onRoles():void{
			new NurTaskRolesPanel();
		}
		private function onAoYa():void{
			NurturanceAdvertiseHelper.gotoAoYa();
		}
	}
}