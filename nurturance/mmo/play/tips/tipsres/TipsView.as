package mmo.play.tips.tipsres{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class TipsView extends MovieClip {
		
		//~ public methods ----------------------------------------------------
		
		public function TipsView() {
		}
		
		public function setMessage(message:String):void {
			var format:TextFormat = new TextFormat();
			format.align = TextFormatAlign.CENTER;
			
			var txt:TextField = this.getChildByName("txtmessage") as TextField;
			txt.setTextFormat(format);
			txt.text = message;
			txt.selectable = false;
			txt.autoSize = TextFieldAutoSize.CENTER;
			txt.x = -txt.width / 2;
			
			var border:Sprite = this.getChildByName("mcborder") as Sprite;
			
			border.width = txt.width + txt.length/2;
			border.x = txt.x;
		}
		
		public function setTitleColor(color:uint):void{
			var txt:TextField = this.getChildByName("txtmessage") as TextField;
			txt.textColor = color;
		}

	}
}