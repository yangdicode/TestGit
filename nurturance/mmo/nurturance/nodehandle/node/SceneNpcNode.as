package mmo.nurturance.nodehandle.node
{
	import com.adobe.utils.StringUtil;
	
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.NurManageHandler;
	
	public class SceneNpcNode extends NurExtNode
	{
		private var _sceneNpc:Array = null;
		private var _sceneCoor:Array = null;
		public function SceneNpcNode(xml:XML, variable:Object)
		{
			if(!StringUtil.isEmpty(xml.@npcIds))
			{
				_sceneNpc = String(xml.@npcIds).split(",");
			}
			if(!StringUtil.isEmpty(xml.@coors))
			{
				_sceneCoor = String(xml.@coors).split(",");
			}			
			super(xml);
		}
		
		public override function execute(arg0:Object=null):void
		{			
			NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.CHANGE_SETTING, {"type":this._info.@type,"key":this._key}));
		}
		
		public override function dispose():void
		{
			_sceneNpc = null;
			_sceneCoor = null;
			
			super.dispose();
		}
		
		private function onShowSceneNpc():void
		{
			nodeEnd();
		}
	}
}