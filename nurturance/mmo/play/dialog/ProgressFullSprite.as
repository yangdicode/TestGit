package mmo.play.dialog {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.utils.getDefinitionByName;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.LoaderContainer;
	import mmo.play.layer.LayerEvent;
	import mmo.play.layer.LayerManager;

	public class ProgressFullSprite extends MovieClip {

		//~ fields ------------------------------------------------------------
		private static var _dialogSprite:Sprite;
		
		private static var _showBack:Boolean;
		
		//记录弹出框的个数
		private static var dialogNum:int = 0;
		
		//~ public methods ----------------------------------------------------

		public function ProgressFullSprite() {
		}
		
		/**
		 * 
		 * @param showBack    是否显示黑框
		 * @param layer       所在层次
		 * @param showLoading 是否显示转圈圈
		 */		
		public static function show(showBack:Boolean = true,layer:Sprite = null,showLoading:Boolean = true):void {
			dialogNum ++;
			if (_dialogSprite != null) {
				return;
			}
			_showBack = showBack;
			createDialogSprite(showBack,showLoading);
			if(layer == null){
				if(LayerManager.container == null){
					layer = LoaderContainer.instance;
				}else{
					layer = LayerManager.getCurrentLayerTop();
				}
			}
			if(LayerManager.container != null){
				LayerManager.container.addEventListener(LayerEvent.ON_LAYER_CHANGE, onLayerChange);
			}
			NewDialog.getCustomDialog(_dialogSprite).show(layer,0,0,showBack);
		}

		public static function close():void {
			dialogNum --;
//			if(dialogNum < 0){
//				throw new Error("这里调用了多余次数的ProgressFullSprite关闭~！");
//			}
			
			if (_dialogSprite == null) {
				return;
			}
			
			trace("------显示框数量--------:"+dialogNum)
			//容错处理，前面会提示，但不影响正常玩家的流程
			if(dialogNum <= 0){
				dialogNum = 0;
				NewDialog.closeDialog(_dialogSprite);
				_dialogSprite=null;
				
				if(LayerManager.container != null){
					LayerManager.container.removeEventListener(LayerEvent.ON_LAYER_CHANGE, onLayerChange);
				}
			}
		}

		//~ private methods ---------------------------------------------------
		
		private static function onLayerChange(evt:LayerEvent):void{
			if(_dialogSprite != null){
				NewDialog.closeDialog(_dialogSprite);
				NewDialog.getCustomDialog(_dialogSprite).show(LayerManager.getCurrentLayerTop(),0,0,_showBack);
			}
		}

		private static function createDialogSprite(showBack:Boolean,showLoading:Boolean):void {
			_dialogSprite=new Sprite();
			if(showBack){
				_dialogSprite.graphics.beginFill(0xFF000000, 0.06);
				_dialogSprite.graphics.drawRect(0, 0, LoaderContainer.stageWidth, LoaderContainer.stageHeight);
				_dialogSprite.graphics.endFill();
			}
			
			if(!showLoading){
				return;
			}
			
			//改成提前加载...
			var cls:Class=getDefinitionByName("mmo.common.LoadingMovie") as Class;
			var _loading:Sprite=new cls() as Sprite;
			DisplayUtil.align(_loading);
			_dialogSprite.addChild(_loading);
			
//			if (ApplicationDomain.currentDomain.hasDefinition("mmo.common.LoadingMovie")) {
//				trace("ProgressFullSprite loading……if");
//				var cls:Class=getDefinitionByName("mmo.common.LoadingMovie") as Class;
//				var _loading:Sprite=new cls() as Sprite;
//				DisplayUtil.align(_loading);
//				if (_dialogSprite != null) {
//					_dialogSprite.addChild(_loading);
//				}
//			} else {
//				trace("ProgressFullSprite loading……else");
//				ResScheduler.getResource("library_res/common_res_progress",
//					function(content:MovieClip) {
//						DisplayUtil.align(content);
//						// 放置下载成功后，ProgressFullSprite已经被关闭						
//						if (_dialogSprite != null) {
//							_dialogSprite.addChild(content);
//						}
//					},
//					"mmo.common.LoadingMovie", null, null, ResPriority.HIGHEST);
//			}
			
		}
	}
}