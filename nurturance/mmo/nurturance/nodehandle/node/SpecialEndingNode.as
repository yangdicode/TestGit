package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.gamemanager.NurGameManager;
	
	public class SpecialEndingNode extends NurExtNode
	{
		public function SpecialEndingNode(xml:XML, variables:Object=null)
		{
			super(xml, variables);
		}
		
		public override function execute(arg0:Object=null):void
		{
			NurGameManager.instance.finishEnding(int(this._info.@endingId),onFinishEnding);
		}
		
		public function onFinishEnding():void
		{
			nodeEnd();
		}
	}
}
