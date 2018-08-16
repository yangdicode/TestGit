package mmo.nurturance.nodehandle.talk.panel
{
	import flash.display.MovieClip;
	
	import mmo.common.DisplayUtil;
	import mmo.nurturance.nodehandle.talk.NurNpcViewLoader;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEvent;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEventDispatcher;

	public class NurSceneNpcPanel
	{
		private const COORS_CONFIG:Array = 
			[
				["480_310"],
				["380_310", "580_310"],
				["280_310", "480_310", "680_310"]
			];
		
		private var _panel:MovieClip;
		private var _npcsList:Array = [];			//存取格式["npcid0_viewid0","npcid1_viewid1"]
		private var _coors:Array = [];				 //存取格式["x0_y0","x1_y1"]
		private var _viewList:Array = [];
		
		private var _callBack:Function;
		
		public function NurSceneNpcPanel(panel:MovieClip)
		{
			_panel = panel;
			trace("NurSceneNpcPanel  _panel******" + _panel);
		}
		
		public function showSceneNpc(npcs:Array = null,coors:Array = null, cb:Function = null):void
		{
			if(npcs == null)
			{
				removeSceneNpc();
				cb.apply();
			}
			else
			{
				_npcsList = npcs;
				_coors = coors;
				_callBack = cb;
				initPanel();
			}
		}
		
		public function removeSceneNpc():void
		{
			NurNpcViewLoader.disposeCustomNpcs();
			_npcsList = [];
			_coors = [];
			_viewList = [];
			DisplayUtil.removeAllChild(_panel);
			
			if(_npcsList.length == 0)
			{
				NurTalkEventDispatcher.instance.removeEventListener(NurTalkEvent.SCENE_NPC_TALKING, onNpcTalking);
			}
			
		}
		
		private function initPanel():void
		{
			if(_coors == null)
				_coors = [];
			if(_coors.length < _npcsList.length)
			{
				var tempArr:Array = COORS_CONFIG[_npcsList.length - 1];
				for(var i:int = _coors.length; i < tempArr.length; i++)
				{
					_coors[i] = tempArr[i];
				}
			}
			
			NurTalkEventDispatcher.instance.addEventListener(NurTalkEvent.SCENE_NPC_TALKING, onNpcTalking);
			loadSceneNpc();
		}
		
		private function lightNpc(index:int):void
		{
			for(var i:int = 0; i < _viewList.length; i++)
			{
				if(i == index)
				{
					DisplayUtil.applyGlowFilter(_viewList[i], 0xFFFF99,3,1,15,15);
				}
				else
				{
					DisplayUtil.clearFilters(_viewList[i]);
				}
			}
		}
		
		private function loadSceneNpc():void
		{
			NurTalkEventDispatcher.instance.addEventListener(NurTalkEvent.ON_NPC_VIEWS_LOADED, onLoadNpcView);
			NurNpcViewLoader.loadNpcViews(_npcsList);
		}
		
		private function onLoadNpcView(evt:NurTalkEvent):void
		{
			NurTalkEventDispatcher.instance.removeEventListener(NurTalkEvent.ON_NPC_VIEWS_LOADED, onLoadNpcView);
			DisplayUtil.removeAllChild(_panel);
			_viewList = evt.pramas["viewList"];
			for(var i:int = 0; i < _viewList.length; i++)
			{
				var temp:Array = _coors[i].split("_");
				_viewList[i].x = temp[0];
				_viewList[i].y = temp[1];
				
				trace("i***" + i + "x:" + (temp[0]) + "****y:" + (temp[1]));
				
				_panel.addChild(_viewList[i]);
			}
			
			if(_callBack != null)
			{
				_callBack.apply();
			}
		}
		
		private function onNpcTalking(evt:NurTalkEvent):void
		{
			var i:int = -1;
			for(var j:int = 0; j < _npcsList.length; j++)
			{
				if(evt.pramas["talkNpcId"] == _npcsList[j].split("_")[0])
				{
					i = j;
					break;
				}
			}
			
			if(i != -1)
			{
				lightNpc(i);
			}
		}
	}
}