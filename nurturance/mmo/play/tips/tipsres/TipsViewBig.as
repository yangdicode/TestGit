package mmo.play.tips.tipsres{
	
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	public class TipsViewBig extends MovieClip {
		
		public function TipsViewBig() {
		}
		
		public function setMessage(message:String):void {
			var format:TextFormat = new TextFormat();
			format.align = TextFormatAlign.LEFT;
			
			var txt:TextField = this.getChildByName("txtmessagetitle") as TextField;
			txt.setTextFormat(format);
			txt.text = message;
			txt.selectable = false;
			txt.autoSize = TextFieldAutoSize.LEFT;
			txt.x = 6;
			txt.y = 5;
		}
		
		public function setMessageContent(message:String):void {
			var format:TextFormat = new TextFormat();
			format.align = TextFormatAlign.LEFT;
			
			var txtTitle:TextField = this.getChildByName("txtmessagetitle") as TextField;
			var txtContent:TextField = this.getChildByName("txtmessagecontent") as TextField;
			txtContent.setTextFormat(format);
			txtContent.multiline = true;
			txtContent.selectable = false;
			txtContent.width = txtTitle.width < 132 ? 132 : txtTitle.width;
			txtContent.autoSize = TextFieldAutoSize.LEFT;
			txtContent.text = message;
			txtContent.x = txtTitle.x;
			txtContent.y = txtTitle.y + txtTitle.height;
			
			var border:Sprite = this.getChildByName("mcborder") as Sprite;
			
			border.width = (txtTitle.width > txtContent.width ? txtTitle.width : txtContent.width) + 8;
			border.height = txtTitle.height + txtContent.height + 10;
		}
		
		public function setTitleColor(color:uint):void{
			var txtTitle:TextField = this.getChildByName("txtmessagetitle") as TextField;
			txtTitle.textColor = color;
		}
		
		public function setTextColor(color:uint):void{
			var txtContent:TextField = this.getChildByName("txtmessagecontent") as TextField;
			txtContent.textColor = color;
		}

	}
}