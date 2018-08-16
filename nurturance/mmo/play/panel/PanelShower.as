package mmo.play.panel
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	import mmo.common.panel.PanelEvent;
	import mmo.play.dialog.NewDialog;
	
	public class PanelShower
	{
		private static var _currentShowingPanelNum:int;
		private static var _background:Bitmap;
		
		public static function clearShowingPanelNum():void
		{
			removeMovieBackground();
			_currentShowingPanelNum = 0;
		}
		
		public static function showPanel(view:Sprite, layer:Sprite = null):void
		{
			if (_currentShowingPanelNum == 0)
			{
				setMovieBackground();
			}
			view.addEventListener(PanelEvent.REMOVED, onDispose);
			_currentShowingPanelNum++;
			NewDialog.show(view, layer, 0, 0);
		}
		
		public static function closePanel(view:Sprite):void
		{
			NewDialog.closeDialog(view);			
		}
		
		private static function onDispose(evt:PanelEvent):void
		{
			evt.currentTarget.removeEventListener(PanelEvent.REMOVED, onDispose);
			_currentShowingPanelNum--;
			if (_currentShowingPanelNum <= 0)
			{
				_currentShowingPanelNum = 0;
				removeMovieBackground();
			}
		}
		
		private static function setMovieBackground():void
		{
		}
		
		private static function removeMovieBackground():void
		{
		}
	}
}