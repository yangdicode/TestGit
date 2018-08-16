package mmo.nurturance.ui
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DateUtil;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.gamemanager.model.NurSaveProxy;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.play.dialog.NewDialog;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.panel.MovieLayerPanel;

	public class NurLoadSavePanel
	{
		private const totalSaveNum:int = 12;
		
		private var _closeFun:Function;
		private var _mlp:MovieLayerPanel;
		
		public function NurLoadSavePanel()
		{
		}
		
		public function get gameId():int{
			return NurGameManager.instance.curGameId;
		}
		
		public function show(closeFun:Function = null):void{
			_closeFun = closeFun;
			_mlp = new MovieLayerPanel();
			_mlp.addClickFunc("btnExit", onBtnExit);
			_mlp.loadRes("nurturance/nursysui/ressave", "mmo.nurturance.sysui.SavePanel", onDispose, onLoadedRes);
		}
		
		private function onDispose():void{
			if(_closeFun != null){
				_closeFun = null;
			}
			_mlp = null;
		}
		
		private function onLoadedRes():void{
			SceneDomainResLoader.loadRes("nurturance/nurext/nur" + gameId + "res/nurchapter", "", onLoadedChapter);
			function onLoadedChapter():void{
				initPanel();
				_mlp.showPanel();
			}
		}
		
		private function initPanel():void{
			for(var i:int = 0; i < totalSaveNum; i++){
				var saveProxy:NurSaveProxy = NurGameManager.instance.saveProxy;
				var saveId:int = i + 1;
				var mcSave:MovieClip = _mlp.getMc("mcSave" + i);	
				var mcLock:MovieClip = _mlp.getMc("mcLock" + i);
				
				if(!saveProxy.haveSaveBySaveId(saveId)){
					if(saveProxy.isAuto(saveId)){
						mcSave.gotoAndStop(1);
					}else{
						mcSave.gotoAndStop(3);
					}	
					mcLock.stop();
					mcLock.visible = false;
				}else{
					initMcSave(mcSave, mcLock, saveProxy.getSaveBySaveId(saveId));
				}	
			}
			_mlp.getMc("mcNotice").gotoAndStop(2);
		}
		
		private function initMcSave(mcSave:MovieClip, mcLock:MovieClip, save:NurUserSave):void{
			mcLock.mouseEnabled = false;
			mcLock.mouseChildren = false;
			trace("::::::::::::::::::saveId:" + save.saveId);
			trace("::::::::::::::::::savechapterId:" + save.chapterId);
			trace("::::::::::::::::::saveIsAuto:" + save.isAuto);
			trace("::::::::::::::::::saveIslock:" + save.isLock);
			if(save.isAuto){
				mcSave.gotoAndStop(1);
				TextField(mcSave["txtInfo"]).text = "第" + save.saveId + "章节结束";
			}else{
				mcSave.gotoAndStop(2);
				TextField(mcSave["txtInfo"]).text = dateToStr(save.saveDate);
			}
			
			if(save.isLock){
				mcLock.gotoAndStop(1);
			}else{
				mcLock.gotoAndStop(2);
			}
			mcSave.buttonMode = true;
			mcSave.addEventListener(MouseEvent.CLICK, onClickSave);
			
			var mcThumbnail:MovieClip = SceneDomainResLoader.getResByName("mmo.nurturance.nur"+ 
				gameId + ".ChapterThumbnail" + save.chapterId);
			var mcContainer:MovieClip = mcSave["mcContainer"];
			mcContainer.addChild(mcThumbnail);
		}
		
		private function onClickSave(evt:MouseEvent):void{
			var saveId:int = int(evt.currentTarget.name.substr(6)) + 1;
			NewDialog.showChoiceDialog("你确定要读取存档吗？", onLoadSave);
			function onLoadSave():void{
				var saveProxy:NurSaveProxy = NurGameManager.instance.saveProxy;
				var save:NurUserSave = saveProxy.getSaveBySaveId(saveId);
				NurManageHandler.instance.start(save.getCopy());
			}
		}
		
		private function dateToStr(timeNum:Number):String{
			var date:Date = DateUtil.getChinaDateByNumber(timeNum);
			return date.fullYear + "-" + int(date.month + 1) + "-" + date.date + " " + date.hours + ":" + date.minutes + ":" +date.seconds;
		}
		
		private function onBtnExit():void{
			_mlp.panel.visible = false;//防止截图被截取到
			if(_closeFun != null){
				_closeFun.apply();
			}
			_mlp.closePanel();
		}
	}
}