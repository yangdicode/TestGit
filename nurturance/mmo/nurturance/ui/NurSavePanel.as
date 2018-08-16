package mmo.nurturance.ui
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.net.sendToURL;
	import flash.text.TextField;
	
	import mmo.common.DateUtil;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.gamemanager.model.NurSaveProxy;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.panel.MovieLayerPanel;

	
	public class NurSavePanel
	{
		private const totalSaveNum:int = 12;
		
		private var _closeFun:Function;
		private var _tempSave:NurUserSave;
		private var _mlp:MovieLayerPanel;
		
		public function NurSavePanel()
		{
		}
		
		public function get gameId():int{
			return NurGameManager.instance.curGameId;
		}
		
		public function show(tempSave:NurUserSave, closeFun:Function = null):void{
			_tempSave = tempSave;
			_closeFun = closeFun;
			_mlp = new MovieLayerPanel();
			_mlp.addClickFunc("btnExit", onBtnExit);
			_mlp.loadRes("nurturance/nursysui/ressave", "mmo.nurturance.sysui.SavePanel", onDispose, onLoadedRes);
		}
		
		private function onDispose():void{
			if(_closeFun != null){
				_closeFun = null;
			}
			_tempSave = null;
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
				mcSave.addEventListener(MouseEvent.CLICK, onClickSave);
				setMcMouseEnable(mcSave, true);
				
				if(!saveProxy.haveSaveBySaveId(saveId)){
					trace("saveId=======" + saveId);
					initNoSaveItem(mcSave, mcLock, saveId);
				}else{
					trace("saveId=======" + saveId);
					updateSaveItem(mcSave, mcLock, saveProxy.getSaveBySaveId(saveId));
				}					
			} 
			_mlp.getMc("mcNotice").gotoAndStop(1);
		}
		
		private function initNoSaveItem(mcSave:MovieClip, mcLock:MovieClip, saveId:int):void{
			var saveProxy:NurSaveProxy = NurGameManager.instance.saveProxy;
			if(saveProxy.isAuto(saveId)){
				setMcMouseEnable(mcSave, false);
				mcSave.gotoAndStop(1);
			}else{
				mcSave.gotoAndStop(3);
			}		
			mcLock.stop();
			mcLock.visible = false;
		}
		
		private function updateSaveItem(mcSave:MovieClip, mcLock:MovieClip, save:NurUserSave):void{
			if(save.isAuto){
				mcSave.gotoAndStop(1);
				setMcMouseEnable(mcLock, false);
				setMcMouseEnable(mcSave, false);
				TextField(mcSave["txtInfo"]).text = "第" + save.saveId + "章节结束";
			}else{
				mcSave.gotoAndStop(2);
				setMcMouseEnable(mcSave, true);
				TextField(mcSave["txtInfo"]).text = dateToStr(save.saveDate);
			}
			
			trace("save.chapterId=======" + save.chapterId);
			
			var mcThumbnail:MovieClip = SceneDomainResLoader.getResByName("mmo.nurturance.nur"+ 
				gameId + ".ChapterThumbnail" + save.chapterId);
			var mcContainer:MovieClip = mcSave["mcContainer"];
			mcContainer.addChild(mcThumbnail);
			updateLockState(mcLock, save.isLock);
		}
		
		private function updateLockState(mcLock:MovieClip, isLock:Boolean):void{
			if(isLock){
				mcLock.gotoAndStop(1);
			}else{
				mcLock.gotoAndStop(2);
			}
			mcLock.visible = true;
			mcLock.addEventListener(MouseEvent.CLICK, onClickLock);
		}
		
		private function setMcMouseEnable(mc:MovieClip, enable:Boolean):void{
			mc.mouseEnabled = enable;
			mc.mouseChildren = enable;
			mc.buttonMode = enable;
		}
		
		private function onClickSave(evt:MouseEvent):void{
			var saveId:int = int(evt.currentTarget.name.substr(6)) + 1;
			var saveProxy:NurSaveProxy = NurGameManager.instance.saveProxy;
			if(saveProxy.isLock(saveId)){
				NewDialog.showFailMessage("不能覆盖锁定中的存档，点击存档右下角小锁头图标就能解锁哦~");
				return;
			}
			if(saveProxy.haveSaveBySaveId(saveId)){
				NewDialog.showChoiceDialog("原存档将会被替换成当前存档，确定要覆盖存档吗？", onSave);
			}else{
				NewDialog.showChoiceDialog("确定要存档吗？", onSave);
			}
			
			function onSave():void{
				ProgressFullSprite.show();
				saveProxy.save(saveId, _tempSave.curNode, _tempSave.chapterId,_tempSave.extStr, onSaveSuc);
			}
			function onSaveSuc():void{
				ProgressFullSprite.close();
				updateSaveItem(_mlp.getMc("mcSave" + int(saveId - 1)),
					_mlp.getMc("mcLock" + int(saveId - 1)), saveProxy.getSaveBySaveId(saveId));
				NewDialog.showSucceedMessage("存档成功");
			}
		}
		
		private function onClickLock(evt:MouseEvent):void{
			var saveId:int = int(evt.currentTarget.name.substr(6)) + 1;
			var saveProxy:NurSaveProxy = NurGameManager.instance.saveProxy;
			var isLock:Boolean = !saveProxy.isLock(saveId);
			var msg:String = isLock ? "锁定":"解锁";
			NewDialog.showChoiceDialog("确定要" +　msg + "此存档吗？", onConfirm);
			
			function onConfirm():void{
				ProgressFullSprite.show();
				saveProxy.lockSave(saveId, isLock, onUpdateSuc);
			}
			function onUpdateSuc():void{
				ProgressFullSprite.close();
				updateLockState(_mlp.getMc("mcLock" + int(saveId - 1)), isLock);
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