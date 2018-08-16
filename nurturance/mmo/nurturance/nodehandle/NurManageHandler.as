package mmo.nurturance.nodehandle
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.nodehandle.build.NurNodesManager;
	import mmo.nurturance.nodehandle.build.NurPropManager;
	import mmo.nurturance.nodehandle.build.NurWindowManager;
	import mmo.nurturance.nodehandle.variables.NurVariableBuilder;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;

	public class NurManageHandler
	{
		private static var _instance:NurManageHandler;
		
		private var _saveDoc:NurUserSave;
		private var _variables:Object = {};
		private var _hasInit:Boolean = false;
		
		private var _nodesManager:NurNodesManager = new NurNodesManager();
		private var _propManager:NurPropManager = new NurPropManager();;
		private var _windowManager:NurWindowManager = new NurWindowManager();
		
		public function NurManageHandler()
		{
		}

		public static function get instance():NurManageHandler
		{
			if(_instance == null)
			{
				_instance = new NurManageHandler();
			}
			return _instance;
		}
		
		public function start(saveDoc:NurUserSave):void
		{
			NewDialog.clearAll();
			
			saveFilter(saveDoc);
			trace("*****************************");
			trace("saveDoc========" + saveDoc.extStr);
			trace("saveDoc========" + saveDoc.chapterId);
			trace("saveDoc========" + saveDoc.saveId);
			trace("saveDoc========" + saveDoc.saveDate);
			trace("*****************************");
			if(_hasInit)
			{
				stop();
				loadXml();
			}
			else
			{
				loadXml();
			}
		}
		
		public function stop():void
		{
			dispose();
		}
		
		public function endCurNode():void
		{
			_nodesManager.endCurNode();
		}
		
		public function startAuto():void
		{
			_nodesManager.startAuto();
		}
		
		public function stopAuto():void
		{
			_nodesManager.stopAuto();
		}
		
		public function saveDoc():NurUserSave
		{
			_saveDoc.extStr = _propManager.saveNodeStr + "|" + _nodesManager.settingString;
			return _saveDoc;
		}
		
		public function updateCurNode(cn:String):void
		{
			_saveDoc.curNode = cn;
		}
		
		public function updateChapterId(cn:*):void
		{
			_saveDoc.chapterId = int(cn);
		}
		
		public function playMusic(file:String):void
		{
			_windowManager.playMusic(file);
		}
		
		public function dispose():void
		{
			_hasInit = false;
			_windowManager.dispose();
			_nodesManager.dispose();
			_propManager.dispose();
		}
		
		public function get ChangesConfig():Object
		{
			return _nodesManager.changeConfig;
		}
		
		private function readSave():void
		{
			_windowManager.initGround();
			_propManager.init(_saveDoc);
			_nodesManager.startNur(_saveDoc);
		}
		
		private function saveFilter(save:NurUserSave):void
		{
			if(save.curNode == null || save.curNode == "")
				save.curNode = "1";
			if(save.extStr == null || save.extStr == "")
			{
				save.extStr = "|"
			}
			_saveDoc = save;
		}
		
		private function loadXml():void
		{
			ProgressFullSprite.show();
			var loader:URLLoader = new URLLoader();
			var request:URLRequest = new URLRequest("nurturance/nurext/nur" + _saveDoc.gameId + "res/nurconfig" + _saveDoc.gameId + ".xml");
			loader.addEventListener(Event.COMPLETE, onLoadXml);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onXmlErro);
			loader.load(request);
			
			function onLoadXml(evt:Event):void{
				ProgressFullSprite.close();
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onXmlErro);
				loader.removeEventListener(Event.COMPLETE, onLoadXml);
				trace("养成任务" + _saveDoc.gameId + "配置下载完成");
				initXml(XML(loader.data));
			}
			
			function onXmlErro(evt:IOErrorEvent):void{
				ProgressFullSprite.close();
				trace("养成任务" + _saveDoc.gameId + "配置下载失败");
				loader.removeEventListener(IOErrorEvent.IO_ERROR, onXmlErro);
				loader.removeEventListener(Event.COMPLETE, onLoadXml);
			}
		}
		
		private function initXml(xmlConfig:XML):void
		{
			var xmlListNodes:XMLList = xmlConfig.nodes.node;
			for each(var va:XML in xmlConfig.init.va)
			{
				_variables[va.@type] = NurVariableBuilder.buildNurVariablesByXml(va);
			}
			
			_nodesManager.init(xmlListNodes, _variables);
			_propManager.init(_saveDoc);
			_windowManager.init(_saveDoc,_variables,onInitNur);
		}
		
		private function onInitNur():void
		{
			_hasInit = true;
			_windowManager.showWindow();
			_nodesManager.startNur(_saveDoc);
		}

		public function get nodesManager():NurNodesManager
		{
			return _nodesManager;
		}

		public function get propManager():NurPropManager
		{
			return _propManager;
		}

		public function get windowManager():NurWindowManager
		{
			return _windowManager;
		}


	}
}