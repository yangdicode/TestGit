package mmo.common.dialog
{
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import mmo.common.DisplayUtil;
	import mmo.common.ModalDialog;
	
	public class DialogControl 

	{
		private static var _instance:DialogControl;
		
		public function DialogControl()
		{
		}
		
		public static function get instance():DialogControl
		{
			if(_instance == null)
			{
				_instance = new DialogControl();
			}
			return _instance
		}
		
		/**
		 *  dialogSprite 弹出的自定义面板框
		 *  dialogMsg    面板的自定义文字，元件命名为“info”
		 * */
			
		public function setDialog(dialogSprite:Sprite,prompt:String = null):void
		{
			this.setPromptMsg(dialogSprite,prompt);
			dialogSprite.addEventListener(MouseEvent.CLICK,
				function (evt:MouseEvent):void
				{
					var name:String = DisplayObject(evt.target).name;
					if (name == "btnClose" || name == "btnOK" || name == "btnCancel")
					{
						dialogSprite.removeEventListener(MouseEvent.CLICK,arguments.callee);
						ModalDialog.closeDialog(dialogSprite, !(name == "btnOK"));
					}
				});
		}
		
		/**
		 * icon  面板的图标文件，元件命名为“logo”
		 * */
		
		public function setIconDialog(dialogSprite:Sprite,icon:DisplayObject,prompt:String = null):void
		{
			var logo:Sprite = dialogSprite.getChildByName("logo") as Sprite;
			DisplayUtil.scaleDisplay(icon, logo.width, logo.height);
			DisplayUtil.middleDisplay(icon, logo.width, logo.height);
			logo.addChild(icon);
			
			this.setDialog(dialogSprite,prompt);
		}
		
		private function setPromptMsg(dialogSprite:Sprite,prompt:String):void
		{
			if(prompt != null){
				var textField:TextField =TextField(dialogSprite.getChildByName("info"));
				textField.autoSize=TextFieldAutoSize.LEFT;
				textField.wordWrap=true;
				
				textField.multiline=true;
				textField.selectable=false;    
				
				textField.text=prompt;
				var h:int = textField.height;
				textField.autoSize = TextFieldAutoSize.NONE;
				textField.height = h + 10;
			}
		}
		
		/**
		 * 设置后续函数
		 * */
		public function setNextFun(dialog:ModalDialog,nextFun:Function = null,
			inCancel:Boolean = false,needBackName:Boolean = false,funArgArray:Array = null):void
		{
			setNextFunWithSprite(dialog.dialogSprite as Sprite, nextFun, inCancel, needBackName, funArgArray);
		}
		
		public function setNextFunWithSprite(dialogSprite:Sprite, nextFun:Function = null, 
		 	inCancel:Boolean = false, needBackName:Boolean = false, funArgArray:Array = null):void
		{
			dialogSprite.addEventListener(MouseEvent.CLICK, onClickDialogSprite);
			function onClickDialogSprite(evt:MouseEvent):void
			{
				var name:String = DisplayObject(evt.target).name;
				if (name == "btnClose" || name == "btnOK" || name == "btnCancel")
				{
					execute(nextFun,inCancel,name,needBackName,funArgArray);
					dialogSprite.removeEventListener(MouseEvent.CLICK, onClickDialogSprite);
				}
			}
		}
		
		private function execute(nextFun:Function,inCancel:Boolean,name:String,needBackName:Boolean,funArgArray:Array):void
		{
			if(nextFun == null){
				return;
			}
			//有返回参数的优先执行
			if(funArgArray != null)
			{
				nextFun.apply(null,funArgArray);
				return;
			}
			if(inCancel || name == "btnOK")
			{
				if(needBackName){
					funArgArray = [name];
				}
				nextFun.apply(null,funArgArray);
			}
		}
	}
}