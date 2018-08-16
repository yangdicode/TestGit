package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.gamemanager.NurGameManager;
	
	public class EndingNode extends NurExtNode
	{
		public function EndingNode(xml:XML, variables:Object=null)
		{
			super(xml, variables);
		}
		
		public override function execute(arg0:Object=null):void
		{
			NurGameManager.instance.finishEnding(int(this._info.@endingId), onFinishEnding);
		}
		
		private function onFinishEnding():void
		{
			new EndingNodeResult(_info, showMain);
		}
		
		private function showMain():void
		{
			this.setNextNode(null);
			nodeEnd();
		}
	}
}