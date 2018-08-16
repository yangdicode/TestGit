package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.INurNode;
	import mmo.interfaces.nurturance.NurExtNode;
	
	public class NoActionNode extends NurExtNode implements INurNode
	{
		public function NoActionNode(xml:XML, variables:Object)
		{
			super(xml, variables);
		}
		
		public override function execute(params:Object=null):void
		{
			nodeEnd();
		}
	}
}