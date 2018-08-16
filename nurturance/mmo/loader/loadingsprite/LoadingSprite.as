package mmo.loader.loadingsprite {
	
	import flash.display.MovieClip;
	import flash.display.SimpleButton;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.system.ApplicationDomain;
	import flash.text.TextField;
	
	import mmo.loader.common.utils.LoaderDisplayUtils;
	import mmo.loader.CustomLoader;
	
	public class LoadingSprite extends Sprite implements ILoadingSprite {
		
		//~ fields ------------------------------------------------------------
		
		/** 百分比动画 */
		protected var _mcProgress:MovieClip;
		
		/** 百分比文字信息 */
		protected var _txtProgress:TextField;
		
		protected var _txtGame:TextField;
		
		protected var _txtLoading:TextField;
		
		//~ public methods ----------------------------------------------------
		
		public function LoadingSprite() {
			initProgressComponent();
			initLoadingText();
		}
		
		/**
		 * 设置进度
		 */
		public function setProgress(progress:int):void {
			this._txtProgress.text = progress + "%";
			this._mcProgress.gotoAndStop(progress);
		}
		
		/**
		 * 设置加载信息
		 */
		public function setLoadingText(text:String):void {
            if(this._txtLoading == null) {
                return;
            }
			this._txtLoading.text = text;
		}
		
		/**
		 * 设置运营信息
		 */
		public function setGameText(text:String):void {
            if(this._txtGame == null) {
                return;
            }
            this._txtGame.text = text;
		}
		
		public function dispose():void {
			disposeProgressComponent();
			disposeLoadingText();
			
			LoaderDisplayUtils.stop(this);
		}
		
		//~ protected methods -------------------------------------------------

		protected function initProgressComponent():void {
			this._txtProgress = getChildByName("txtprogress") as TextField;
			this._mcProgress = getChildByName("mcprogress") as MovieClip;
		}
		
		protected function initLoadingText():void {
			this._txtGame = getChildByName("txtgame") as TextField;
			this._txtLoading = getChildByName("txtloading") as TextField;
		}

		protected function disposeProgressComponent():void {
			this._txtProgress = null;
			this._mcProgress = null;
		}
		
		protected function disposeLoadingText():void {
			this._txtGame = null;
			this._txtLoading = null;
		}
		
	}
}