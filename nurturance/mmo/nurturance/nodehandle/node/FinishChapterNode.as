package mmo.nurturance.nodehandle.node
{
	import com.adobe.utils.StringUtil;
	
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.gamemanager.NurGameManager;
	import mmo.nurturance.gamemanager.entity.NurUserSave;
	import mmo.nurturance.nodehandle.NurManageHandler;
	
	public class FinishChapterNode extends NurExtNode
	{
		public function FinishChapterNode(xml:XML, variables:Object)
		{
			super(xml, variables);
		}
		
		private function takeBonus():void
		{
			if (!StringUtil.isEmpty(this._info.@ext))
			{
				new EndingNodeResult(_info, nodeEnd);
			}
			else
			{
				nodeEnd();
			}
		}
		
		public override function execute(arg0:Object=null):void
		{
			if(int(this._info.@chapterId) != NurManageHandler.instance.saveDoc().chapterId)
			{
				takeBonus();
				return;
			}
			if(!StringUtil.isEmpty(this._info.@chapterId))
				NurManageHandler.instance.updateChapterId(this._info.@chapterId);
			
			//暂时这样写吧  
			var saveDoc:NurUserSave = NurManageHandler.instance.saveDoc();
			NurGameManager.instance.autoSave(saveDoc, onFinish);
		}
		
		private function onFinish():void
		{
			var finishId:int = int(this._info.@chapterId);
			var gameId:int = int(this._info.@gameId);
			NurGameManager.instance.finishChapter(finishId, function ():void
			{
				NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.FINISH_CHAPTER, {"gameId":gameId, "chapterId":finishId}));
				takeBonus();
			});
		}
	}
}

