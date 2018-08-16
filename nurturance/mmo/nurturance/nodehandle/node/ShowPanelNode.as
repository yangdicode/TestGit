package mmo.nurturance.nodehandle.node
{
	import flash.display.MovieClip;
	
	import mmo.interfaces.nurturance.NurExtNode;
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressFullSprite;
	import mmo.play.helper.SceneDomainResLoader;
	
	public class ShowPanelNode extends NurExtNode
	{
		private var _path:String;
		private var _name:String;
		public function ShowPanelNode(xml:XML, variables:Object)
		{
			_path = xml.@path;
			_name = xml.@name;
			super(xml);
		}
		
		public override function execute(arg0:Object=null):void
		{
			ProgressFullSprite.show();
			SceneDomainResLoader.loadRes(_path, _name, function (mc:MovieClip):void
			{
				ProgressFullSprite.close();
				var panel:MovieClip = mc;
				NewDialog.showCustomDialog(panel, onShowPanel, true, false, null, null, 0, 0);
			});
		}
		
		private function onShowPanel():void
		{
			nodeEnd();
		}
	}
}