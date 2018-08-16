package mmo.play.panel
{
	import flash.display.Sprite;
	
	import mmo.play.dialog.NewDialog;
	import mmo.play.dialog.ProgressLoader;
	import mmo.play.layer.LayerManager;
	
	public class CommonOriginalPanel extends MovieLayerPanel
	{
		/**
		 * 背景不会导图
		 */		
		public function CommonOriginalPanel()
		{
			super();
		}
		
		public override function showPanel(layer:Sprite=null):void{
			ProgressLoader.close();
			NewDialog.show(_panel, LayerManager.getBaseTop(),0,0,false);
		}
		
		public function showMovePanel(layer:Sprite=null, pX:Number=0, pY:Number=0):void{
			ProgressLoader.close();
			NewDialog.show(_panel, LayerManager.getBaseTop(),pX,pY,false);			
		}
		
		public override function closePanel():void{
			NewDialog.closeDialog(_panel);
		}
	}
}