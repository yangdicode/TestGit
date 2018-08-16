package mmo.nurturance.nodehandle.node.npc
{
	import com.adobe.utils.StringUtil;
	
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.effect.NurEffectsFactory;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEvent;
	import mmo.nurturance.nodehandle.talk.event.NurTalkEventDispatcher;
	
	public class TalkNode extends NurExtNode
	{
		private var _npcId:int = 0;
		private var _iconId:int = 1;
		private var _context:String;
		private var _side:int = 0;
		
		private var _isShowChange:Boolean = false;
		
		public function TalkNode(xml:XML, variables:Object)
		{
			_npcId = xml.@npcId;
			_iconId = xml.@iconId;
			_context = xml.@context;
			var side:int = 0;
			if(xml.@side != null)
				side = xml.@side;
			
			super(xml);
		}
		
		public override function execute(params:Object=null):void
		{
			NurManageHandler.instance.windowManager.showMultiTalk(this._info.@context, this._info.@npcId, this._info.@iconId , this._info.@sceneNpc, this._info.@coors, onShowTalk);
			NurEffectsFactory.showEffect(_info);
		}
		
		public override function forceEnd():void
		{
			onShowTalk();
		}
		
		private function onShowTalk():void
		{
			if(!StringUtil.isEmpty(this._info.br.@change))
			{
				if(!_isShowChange)
				{
					_isShowChange = true;
					NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.CHANGE_PROP, {"key":this._key,"index":0}));
				}
			}
			if(!StringUtil.isEmpty(this._info.@soundId))
			{
				NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.SoundTalk_Finish,{"key":this._key}));
			}
			NurEffectsFactory.hideEffect();
			nodeEnd();
		}
	}
}