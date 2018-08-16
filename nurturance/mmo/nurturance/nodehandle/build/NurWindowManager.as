package mmo.nurturance.nodehandle.build
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import mmo.common.DisplayUtil;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.helper.NurMusicManager;
	import mmo.nurturance.nodehandle.panel.NurFavorPanel;
	import mmo.nurturance.nodehandle.talk.panel.NurMultiTalkPanel;
	import mmo.nurturance.ui.NurLoadSavePanel;
	import mmo.nurturance.ui.NurSavePanel;
	import mmo.nurturance.ui.NurTaskStartPanel;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.helper.SceneDomainResLoader;
	import mmo.play.panel.PanelShower;

	public class NurWindowManager
	{
		private var _windowUI:Sprite;
		private var _foreground:Sprite;
		private var _displayLayer:Sprite;
		private var _talklayer:Sprite;
		private var _container:Sprite;
		private var _blackGround:Sprite;
		
		private var _saveDoc:NurUserSave;
		
		private var _multiTalkPanel:NurMultiTalkPanel;
		private var _autoTimer:Timer;
		
		public function NurWindowManager()
		{
		}
		
		public function showWindow():void
		{
			PanelShower.showPanel(_windowUI);
		}
		
		public function closeWindow():void
		{
			PanelShower.closePanel(_windowUI);
		}
		
		public function hideUI():void
		{
			_foreground.visible = false;
		}
		
		public function showUI():void
		{
			_foreground.visible = true;
		}
		
		public function setAutoTips(isAuto:Boolean):void
		{
			var tips:Sprite = _windowUI["spAuto"];
			tips.visible = isAuto;
		}
		
		public function showMultiTalk(context:String, npcId:int, iconId:int, sceneNpc:String, coors:String, cb:Function,isClick:Boolean = true):void
		{
			_multiTalkPanel.showTalkPanel(context, npcId, iconId, sceneNpc,cb, coors,isClick);
		}
		
		public function clearTalkPanel():void
		{
			_multiTalkPanel.removeNpc();
		}
		
		public function hideTalk():void
		{
			_talklayer.visible = false;
		}
		
		public function playMusic(file:String):void
		{
			NurMusicManager.instance.loadAndPlayMusic(file);
		}
		
		public function init(saveDoc:NurUserSave, variables:Object, cb:Function = null):void
		{
			_saveDoc = saveDoc;
			var path:String = variables["info"].subPath + "nur" + _saveDoc.gameId + "res/nurui" + _saveDoc.gameId;
			var name:String = variables["info"].subName + "NurUI" + _saveDoc.gameId;
			
			ProgressFullSprite.show();
			SceneDomainResLoader.loadRes(path, name,function (sp:Sprite):void
			{
				ProgressFullSprite.close();
				_windowUI = sp;
				_foreground = _windowUI["foreGround"];
				_displayLayer = _windowUI["displayGround"];
				_talklayer = _windowUI["talkGround"];
				_container = _windowUI["container"];
				_blackGround = _windowUI["blackGround"];
				
				_multiTalkPanel = new NurMultiTalkPanel(_container["sceneNpcPanel"], _talklayer["talkPanel"], _saveDoc.gameId);
				initGround();
				initTimer();
				initMusic();
				if(cb != null)
				{
					cb.apply();
				}
			});
		}
		
		public function dispose():void
		{
			closeWindow();
			NurMusicManager.instance.dispose();
			if(_autoTimer != null)
			{
				if(_autoTimer.running)
					_autoTimer.stop();
				_autoTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			}
			
			_foreground = null;
			_displayLayer = null;
			_talklayer = null;
			_container = null;
			_blackGround = null;
			_windowUI = null;
			
			_saveDoc = null;
			_autoTimer = null;
			_multiTalkPanel.dispose();
			_multiTalkPanel = null;
		}
		
		public function initGround():void
		{
			initForeGround();
			initDisplayGround();
			initTalkGround();
			initContainer();
			initBlackGround();
			setAutoTips(false);
			_multiTalkPanel.removeNpc();
		}
		
		private function initTimer():void
		{
			_windowUI.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownUI);
			_windowUI.addEventListener(MouseEvent.MOUSE_UP, onMouseUpUI);
			_autoTimer = new Timer(500,1);
			_autoTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
		private function onMouseDownUI(evt:MouseEvent):void
		{
			_autoTimer.start();
		}
		
		private function onMouseUpUI(evt:MouseEvent):void
		{
			NurManageHandler.instance.stopAuto();
			_autoTimer.reset();
		}
		
		private function onTimerComplete(evt:TimerEvent):void
		{
			NurManageHandler.instance.startAuto();
		}
		
		private function initForeGround():void
		{
			_foreground["btnMusic"].gotoAndStop(NurMusicManager.instance.state);
			_foreground["btnSave"].addEventListener(MouseEvent.CLICK, onClickBtnSave);
			_foreground["btnRead"].addEventListener(MouseEvent.CLICK, onClickBtnRead);
			_foreground["btnMusic"].addEventListener(MouseEvent.CLICK, onClickBtnMusic);
			_foreground["btnFavor"].addEventListener(MouseEvent.CLICK, onClickBtnFavor);
			_foreground["btnLeave"].addEventListener(MouseEvent.CLICK, onClickBtnLeave);
			_foreground["btnTips"].addEventListener(MouseEvent.CLICK, onClickBtnTips);
		}
		
		private function initDisplayGround():void
		{
			DisplayUtil.removeAllChild(_displayLayer);
		}
		
		private function initTalkGround():void
		{
		}
		
		private function initContainer():void
		{
		}
		
		private function initBlackGround():void
		{
			
		}
		
		private function initMusic():void
		{
		}
		
		private function onClickBtnSave(evt:MouseEvent):void
		{
			new NurSavePanel().show(NurManageHandler.instance.saveDoc());
		}
		
		private function onClickBtnRead(evt:MouseEvent):void
		{
			new NurLoadSavePanel().show();
		}
		
		private function onClickBtnMusic(evt:MouseEvent):void
		{
			NurMusicManager.instance.turnState();
			_foreground["btnMusic"].gotoAndStop(NurMusicManager.instance.state);
		}
		
		private function onClickBtnFavor(evt:MouseEvent):void
		{
			new NurFavorPanel().show();
		}
		
		private function onClickBtnLeave(evt:MouseEvent):void
		{
			NewDialog.showChoiceDialog("要保存当前进度吗？",function (str:String):void
			{
				if(str == "btnOK")
				{
					new NurSavePanel().show(NurManageHandler.instance.saveDoc(), stopGame);
				}
				else
				{
					trace(this + "啥啊");
					stopGame();
				}
			}, null, null, true, true);
		}
		
		private function onClickBtnTips(evt:MouseEvent):void
		{
			var cls:String = "mmo.nurturance.nur" + NurManageHandler.instance.saveDoc().gameId + ".NurOperate";
			var panel:Sprite = SceneDomainResLoader.getResByName(cls) as Sprite;
			NewDialog.show(panel, null, 0, 0);
		}
		
		private function stopGame():void
		{
			NurManageHandler.instance.stop();
			new NurTaskStartPanel().show();
		}

		public function get foreground():Sprite
		{
			return _foreground;
		}

		public function get talklayer():Sprite
		{
			return _talklayer;
		}
		
		public function get container():Sprite
		{
			return _container;
		}

		public function get blackGround():Sprite
		{
			return _blackGround;
		}

		public function get displayLayer():Sprite
		{
			return _displayLayer;
		}
	}
}