package mmo.nurturance.nodehandle.build
{
	import com.adobe.utils.StringUtil;
	import com.greensock.TweenLite;
	
	import flash.events.KeyboardEvent;
	import flash.events.TimerEvent;
	import flash.ui.Keyboard;
	import flash.utils.Timer;
	
	import mmo.interfaces.nurturance.INurNode;
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.nodehandle.NurManageHandler;
	import mmo.nurturance.nodehandle.handler.ChangeHandlerFactory;
	import mmo.nurturance.nodehandle.handler.IChange;
	import mmo.nurturance.nodehandle.node.NurNodeType;
	import mmo.nurturance.ui.NurTaskStartPanel;
	import mmo.play.layer.LayerManager;

	public class NurNodesManager
	{
		private var _settingNodes:Object;
		private var _variables:Object;
		
		private var _nurExtNodesObject:Object;
		private var _changeConfig:Object;
		
		private var _curNode:INurNode;
		
		private var _autoTimer:Timer;
		
		private var _isAuto:Boolean;
		
		public function NurNodesManager()
		{
		}
		
		public function init(xmls:XMLList, variables:Object):void
		{
			_settingNodes = {};
			_variables = variables;
			_nurExtNodesObject = {};
			_changeConfig = {};
			
			initListener();
			parseXml(xmls);
		}
		
		public function dispose():void
		{
			pauseCheckAuto();
			NurEventDispatcher.instance.removeEventListener(NurEvent.NODE_SUC, onNodeSuc);
			NurEventDispatcher.instance.removeEventListener(NurEvent.NODE_FAIL, onNodeFail);
			NurEventDispatcher.instance.removeEventListener(NurEvent.CHANGE_PROP, onChangeProp);
			NurEventDispatcher.instance.removeEventListener(NurEvent.CHANGE_SETTING, onChangeSetting);
			LayerManager.stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);	
			for each(var obj:Object in _nurExtNodesObject)
			{
				var nurNode:INurNode = obj["nodeCls"];
				if(nurNode != null)
					nurNode.dispose();
			}
			
			_changeConfig = null;
			_settingNodes = null;
			if(_autoTimer != null)
			{
				stopAuto();
				_autoTimer.removeEventListener(TimerEvent.TIMER, onEachTimer);
				_autoTimer = null;
			}
		}
		
		public function startNur(saveDoc:NurUserSave):void
		{
			initPreNodes(saveDoc);
		}
		
		public function startAuto():void
		{
			if(_autoTimer == null)
			{
				_autoTimer = new Timer(100);
				_autoTimer.addEventListener(TimerEvent.TIMER, onEachTimer);
			}
			_autoTimer.start();
		}
		
		public function stopAuto():void
		{
			if(_autoTimer != null && _autoTimer.running)
				_autoTimer.stop();
		}
		
		private function onEachTimer(evt:TimerEvent):void
		{
			nextNode();
		}
		
		private function nextNode():void
		{
			if(_curNode.getNodeInfo().@type == NurNodeType.TALK)
			{
				_curNode.forceEnd();
			}
			else
			{
				stopAuto();
			}
		}
		
		public function endCurNode():void
		{
			if(_curNode.getNextNode() != null)
				executeNode(_curNode.getNextNode());
		}
		
		private function executeNode(key:String):void
		{
			trace("executeNode***********" + key);
			_curNode = getNurNode(key);
			if(_curNode != null)
				trace("executeNode nextNode******" + _curNode.getNextNode());
			if(_curNode == null)
			{
				NurManageHandler.instance.stop();
				
				new NurTaskStartPanel().show();
			}
			else
			{
				trace(this + "类型啊：" + _curNode.getNodeInfo().@type);
				if (_isAuto)
				{
					if(_curNode.getNodeInfo().@type == NurNodeType.TALK)
					{
						startCheckAuto();
					}
				}
				
				NurManageHandler.instance.updateCurNode(key);
				_curNode.execute();
			}
		}
		
		private function initListener():void
		{
			_isAuto = false;
			LayerManager.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			
			NurEventDispatcher.instance.addEventListener(NurEvent.NODE_SUC, onNodeSuc);
			NurEventDispatcher.instance.addEventListener(NurEvent.NODE_FAIL, onNodeFail);
			NurEventDispatcher.instance.addEventListener(NurEvent.CHANGE_PROP, onChangeProp);
			NurEventDispatcher.instance.addEventListener(NurEvent.CHANGE_SETTING, onChangeSetting);
		}
		
		private function onCheckAuto():void
		{
			if(_curNode.getNodeInfo().@type == NurNodeType.TALK)
			{
				_curNode.forceEnd();
			}
		}
		
		private function startCheckAuto():void
		{
			trace(this + "自动中...");
			TweenLite.killDelayedCallsTo(onCheckAuto);
			TweenLite.delayedCall(5, onCheckAuto);
		}
		
		private function pauseCheckAuto():void
		{
			trace(this + "停止中...");
			TweenLite.killDelayedCallsTo(onCheckAuto);
		}
		
		private function onKeyUp(evt:KeyboardEvent):void
		{
			if (evt.keyCode != Keyboard.SPACE)
			{
				return;
			}
			
			_isAuto = !_isAuto;
			NurManageHandler.instance.windowManager.setAutoTips(_isAuto);
			if (_isAuto)
			{
				startCheckAuto();
			}
			else
			{
				pauseCheckAuto();
			}
		}
		
		private function initPreNodes(saveDoc:NurUserSave):void
		{
			if(!hasPreNodes(saveDoc))
			{
				executeNode(saveDoc.curNode);
			}
			else
			{
				var preStr:String = saveDoc.extStr.split("|")[1];
				var preArray:Array = preStr.split(",");
				for(var i:int = 0; i < preArray.length; i++)
				{
					var nodeCls:INurNode = getNurNode(preArray[i]);
					var cloneNodeXml:XML = nodeCls.getNodeInfo();
					
					if(i != preArray.length - 1)
					{
						_nurExtNodesObject[preArray[i] + "_pre"] = {"node":cloneNodeXml,"nextKey":preArray[i + 1] + "_pre"};
					}
					else
					{
						_nurExtNodesObject[preArray[i] + "_pre"] = {"node":cloneNodeXml,"nextKey":saveDoc.curNode};
					}
					_settingNodes[cloneNodeXml.@type] = cloneNodeXml.@key;
				}
				executeNode(preArray[0] + "_pre");
			}
		}
		
		private function parseXml(xmls:XMLList):void
		{
			var keyArray:Array = [];
			for each(var node:XML in xmls)
			{
				var key:String = node.@key;
				var nextKey:String = node.@nextKey;
				if(_nurExtNodesObject.hasOwnProperty(key))
				{
					trace("*****************************");
					throw new Error("出现重复节点:" + key);
					trace("*****************************");
				}
				_nurExtNodesObject[key] = {"node":node,"nextKey":nextKey};
				keyArray.push(key);
				
				initChange(node);
			}
			
			for(var i:int = 0; i < keyArray.length - 1; i++)
			{
				var obj:Object = _nurExtNodesObject[keyArray[i]];
				if(StringUtil.isEmpty(obj["nextKey"]) || obj["nextKey"] == null)
				{
					obj["nextKey"] = keyArray[i + 1];
				}
			}
		}
		
		private function initNodes():void
		{
			
		}
		
		/**
		 * <br context = "A:选择1" change = "favor:0_1_2|power:3"/>
		 * <br context = "B:选择2" change = "favor:0_2_5|power:5"/>
		 * "nodeKey":[[{"type":"favor",value:0_1_2},{"type":"power",value:3}], [{"type":"favor",value:0_2_5},{"type":"power",value:5}]]
		 **/
		private function initChange(node:XML):void
		{
			var brList:XMLList = node.br;
			var changeArray:Array = [];
			for each(var br:XML in brList)
			{
				var changeStr:String = br.@change;
				
				if(StringUtil.isEmpty(changeStr))
				{
					changeStr = "null:null";
				}
				
				var changes:Array = changeStr.split("|");
				var changeProps:Array = [];
				for each(var change:String in changes)
				{
					var prop:Array = change.split(":");
					var propObj:Object = {"type":prop[0],"value":prop[1]};
					changeProps.push(propObj);
				}
				
				changeArray.push(changeProps);
				_changeConfig[node.@key] = changeArray;
			}			
		}
		
		private function getNurNode(key:String):INurNode
		{
			if(key == null || StringUtil.isEmpty(key) || _nurExtNodesObject[key] == null || key == "end")
				return null;
			if(_nurExtNodesObject[key]["nodeCls"] != null)
				return _nurExtNodesObject[key]["nodeCls"];
			
			var node:XML = _nurExtNodesObject[key]["node"];
			var type:String = node.@type;
			//暂时为加入自定义节点
			if(!NurNodeType.NODE_EXT_CONFIG.hasOwnProperty(type))
			{
				throw new Error("没有定义该类型的节点:" + type);
			}
			var nodeCls:INurNode = NurNodeType.getNurNode(type, node, _variables);
			nodeCls.setNextNode(_nurExtNodesObject[key]["nextKey"]);
			_nurExtNodesObject[key]["nodeCls"] = nodeCls;
			return nodeCls;
		}
		
		private function onNodeSuc(evt:NurEvent):void
		{
			var nextNodeKey:String = evt.pramas["nextNodeKey"];
			executeNode(nextNodeKey);
		}
		
		private function onNodeFail(evt:NurEvent):void
		{
		}
		
		private function onChangeProp(evt:NurEvent):void
		{
			var changeList:Array = _changeConfig[evt.pramas["key"]][evt.pramas["index"]];
			for each(var obj:Object in changeList)
			{
//				trace("obj  type=====" + (obj["type"]));
//				trace("obj  value=====" + (obj["value"]));
				if(obj["type"] != null)
				{
					var handler:IChange = ChangeHandlerFactory.createHandler(obj["type"]);
					handler.change(obj["value"]);
				}
			}
		}
		
		private function onChangeSetting(evt:NurEvent):void
		{
			_settingNodes[evt.pramas["type"]] = evt.pramas["key"];
		}
		
		public function get settingString():String
		{
			var setting:String = "";
			for each(var str:String in _settingNodes)
			{
				setting += ("," + str);
			}
			return setting.slice(1);
		}
		
		public function hasPreNodes(save:NurUserSave):Boolean
		{
			return save.extStr.split("|")[1];
		}

		public function get changeConfig():Object
		{
			return _changeConfig;
		}

		public function get settingNodes():Object
		{
			return _settingNodes;
		}
	}
}