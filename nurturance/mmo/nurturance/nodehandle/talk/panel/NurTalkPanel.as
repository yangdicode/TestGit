package mmo.nurturance.nodehandle.talk.panel
{
	import com.greensock.TweenLite;
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import mmo.common.DisplayUtil;
	import mmo.nurturance.nodehandle.npc.NurNpcName;
	import mmo.nurturance.nodehandle.talk.NurNpcViewLoader;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEvent;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEventDispatcher;
	import mmo.play.avatar.AvatarFacade;
	import mmo.play.info.ModelInfo;

	public class NurTalkPanel
	{
		private var _talkPanel:MovieClip;
		private var _icon:Sprite;
		
		private var _npcId:int = 0;
		private var _iconId:int = 1;
		private var _context:String;
		private var _side:int = 0;
		
		private var _callBack:Function;
		
		public function NurTalkPanel(pl:MovieClip)
		{
			_talkPanel = pl;
		}
		
		public function showTalk(context:String, npcId:int = 0, iconId:int = 1, side:int = 0, cb:Function = null):void
		{
			if(_icon != null)
				DisplayUtil.stopAndRemove(_icon);
			_npcId = npcId;
			_iconId = iconId;
			_context = context;
			_side = side;
			_callBack = cb;
			
			trace("NurTalkPanel  npcId=======" + _npcId);
			initPanel();
		}
		
		public function dispose():void
		{
			NurNpcViewLoader.disposeCustomNpcs();
			_talkPanel = null;
			_icon = null;
			_callBack = null;
		}
		
		private function initPanel():void
		{
			if(_iconId == -1)
			{
				_talkPanel["txtName"].text = "？？"
			}
			else if(NurNpcName.getNpcName(_npcId) != null)
			{
				_talkPanel["txtName"].text = NurNpcName.getNpcName(_npcId);
			}
			
			_talkPanel.addEventListener(MouseEvent.CLICK, onClickPanel);
			
			replaceMyName();
			replaceTxtColor();
			var txtContext:TextField = TextField(this._talkPanel.getChildByName("txtContext"));
			txtContext.autoSize = TextFieldAutoSize.LEFT;
			txtContext.wordWrap = true;
			txtContext.htmlText = _context;
			txtContext.mouseEnabled = false;
			txtContext.mouseWheelEnabled = false;
			DisplayUtil.applyGlowFilter(txtContext,0x003366,3);
			
			loadIcon();
		}
		
		private function replaceMyName():void{
			if(_context == null){
				return;
			}
			var userName:String = ModelInfo.getUserInfo().userName;
			userName = "<font color='#66CC00'>" + userName + "</font>";
			_context = _context.replace(TalkReplacePattern.USERNAME, userName);
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
		
		private function loadIcon():void{	
			var tempIcon:int = _iconId;
			if(tempIcon == -1)
				tempIcon = 1;
			NurTalkEventDispatcher.instance.addEventListener(NurTalkEvent.ON_NPC_ICON_LOADED, onIcon);
			trace("图标　npcId:" + _npcId + " _iconId:" + _iconId);
			NurNpcViewLoader.loadNpcIcon(_npcId, tempIcon);
		}
		
		
		private function onIcon(e:NurTalkEvent):void{
			if(e.pramas["npcId"] != _npcId) return;
			NurTalkEventDispatcher.instance.removeEventListener(NurTalkEvent.ON_NPC_ICON_LOADED, onIcon);
			_icon = MovieClip(e.pramas["content"]);
			setIcon();
		}
		
		private function setIcon():void{
			if(this._talkPanel == null){
				return;
			}
			if(_side == 1)
			{
				_icon.scaleX = -1;
				_icon.x = 960;
				_icon.y = 560 - _talkPanel.y;
			}
			else
			{
				_icon.x = 0;
				_icon.y = 560 - _talkPanel.y;
			}
			_talkPanel.addChild(_icon);
		}
		
		private function onClickPanel(evt:MouseEvent):void
		{
			_talkPanel.removeEventListener(MouseEvent.CLICK, onClickPanel);
			DisplayUtil.stopAndRemove(_icon);
			_talkPanel["txtName"].text = "";
			_talkPanel["txtContext"].text = "";
			if(_callBack != null)
				_callBack.apply();
		}
	}
}