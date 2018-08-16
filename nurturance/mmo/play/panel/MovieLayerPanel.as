package mmo.play.panel
{
	import mmo.common.dialog.DialogControl;

	public class MovieLayerPanel extends CommonPanel
	{
		/**
		 * 自动计数切换动画层的面版
		 */		
		public function MovieLayerPanel(){
			super();
		}
		
		public static function loadAndShow(fileName:String,className:String, onLoadFun:Function = null, 
			nextFun:Function = null, inCancel:Boolean = false, needBackName:Boolean = false, 
			funArgArray:Array = null):MovieLayerPanel
		{
			var panel:MovieLayerPanel = new MovieLayerPanel();
			panel.loadRes(fileName, className, null, onLoadPanel);
			function onLoadPanel():void
			{
				if(onLoadFun != null)
				{
					onLoadFun.apply(null, [panel]);
				}
				panel.showPanel();
				DialogControl.instance.setNextFunWithSprite(panel.panel, nextFun, 
					inCancel, needBackName, funArgArray);
			}
			return panel;
		}
	}
}