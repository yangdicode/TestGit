package mmo.nurturance.nodehandle.node
{
	import mmo.interfaces.nurturance.NurEvent;
	import mmo.interfaces.nurturance.NurEventDispatcher;
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.nurturance.nodehandle.NurManageHandler;
	
	public class MusicNode extends NurExtNode
	{
		public function MusicNode(xml, variables:Object)
		{
			super(xml,variables);
		}
		
		public override function execute(arg0:Object=null):void
		{
			NurManageHandler.instance.playMusic(this._info.@path);
			NurEventDispatcher.instance.dispatchEvent(new NurEvent(NurEvent.CHANGE_SETTING, {"type":this._info.@type,"key":this._key}));
			nodeEnd();
		}
	}
}