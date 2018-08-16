package mmo.nurturance.ui.util
{
	import fl.containers.ScrollPane;
	import fl.controls.ScrollPolicy;
	
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;
	import flash.display.MovieClip;
	
	import mmo.play.tips.TipsManager;
	
	public class NurUIUtil
	{
		public function NurUIUtil()
		{
		}
		
		public static function initScrollPanel(view:DisplayObjectContainer, mcBg:MovieClip, mcSource:MovieClip):void{
			var scrollPane:ScrollPane = new ScrollPane();
			scrollPane.x = mcBg.x;
			scrollPane.y = mcBg.y;
			scrollPane.width = mcBg.width;
			scrollPane.height =mcBg.height;
			scrollPane.source = mcSource;
			scrollPane.horizontalScrollPolicy = ScrollPolicy.OFF;
			scrollPane.verticalScrollPolicy = ScrollPolicy.AUTO;
			view.addChild(scrollPane);

		}
		
		public static function addReplaceTips(addTipsObj:InteractiveObject, mcTips:MovieClip, frame:int):void{
			TipsManager.getInstance().addCustomTips(addTipsObj, "nurturance/nursysui/restips",
				"mmo.nurturance.ui.util.NurEmptyTips", {"mcTips":mcTips, "frame":frame});
		}
	}
}