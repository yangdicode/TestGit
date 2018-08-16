package mmo.play.layer
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.BitmapFilterQuality;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.LoaderContainer;
	import mmo.play.dialog.NewDialog;

	public class MovieLayerManager
	{
		public static const instance:MovieLayerManager = new MovieLayerManager();
		
		private var _curLayer:Sprite;
		private var _dialogs:Vector.<Sprite> = new Vector.<Sprite>();
		
		private var _layerSymble:int = 0;
		
		public function MovieLayerManager(){
		}
		
		public static function get layer():Sprite{
			return instance._curLayer;
		}
		
		public function switchToMovieLayer():void{
			_layerSymble ++;
			if(_layerSymble > 1){
				return;
			}
			var targets:Array = [LayerManager.getBaseScene(), LayerManager.getBaseControl()];
			var bg:DisplayObject = drawBackGround(false, true, targets);
			LayerManager.switchLayer(LayerManager.MOVIE_LAYER, HangUpLevel.HIDE);
			_curLayer = LayerManager.getMovieLayer();
			_curLayer.addChild(bg);
		}
		
		public function switchToBaseLayer():void{
			_layerSymble --;
			if(_layerSymble > 0){
				return;
			}
			LayerManager.switchLayer(LayerManager.BASE_LAYER, HangUpLevel.DESTROY);
			_curLayer = null;
		}
		
		public function showCustom(panel:Sprite, callBack:Function = null, inCancel:Boolean = false, needBack:Boolean = false):void{
			switchToMovieLayer();
			
			var backGround:DisplayObject = drawBackGround();
			panel.addChildAt(backGround, 0);
			
			hideOthers();
			panel.addEventListener(Event.REMOVED_FROM_STAGE, onRemovePanel);
			_dialogs.push(panel);
			
			NewDialog.showCustomDialog(panel, callBack, inCancel, needBack, null, layer, 0, 0, false);
		}
		
		public function close(panel:Sprite):void{
			NewDialog.closeDialog(panel);
		}
		
		private function drawBackGround(showBack:Boolean = true, blur:Boolean = true, targets:Array = null):Sprite{
			var sp:Sprite = new Sprite();
			var bitmapData:BitmapData = new BitmapData(LayerManager.stage.stageWidth, LayerManager.stage.stageHeight);
			if(targets == null){
				targets = [LayerManager.stage];
			}
			for each(var target:DisplayObject in targets){
				bitmapData.draw(target);
			}
			var bitmap:Bitmap = new Bitmap(bitmapData);
			sp.addChild(bitmap);
			
			if(blur){
				DisplayUtil.applyBlurFilter(sp, 2, 2, BitmapFilterQuality.LOW, false);
			}
			
			if(showBack){
				var back:Sprite = new Sprite();
				back.graphics.beginFill(0x000000, 0.5);
				back.graphics.drawRect(0, 0, LoaderContainer.stageWidth, LoaderContainer.stageHeight);
				back.graphics.endFill();
				sp.addChild(back);
			}
			return sp;
		}
		
		private function hideOthers():void{
			for each(var panel:Sprite in _dialogs){
				panel.visible = false;
				panel.x = panel.y = 1000;
			}
		}
		
		private function onRemovePanel(evt:Event):void{
			var panel:Sprite = evt.currentTarget as Sprite;
			panel.removeEventListener(Event.REMOVED_FROM_STAGE, onRemovePanel);
			_dialogs.splice(_dialogs.indexOf(panel), 1);
			var len:int = _dialogs.length;
			switchToBaseLayer();
			if(len <= 0){
				return;
			}
			var lastPanel:Sprite = _dialogs[len - 1];
			lastPanel.visible = true;
			lastPanel.x = lastPanel.y = 0;
		}

		public function get dialogs():Vector.<Sprite>{
			return _dialogs;
		}

		
	}
}