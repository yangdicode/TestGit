package mmo.nurturance.gamemanager
{
	import mmo.nurturance.NurturanceAdvertiseHelper;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.gamemanager.model.NurDefinesProvider;
	import mmo.nurturance.gamemanager.model.NurGameStateProxy;
	import mmo.nurturance.gamemanager.model.NurSaveProxy;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.ui.NurLoadSavePanel;
	import mmo.nurturance.ui.NurSavePanel;
	import mmo.nurturance.ui.NurTaskStartPanel;
	import mmo.play.dialog.NewDialog;

	public class NurGameManager
	{
		private static var _instance:NurGameManager;

		private var _gameStateProxy:NurGameStateProxy;
		private var _saveProxy:NurSaveProxy;

		public function NurGameManager(inner:Inner)
		{
		}

		public static function get instance():NurGameManager{
			if(_instance == null){
				_instance = new NurGameManager(new Inner());
			}
			return _instance
		}
		
		public function share():void
		{
			NurturanceAdvertiseHelper.copyContent();
			NewDialog.showMessage("你已经复制好要分享的内容了哦，赶快召唤其他小伙伴一起来玩吧~");
		}

		public function get gameStateProxy():NurGameStateProxy{
			return _gameStateProxy;
		}

		public function get saveProxy():NurSaveProxy{
			return _saveProxy;
		}

		public function get curGameId():int{
			return _gameStateProxy.curGameId;
		}

		public function init(callBack:Function = null):void{
			var curGameId:int = NurDefinesProvider.getLatestGameId();
			_gameStateProxy = new NurGameStateProxy();
			_gameStateProxy.init(curGameId, onGameStateInited);

			function onGameStateInited():void{
				updateCurGame(curGameId, callBack);
			}
		}

		public function showStartPanel():void{
			new NurTaskStartPanel().show();
		}

		public function showSavePanel(tempSave:NurUserSave, closeFun:Function = null):void{
			new NurSavePanel().show(tempSave, closeFun);
		}

		public function showLoadSavePanel(closeFun:Function = null):void{
			new NurLoadSavePanel().show(closeFun);
		}

		public function finishEnding(endingId:int, callBack:Function):void{
			_gameStateProxy.finishEnding(endingId, callBack);
		}

		public function finishCG(cgId:int, callBack:Function):void{
			_gameStateProxy.finishCG(cgId, callBack);
		}

		public function finishChapter(chapterId:int, callBack:Function):void{
			_gameStateProxy.finishChapter(chapterId, callBack);
		}

		public function updateCurGame(gameId:int, callBack:Function = null):void{
			_gameStateProxy.updateCurGame(gameId);
			_saveProxy = new NurSaveProxy();
			_saveProxy.init(gameId, onSaveInited);

			function onSaveInited():void{
				if(callBack != null){
					callBack.apply();
				}
			}
		}

		public function autoSave(save:NurUserSave, callBack:Function = null):void{
			_saveProxy.save(save.chapterId, save.curNode, save.chapterId, save.extStr,callBack);
		}

		public function checkAndStartGame(gameId:int):void{
			if (!_saveProxy.haveAutoSave()){
				showNewGame();
				return;
			}
			choiceLoadAutoSave(gameId);
		}
		
		private function showNewGame():void
		{
			NewDialog.showChoiceDialog("确定要重新开始故事吗？", onNewSave);
			function onNewSave():void{
				var save:NurUserSave = NurGameManager.instance.saveProxy.getNewSave();
				NurManageHandler.instance.start(save);
			}
		}

		public function hadfinishLatestChapter():Boolean{
			return _gameStateProxy.hadfinishLatestChapter();
		}

		public function hadgainEndings(gameId:int):Array{
			return _gameStateProxy.hadgainEndings(gameId);
		}

		private function choiceLoadAutoSave(gameId:int):void{
			NewDialog.showChoiceDialog("你确定读取自动存档继续游戏吗？", onNext, null, null, true, true);
			function onNext(btnName:String):void{
				if(btnName == "btnOK"){
					var save:NurUserSave = _saveProxy.getLeastAutoSave();
					NurManageHandler.instance.start(save.getCopy());
				}else{
					showNewGame();
				}
			}
		}
	}
}
class Inner{
}

