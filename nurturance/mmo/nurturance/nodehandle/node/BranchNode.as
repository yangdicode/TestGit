package mmo.nurturance.nodehandle.node
{
	import com.adobe.utils.StringUtil;
	
	import flash.display.MovieClip;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	
	import mmo.common.DisplayUtil;
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.effect.NurEffectsFactory;
	import mmo.play.helper.SceneDomainResLoader;
	
	public class BranchNode extends NurExtNode
	{
		private var _variables:Object;
		private var _brList:Array = [];
		private var _nextKey:Array = [];
		private var _mcItems:MovieClip;
		public function BranchNode(xml:XML, variables:Object)
		{
			_variables = variables;
			super(xml);
		}
		
		override public function execute(arg0:Object=null):void
		{
			phaseXml(this._info);
			showNode();
			
			var content:String = _info.@title || _info.@context;
			NurManageHandler.instance.windowManager.showMultiTalk(content, this._info.@npcId, this._info.@iconId , this._info.@sceneNpc, null, null, false);
			NurEffectsFactory.showEffect(_info);
		}
		
		public override function dispose():void
		{
			DisplayUtil.stopAndRemove(_mcItems);
			_variables = null;
			this._info = null;
			_nextKey = null;
			_mcItems = null;
			
			super.dispose();
		}
		
		private function phaseXml(xml:XML):void
		{
			var xmlList:XMLList = xml.br;
			_mcItems = new MovieClip();
			var ySide:Number = 0;
			var index:int = 0;
			for each(var br:XML in xmlList)
			{
				var desArray:Array = String(br.@des).split(":");
				var item:MovieClip = SceneDomainResLoader.getResByName(_variables["info"].subName + "NurChooseItem");
				if(!StringUtil.isEmpty(desArray[0]))
				{
					item["textLetter"].text = desArray[0] + ":";
				}
				item["textContext"].text = desArray[1];
				TextField(item["textContext"]).mouseEnabled = false;
				item.x = 0;
				item.y = ySide;
				item.name = "mcItem" + index;
				index++;
				ySide += (item.height * 1.2);
				item.addEventListener(MouseEvent.CLICK, onClickBtnItem);
				
				_mcItems.addChild(item);
				_nextKey.push(br.@nextKey);
				_brList.push(br);
			}
		}
		
		private function showNode():void
		{
			NurManageHandler.instance.windowManager.displayLayer.addChild(_mcItems);
			DisplayUtil.middleDisplay(_mcItems, 960, 560);
			_mcItems.y -= 50;
		}
		
		private function onClickBtnItem(evt:MouseEvent):void
		{
			NurManageHandler.instance.windowManager.clearTalkPanel();
			DisplayUtil.stopAndRemove(_mcItems);
			var index:int = int(evt.currentTarget.name.substring("mcItem".length));
			if(_nextKey[index] != null && !StringUtil.isEmpty(_nextKey[index]))
				setNextNode(_nextKey[index]);
			var changeXml:XML = _brList[index];
			trace("changeXml.@change========" + (changeXml.@change));
			if(!StringUtil.isEmpty(changeXml.@change))
				NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.CHANGE_PROP, {"key":this._key,"index":index}));
			
			var choce:XML = _brList[index];
			if(!StringUtil.isEmpty(choce.@action))
			{
				NurEventDispatcher.instance.dispatchEvent(new NurEvent(
					NurEvent.FreeTalk_Action, {"action":choce.@action}
				));
			}
			
			NurEffectsFactory.hideEffect();
			nodeEnd();
			
			_brList = [];
			_nextKey = [];
			_mcItems = null;
		}
	}
}