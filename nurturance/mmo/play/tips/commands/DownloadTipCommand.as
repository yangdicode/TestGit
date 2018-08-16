package mmo.play.tips.commands {
	
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import mmo.interfaces.util.ITips;
	import mmo.loader.LoaderContainer;
	import mmo.loader.scheduler.ResPriority;
	import mmo.loader.scheduler.ResScheduler;
	import mmo.play.tips.TipsInfo;
	import mmo.play.tips.TipsInfoClass;
	import mmo.play.tips.TipsInfoComplex;
	import mmo.play.tips.TipsInfoCustom;
	import mmo.util.command.ISceneCommand;
	import mmo.util.command.SceneSimpleCommand;
	
	public class DownloadTipCommand extends SceneSimpleCommand implements ISceneCommand {
		
		//~ fields ------------------------------------------------------------
		
		private var _content:Object;
		
		private var _isCancel:Boolean;
		
		//~ public methods ----------------------------------------------------
		
		public function DownloadTipCommand() {
			super();
			this._isCancel = false;
		}
		
		override public function execute(content:Object):void {
			this._content = content;
			
			var info:TipsInfo = content["info"] as TipsInfo;
			
			if(info is TipsInfoClass){
				var cls:Class = TipsInfoClass(info).cls;
				var tips:DisplayObject = new cls();
				setTips(tips);
			}else{
				ResScheduler.getResource(
					info.fileName, 
					onGetTips, 
					info.className, 
					null, null, 
					ResPriority.HIGHEST, true,
					info.resStorageType);
			}
		}
		
		override public function cancel():void {
			this._isCancel = true;
			
			var info:TipsInfo = this._content["info"] as TipsInfo;
			ResScheduler.cancel(info.fileName, onGetTips);
			
			this._content = null;
			
			super.cancel();
		}
		
		//~ private methods ---------------------------------------------------
		
		private function onGetTips(tips:DisplayObject):void {
			setTips(tips);
		}
		
		private function setTips(tips:DisplayObject):void{
			// 有可能等资源下载完成时，鼠标已经移开了
			if(this._isCancel) {
				return;
			}
			
			this._content["tips"] = tips;
			
			var info:TipsInfo = this._content["info"] as TipsInfo;
			
			(tips as Sprite).mouseEnabled = false;
			(tips as Sprite).mouseChildren = false;
			
			if(info is TipsInfoCustom) {
				if(tips is ITips){
					ITips(tips).callBack((info as TipsInfoCustom).params)
				}
			}
			else{
				tips["setMessage"](info.message);
				tips["setTitleColor"](info.titleColor);
				if(info is TipsInfoComplex) {
					tips["setMessageContent"]((info as TipsInfoComplex).messageContent);
					tips["setTextColor"]((info as TipsInfoComplex).textColor);
				}
			}
			
			succeed(this._content);
			this._content = null;
		}
		
	}
}