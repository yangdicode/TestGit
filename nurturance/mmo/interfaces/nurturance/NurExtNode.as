package mmo.interfaces.nurturance
{
	import com.adobe.utils.StringUtil;
	
	import flash.events.EventDispatcher;
	
	public class NurExtNode extends EventDispatcher implements INurNode
	{
		protected var _info:XML;
		protected var _key:String;
		protected var _nextNodeKey:String;
		
		public function NurExtNode(xml:XML, variables:Object = null)
		{
			_info = xml;
			_key = _info.@key;
		}
		
		public function execute(params:Object=null):void
		{
		}
		
		public function forceEnd():void
		{
		}
		
		public function dispose():void
		{
			_info = null;
			_key = null;
			_nextNodeKey = null;
		}
		
		public function setNextNode(node:String = null):void
		{
			_nextNodeKey = node;
		}
		
		public function getNodeInfo():XML
		{
			return _info;
		}
		
		public function getNextNode():String
		{
			return this._nextNodeKey;
		}
		
		final protected function nodeEnd():void{
			trace("node**" + this._key + "******suc");
			trace("nextnode**" + this._nextNodeKey + "******dispathing");
			if(!StringUtil.isEmpty(_info.@action))
			{
				NurEventDispatcher.instance.dispatchEvent(new NurEvent(
					NurEvent.FreeTalk_Action, {"action":_info.@action}
				));
			}
			NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.NODE_SUC,{"nextNodeKey":this._nextNodeKey}));
		}
	}
}