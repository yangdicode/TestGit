package mmo.common
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.utils.Dictionary;
	
	import mmo.common.panel.PanelEffect;
	
	public class ModalDialog extends Sprite
	{	
		public var dialogSprite:DisplayObject;
		public var params:Object = {};
		private var isClosed:Boolean = false;
		private var mdManager:ModalDialogManager;
		private static var dialogTable:Dictionary = new Dictionary();
		
		public function ModalDialog() {

		}
		
		public static function removeDialogFromtable(dialog:DisplayObject):void
		{
			delete dialogTable[dialog];
		}
		
		public static function getCustomDialog(dialogSprite:DisplayObject):ModalDialog
		{
			var dialog:ModalDialog = new ModalDialog();
			dialog.dialogSprite = dialogSprite;			
			return dialog;
		}
		
		public function show(layer:Sprite,x:int=-1,y:int=-1,grayBackground:Boolean = true,
							   effect = PanelEffect.NONE,alignType:int = AlignType.MIDDLE_CENTER):void {
			dialogTable[this.dialogSprite] = this;
			mdManager = ModalDialogManager.getInstance(layer);
			mdManager.addModalDialog(this.dialogSprite,alignType,effect,grayBackground,x,y);
		}
		
		public function close(cancel:Boolean=false):void {
			delete dialogTable[this.dialogSprite];
			if(cancel) {
				this.dispatchEvent(new ModalDialogEvent(ModalDialogEvent.CANCEL));
			}
			else {
				this.dispatchEvent(new ModalDialogEvent(ModalDialogEvent.OK));
			}
			this.dispatchEvent(new ModalDialogEvent(ModalDialogEvent.CLOSE));
			
			mdManager.removeModalDialog(this.dialogSprite);
		}		
		
		public static function closeDialog(customSprite:DisplayObject, cancel:Boolean=false):void {
			if(dialogTable[customSprite] != null && dialogTable[customSprite] != undefined) {
				(dialogTable[customSprite] as ModalDialog).close(cancel);
				delete dialogTable[customSprite];
			}
			else {
				trace("**********************************************************************");
				trace("customSprite不是ModalDialog.show()方法打开的，或者这个ModalDialog已经被关掉了。");
				trace("**********************************************************************");
			}
		}	
	}
}