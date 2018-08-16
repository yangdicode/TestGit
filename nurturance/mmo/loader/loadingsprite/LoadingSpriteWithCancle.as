package mmo.loader.loadingsprite {
	
	import flash.display.SimpleButton;
	import flash.events.MouseEvent;
	
	import mmo.loader.CustomLoader;
	
	public class LoadingSpriteWithCancle extends LoadingSprite implements ILoadingSprite {
		
        //~ fields ------------------------------------------------------------
        
        private var _loader:CustomLoader;
        
        private var _btnCancle:SimpleButton;
        
        //~ public methods ----------------------------------------------------
        
		public function LoadingSpriteWithCancle(loader:CustomLoader) {
			super();
            
            this._loader = loader;
            
            this._btnCancle = getChildByName("btncancle") as SimpleButton;
            this._btnCancle.addEventListener(MouseEvent.CLICK, onMouseClickCancle, false, 0, true);
		}
        
        override public function dispose():void {
            this._loader = null;
            
            if(this._btnCancle != null) {
                this._btnCancle.removeEventListener(MouseEvent.CLICK, onMouseClickCancle);
                this._btnCancle = null;
            }
            
            super.dispose();
        }
        
        //~ private methods ---------------------------------------------------
		
        private function onMouseClickCancle(e:MouseEvent):void {
            this._loader.cancel();
            this._loader = null;
        }
        
	}
}