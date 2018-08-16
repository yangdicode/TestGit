package mmo.play.avatar.helper
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;

	import mmo.common.DisplayUtil;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;

	public class SelectedSymbolHelper
	{

		//~ fields ------------------------------------------------------------

		private static var _symbolBitmapData:BitmapData = null;

		private static var _containerList:Array = [];

		//~ public methods ----------------------------------------------------

		public function SelectedSymbolHelper()
		{
		}

		public static function addSelectedSymbol(container:Bitmap):void
		{
			if (_symbolBitmapData != null)
			{
				setSymbolForContainer(container);
				return;
			}

			_containerList.push(container);

			if (_containerList.length == 1)
			{
				ResScheduler.getResource("play_res/avatar_res_symbol", onGetResSymbol, "mmo.avatar_res_symbol.SelectedSymbol", null, null, ResPriority.HIGHEST, false);
			}
		}

		//~ private methods ---------------------------------------------------

		private static function onGetResSymbol(content:DisplayObject):void
		{
			var bitmap:Bitmap = DisplayUtil.cacheAsBitmap(content);
			_symbolBitmapData = bitmap.bitmapData;

			var list:Array = _containerList.concat();
			_containerList = [];

			for each (var container:Bitmap in list)
			{
				setSymbolForContainer(container);
			}
		}

		private static function setSymbolForContainer(container:Bitmap):void
		{
			container.bitmapData = _symbolBitmapData;
			container.x = -_symbolBitmapData.width * 0.5;
			container.y = -_symbolBitmapData.height * 0.5;
			trace("--------------setSymbolForContainer:");
		}

	}
}