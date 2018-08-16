package mmo.nurturance.ui.util
{
	import flash.display.MovieClip;
	
	import mmo.interfaces.util.ITips;
	
	public class NurEmptyTips extends MovieClip implements ITips
	{
		public function NurEmptyTips()
		{
		}
		
		public function callBack(params:Object):void
		{
			var mcTips:MovieClip = params["mcTips"] as MovieClip;
			var frameId:int = params["frame"] as int;
			mcTips.gotoAndStop(frameId);
			this.addChild(mcTips);
		}
	}
}