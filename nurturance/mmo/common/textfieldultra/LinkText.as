package mmo.common.textfieldultra
{
	import com.adobe.utils.StringUtil;
	
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;

	public class LinkText
	{
		private var _textField:TextField;
		private var _clickCall:Object = {};
		private var _content:String = "";
		
		public function LinkText(text:TextField){
			_textField = text;
			_textField.addEventListener(Event.REMOVED_FROM_STAGE, dispose);
			_textField.addEventListener(TextEvent.LINK, onClickText);
		}
		
		public function clear():void{
			_content = "";
			_textField.text = "";
			_clickCall = {};
		}
		
		public function addLinkText(content:String, clickCall:Function, callParams:Array = null, color:String = "#66FFFF", linkKey:String = ""):void{
			var event:String = StringUtil.isEmpty(linkKey) ? content : linkKey;
			var htmlText:String = "<u><a href=\"event:" + event + "\">";
			
			if(!StringUtil.isEmpty(color)){
				htmlText += "<font color=\"" + color + "\">";
			}
			htmlText += content;
			if(!StringUtil.isEmpty(color)){
				htmlText += "</font>";
			}
			htmlText += "</a></u>";
			_content = _content.concat(htmlText);
			_clickCall[event] = {"call":clickCall, "params":callParams};
			_textField.htmlText = _content;
		}
		
		public function addText(content:String, color:String = "", br:Boolean = false):void{
			var htmlText:String = "";
			if(!StringUtil.isEmpty(color)){
				htmlText += "<font color=\"" + color + "\">";
			}
			if(br)
			{
				htmlText += "<b>";
			}
			htmlText += content;
			if(br)
			{
				htmlText += "</b>";
			}
			if(!StringUtil.isEmpty(color)){
				htmlText += "</font>";
			}
			_content = _content.concat(htmlText);
			_textField.htmlText = _content;
		}
		
		private function dispose(evt:Event):void{
			_textField.removeEventListener(Event.REMOVED_FROM_STAGE, dispose);
			_textField.removeEventListener(TextEvent.LINK, onClickText);
			_textField = null;
			_clickCall = null;
		}
		
		private function onClickText(evt:TextEvent):void{
			var target:String = evt.text;
			var ojb:Object = _clickCall[target];
			ojb["call"].apply(null, ojb["params"]);
		}
		
	}
}