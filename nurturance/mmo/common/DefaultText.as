package mmo.common
{
	import flash.events.FocusEvent;
	import flash.text.TextField;
	
	public class DefaultText
	{
		private var txt:TextField;
		public var defaultText:String;
		
		public function DefaultText(txt:TextField, defaultText:String)
		{
			this.txt = txt;
			this.txt.text = "";
			this.defaultText = defaultText;
		
			this.txt.text = this.defaultText;	
			this.txt.addEventListener(FocusEvent.FOCUS_IN, txtFocusIn);
			this.txt.addEventListener(FocusEvent.FOCUS_OUT, txtFocusOut);			
		}
		
		private function txtFocusIn(evt:FocusEvent):void
		{
			if(this.txt.text == this.defaultText)
			{
				this.txt.text = "";
			}
		}		
		
		private function txtFocusOut(evt:FocusEvent):void
		{
			if(this.txt.text == "")
			{
				this.txt.text = this.defaultText;	
			}
		}		

		public function dispose():void{
			this.txt.removeEventListener(FocusEvent.FOCUS_IN, txtFocusIn);
			this.txt.removeEventListener(FocusEvent.FOCUS_OUT, txtFocusOut);	
			this.txt = null;
			delete this;
		}
	}
}