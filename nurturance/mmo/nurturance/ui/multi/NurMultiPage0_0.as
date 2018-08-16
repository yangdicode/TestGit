package mmo.nurturance.ui.multi
{
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.entity.NurGameDefine;
	import mmo.nurturance.gamemanager.model.NurDefinesProvider;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.eventdispatcher.CommonEvent;
	import mmo.play.eventdispatcher.CommonEventDispatcher;
	import mmo.play.helper.SceneDomainResLoader;

	public class NurMultiPage0_0 implements INurMultiPage0SubPage
	{
		private var _mcContainer:MovieClip;
		private var _data:Array;
		
		public function NurMultiPage0_0()
		{
		}
		
		public function init(mcContainer:MovieClip):void
		{
			_mcContainer = mcContainer;
			DisplayUtil.removeAllChild(mcContainer);
			_data = NurDefinesProvider.getGamesByGameId();
			for(var i:int = 0; i < _data.length; i++){
				var gameDefine:NurGameDefine = _data[i];
				var mcItem:MovieClip = SceneDomainResLoader.getResByName("mmo.nurturance.sysui.MultiStoryItem");
				initItem(gameDefine, mcItem);
				addItem(i, mcItem);
			}
		}
		
		private function initItem(gameDefine:NurGameDefine, mcItem:MovieClip):void{
			MovieClip(mcItem["mcNotice"]).gotoAndStop(1);
			MovieClip(mcItem["mcStart"]).gotoAndStop(1);
			MovieClip(mcItem["mcStart"]).addEventListener(MouseEvent.CLICK, onClickStart);
			MovieClip(mcItem["mcNew"]).visible = Boolean(NurDefinesProvider.getLatestGameId() == gameDefine.id);

			TextField(mcItem["txtGameName"]).text = gameDefine.name;
			TextField(mcItem["mcNotice"]["txtStartDate"]).text = gameDefine.startDate;
			mcItem["gameId"] = gameDefine.id;
		}
		
		private function addItem(index:int, mcItem:MovieClip):void{
			mcItem.x = 10 + 200 * int(index % 4);
			mcItem.y = 10 + 136 * int(index / 4);
			_mcContainer.addChild(mcItem);
		}
		
		private function onClickStart(evt:MouseEvent):void{
			sendCloseEvent();
			var mcItem:MovieClip = evt.currentTarget.parent as MovieClip; 
			var gameId:int = mcItem["gameId"];
			ProgressFullSprite.show();
			NurGameManager.instance.updateCurGame(gameId, onUpdated);
			function onUpdated():void{
				ProgressFullSprite.close();
				NurGameManager.instance.checkAndStartGame(int(mcItem["gameId"]));
			}
		}
		
		public function sendCloseEvent():void{
			CommonEventDispatcher.instance.dispatchEvent(new CommonEvent(CommonEvent.ClosePanelInfo, {"key":"NurMultiPanel"}));
		}
		
		public function dispose():void
		{
			_mcContainer = null;
		}
	}
}