package mmo.nurturance.nodehandle.talk.panel
{
	import com.adobe.utils.StringUtil;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.filters.ColorMatrixFilter;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.utils.getDefinitionByName;
	
	import mmo.common.DisplayUtil;
	import mmo.nurturance.nodehandle.npc.NurNpcName;
	import mmo.nurturance.nodehandle.talk.NurNpcViewLoader;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEvent;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEventDispatcher;
	import mmo.play.helper.SceneDomainResLoader;

	public class NurMultiTalkPanel
	{
		private const TALK_COOR_CONFIG:Array = ["115_590"];
		private const COORS_CONFIG:Array = 
			[
				["485_415"],
				["350_415", "660_415"],
				["280_450", "480_450", "680_450"]
			];
		
		private var _scenePanel:Sprite;
		private var _talkPanel:Sprite;
		
		private var _npcsList:Array = [];
		private var _viewList:Array = [];
		private var _coors:Array = [];
		
		private var _talkNpcId:int = 0;
		private var _talkNpcIcon:int = 1;
		private var _context:String;
		private var _talkNpcSite:int = 0;
		private var _isClick:Boolean = true;
		
		private var _callBack:Function;
		private var _mcTips:Sprite;
		
		public function NurMultiTalkPanel(scenePanel:Sprite, talkPanel:Sprite, gameId:int)
		{
			_scenePanel = scenePanel;
			_talkPanel = talkPanel;
			
			_mcTips = SceneDomainResLoader.getResByName("mmo.nurturance.nur" + gameId + ".NurTips");
		}
		
		public function showTalkPanel(context:String, talkNpcId:int, talkNpcIcon:int, sceneNpcInfo:String, cb:Function, coors:String = null,isClick:Boolean = true):void
		{
			_talkNpcId = talkNpcId;
			_talkNpcIcon = talkNpcIcon;
			_context = context;
			_callBack = cb;
			_isClick = isClick;
			removeNpc();
			
			initSceneNpc(sceneNpcInfo);
			initCoors(coors);
			initTalkPanel();
			
			loadSceneNpc();
		}
		
		public function removeNpc():void
		{
			NurNpcViewLoader.disposeCustomNpcs();
			_talkPanel.removeEventListener(MouseEvent.CLICK, onClickPanel);
			_talkPanel["txtName"].text = "";
			_talkPanel["txtContext"].text = "";
			_talkPanel["mcMouse"].visible = false;
			for(var i:int = 0; i < _viewList.length; i++)
			{
				DisplayUtil.stopAndRemove(_viewList[i]);
			}
			_viewList = [];
			_npcsList = [];
			_coors = [];
			DisplayUtil.stopAndRemove(_mcTips);
		}
		
		public function dispose():void{
			removeNpc();
			_scenePanel = null;
			_talkPanel = null;
			_mcTips = null;
		}
		
		/**
		 * sceneNpc = "A:5_1,B:6_1,C:7_1" coors = "200_300,100_200"
		 **/
		private function initSceneNpc(info:String):void
		{
			if(info == null || StringUtil.isEmpty(info))
			{
				info = "A:" + _talkNpcId + "_" + _talkNpcIcon;
			}
			var npcs:Array = info.split(",");
			for(var i:int = 0; i < npcs.length; i++)
			{
				var npcStr:String = npcs[i].split(":")[1];
				
				if(npcStr.split("_")[0] == _talkNpcId.toString())
				{
					var temp:int = _talkNpcIcon;
					if(temp == -1)
						temp = 1;
					npcStr = _talkNpcId.toString() + "_" + temp.toString();
					_talkNpcSite = i;
				}
				else if(npcStr.split("_").length < 2)
				{
					npcStr += "_1"
				}
				else if(StringUtil.isEmpty(npcStr.split("_")[1]))
				{
					npcStr += "1";
				}
				_npcsList.push(npcStr);
			}
		}
		
		private function initTalkPanel():void
		{
			if(_talkNpcIcon == -1)
			{
				_talkPanel["txtName"].text = "？？"
			}
			else if(_talkNpcId == -1)
			{
				_talkPanel["txtName"].text = "守护者";
			}
			else if(NurNpcName.getNpcName(_talkNpcId) != null)
			{
				_talkPanel["txtName"].text = NurNpcName.getNpcName(_talkNpcId);
			}
			
			replaceTxtColor();
			replaceMyName();
			var txtContext:TextField = TextField(this._talkPanel.getChildByName("txtContext"));
			txtContext.autoSize = TextFieldAutoSize.LEFT;
			txtContext.wordWrap = true;
			txtContext.htmlText = _context;
			txtContext.mouseEnabled = false;
			txtContext.mouseWheelEnabled = false;
			DisplayUtil.applyGlowFilter(txtContext,0x003366,3);
			
			action();
		}
		
		private function action ():void
		{
			if(_isClick)
			{
				_talkPanel.addEventListener(MouseEvent.CLICK, onClickPanel);
			}
			_talkPanel["mcMouse"].visible = _isClick;
		}
		
		private function initCoors(coors:String):void
		{
			if(_npcsList.length > 1)
			{
				if(coors == null || StringUtil.isEmpty(coors) || coors.length == 0)
				{
					_coors = COORS_CONFIG[_npcsList.length - 2];
				}
				else
				{
					_coors = coors.split(",");
					for(var i:int = _coors.length; i < COORS_CONFIG[_npcsList.length - 2].length; i++)
					{
						_coors.push(COORS_CONFIG[_npcsList.length - 2][i]);
					}
				}
			}
		}
		
		//重点突出文字用
		private function replaceTxtColor():void{
			if(_context == null){
				return;
			}
			var leftColorStr:String = "<font color='#FF9900'><b>";
			var rightColorStr:String = "</b></font>";
			_context = _context.replace(TalkReplacePattern.LeftColor, leftColorStr);
			_context = _context.replace(TalkReplacePattern.RightColor, rightColorStr);
		}
		
		private function replaceMyName():void{
			if(_context == null){
				return;
			}
			var userName:String = "守护者";
			userName = "<font color='#0099FF'>" + userName + "</font>";
			_context = _context.replace(TalkReplacePattern.USERNAME, userName);
		}
		
		private function loadSceneNpc():void
		{
			NurTalkEventDispatcher.instance.addEventListener(NurTalkEvent.ON_NPC_VIEWS_LOADED, onLoadNpcView);
			NurNpcViewLoader.loadNpcViews(_npcsList);
		}
		
		private function onLoadNpcView(evt:NurTalkEvent):void
		{
			NurTalkEventDispatcher.instance.removeEventListener(NurTalkEvent.ON_NPC_VIEWS_LOADED, onLoadNpcView);
			DisplayUtil.removeAllChild(_scenePanel);
			_viewList = evt.pramas["viewList"];			
			//表情和场景中的形象分开
			setAndAddNpcIcon(_viewList[0], _npcsList[0].split("_")[0]);
			for(var i:int = 1; i < _viewList.length; i++)
			{
				if(_coors[i - 1] == null && _viewList.length > 1)
					_coors = COORS_CONFIG[_viewList.length - 2];
				var temp:Array = _coors[i - 1].split("_");		
				setAndAddNpcSceneIcon(_viewList[i], temp, _npcsList[i].split("_")[0]);
				if(i == 2)
				{
					_viewList[i].scaleX = _viewList[i].scaleX * -1;
				}
			}
			
			if(_viewList.length == 2){
				_viewList[1].scaleX = _viewList[1].scaleX * -1;
			}
			
			lightSceneNpc();
		}
		
		private function setAndAddNpcIcon(view:Sprite, npcId:int):void{
			view.x = int(TALK_COOR_CONFIG[0].split("_")[0]);
			view.y = int(TALK_COOR_CONFIG[0].split("_")[1]);
			trace("icon***x:" + (view.x) + "****y:" + (view.y));
			var scale:Number = npcId == -1 ? 1.1 : 0.8;
			view.scaleX = view.scaleY = scale;
			_talkPanel.addChild(view);
		}
		
		private function setAndAddNpcSceneIcon(view:Sprite, temp:Array, npcId:int):void{
			view.x = temp[0];
			view.y = temp[1];
			var scale:Number = npcId == -1 ? 1.2 : 0.9;
			view.scaleX = view.scaleY = scale;
			_scenePanel.addChild(view);
		}
		
		private function lightSceneNpc():void
		{
		
			for(var i:int = 0; i < _viewList.length; i++)
			{
				var view:Sprite = _viewList[i]
				if(i == _talkNpcSite)
				{
					_mcTips.x = 85;
					_mcTips.y = -295;
					view.addChild(_mcTips);
					DisplayUtil.clearFilters(view);
					
					if(!NurNpcName.needTalkSignNpc(_talkNpcId)){
						DisplayUtil.stopAndRemove(_mcTips);
					}
				}
				else
				{
					var filter:ColorMatrixFilter = new ColorMatrixFilter([1, 0, 0, 0, -30, 0, 1, 0, 0, -30, 0, 0, 1, 0, -30, 0, 0, 0, 1, 0]);
					view.filters = [filter];
				}
			}
		}
		
		private function onClickPanel(evt:MouseEvent):void
		{
			_talkPanel["txtName"].text = "";
			_talkPanel["txtContext"].text = "";
			removeNpc();
			if(_callBack != null)
			{
				_callBack.apply();
				
			}
		}
		
		private function finishShowTalk():void
		{
			
		}
	}
}