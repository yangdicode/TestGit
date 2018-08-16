package mmo.nurturance.nodehandle.node
{
	import mmo.framework.domain.oneoff.OneOffClient;
	import mmo.framework.domain.oneoff.OneOffKey;
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.NurManageHandler;
	
	public class StartChapterNode extends NurExtNode
	{
		public function StartChapterNode(xml:XML, variables:Object)
		{
			super(xml, variables);
		}
		
		public override function execute(arg0:Object=null):void
		{
			NurManageHandler.instance.updateChapterId(this._info.@chapterId);
			NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.START_CHAPTER, {"gameId":this._info.@gameId, "chapterId":this._info.@chapterId}));
			nodeEnd();
		}
	}
}