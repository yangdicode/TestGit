package mmo.common
{
	import flash.display.DisplayObject;
	import flash.events.Event;
	
	public class ModalDialogEvent extends Event
	{
		// 确定
		public static const OK:String = "ModalDialogOK";
		// 取消
		public static const CANCEL:String = "ModalDialogCancel";
		// 叉叉~~
		public static const CLOSE:String = "ModalDialogClose";
		
		public function ModalDialogEvent(type:String)
		{
			super(type);
		}

	}
}