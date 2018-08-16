package mmo.play.tips.commands {
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	
	import mmo.common.DisplayUtil;
	import mmo.loader.LoaderContainer;
	import mmo.play.layer.LayerManager;
	import mmo.play.tips.TipsInfo;
	import mmo.util.command.ISceneCommand;
	import mmo.util.command.SceneSimpleCommand;
	
	public class PopUpTipsCommand extends SceneSimpleCommand implements ISceneCommand {
		
		//~ fields ------------------------------------------------------------
		
		private var _content:Object;
		
		private var _isCancel:Boolean;
		
		//~ public methods ----------------------------------------------------
		
		public function PopUpTipsCommand() {
			super();
			this._isCancel = false;
		}
		
		override public function execute(content:Object):void {
			this._content = content;
			
			var info:TipsInfo = content["info"] as TipsInfo;
			var tips:Sprite = content["tips"] as Sprite;
			
			var ox = LoaderContainer.instance.stage.mouseX + info.deltaX * 0.1;
			var oy = LoaderContainer.instance.stage.mouseY + (info.deltaY * 0.1 < 3 ? 3 : info.deltaY * 0.1);
			
			if(LayerManager.getCurrentLayer() == LayerManager.BASE_LAYER) {
				info.popUp(LayerManager.getBaseTips(), tips, ox, oy, 
					LoaderContainer.instance.stage.mouseX + info.deltaX,
					LoaderContainer.instance.stage.mouseY + info.deltaY,
					onPopUp);
			}
			else if (LayerManager.getCurrentLayer() == LayerManager.FIGHTING_LAYER) 
			{
				info.popUp(LayerManager.getFightingTips(), tips, ox, oy, 
					LoaderContainer.instance.stage.mouseX + info.deltaX,
					LoaderContainer.instance.stage.mouseY + info.deltaY,
					onPopUp);
			}
			else
			{
				info.popUp(LayerManager.getMovieLayer(), tips, ox, oy, 
					LoaderContainer.instance.stage.mouseX + info.deltaX,
					LoaderContainer.instance.stage.mouseY + info.deltaY,
					onPopUp);
			}
		}
		
		override public function cancel():void {
			this._isCancel = true;
			
			var info:TipsInfo = this._content["info"] as TipsInfo;
			info.stopPop();
			
			this._content = null;
			
			super.cancel();
		}
		
		//~ private methods ---------------------------------------------------
		
		private function onPopUp(content:DisplayObject):void {
			if(this._isCancel) {
				DisplayUtil.stopAndRemove(content);
				this._content = null;
				return;
			}
			
			succeed(this._content);
			
			this._content = null;
		}
	}
}