package mmo.play.tips {
	
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	import flash.display.InteractiveObject;

	public class TipsInfoComplex extends TipsInfo {
		
		//~ constants ---------------------------------------------------------
		
		/** 不同类型的Tips，字体的颜色有所不同 */
		private static const titleColorMap:Array = [uint(0xFFFFFF),uint(0xFF3300)];
		private static const textColorMap:Array = [uint(0xFFCC00),uint(0xFFCC00)];
		
		//~ fields ------------------------------------------------------------
		
		private var _messageContent:String;
		
		//~ public methods ----------------------------------------------------
		
		public function TipsInfoComplex(content:InteractiveObject, 
				message:String, messageContent:String,
				delay:uint, 
				deltaX:int, deltaY:int, tipsType:int) {
			super(content, message, delay, deltaX, deltaY, tipsType);
			this._messageContent = messageContent;
		}
		
		public function get messageContent():String {
			return this._messageContent;
		}
		
		public function get textColor():uint{
			return textColorMap[this._tipsType];
		}
		
		public override function get titleColor():uint{
			return titleColorMap[this._tipsType];
		}
		
		override public function get className():String {
			return "mmo.play.tips.tipsres.TipsViewBig";
		}
		
		//~ private methods ---------------------------------------------------
		
		
	}
}