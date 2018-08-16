package mmo.common
{
	import flash.events.FocusEvent;
	import flash.events.TextEvent;
	import flash.system.Capabilities;
	import flash.system.IME;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class Text
	{
		public function Text()
		{
		}
		
		//========== 去掉字符串前后空格 ==========
		public static function trim(s:String):String
		{
			return s.replace(/(^\s*)|(\s*$)/g,"");
		}
		//========== 去掉字符串所有空格 ==========
		public static function trimAll(s:String):String{
			return s.replace(/\s+/g, "");
		}

		//============== 全角转半角 ==============
		public static function SBCtoDBC(s:String):String
		{
		    var str:String = "";
		    var strlen:int = s.length;
		    for(var i:int = 0; i < strlen; i++)
		    {
		        var c:int = s.charCodeAt(i);
		        if(c == 12288)
		        {
		            str += String.fromCharCode(32);
		        }
		        else if(c == 12290)
		        {
		            str += String.fromCharCode(46);
		        }		        
		        else if(c > 65280 && c < 65375)
		        {
		            str += String.fromCharCode(c - 65248);
		        }
		        else str += String.fromCharCode(c);
		    }
		    return str;
		}
		
		public static function getString(s:String):String
		{
			return trim(SBCtoDBC(s));
		}
		
		//获得字符串长度，双字节字符算两个字符
		public static function getLength(s:String):int
		{
			var len:int = s.length;
			var strlen:int = s.length;
			for (var i:int = 0; i < strlen; i++)
			{
				if (s.charCodeAt(i) >= 255)
				{
					len++;
				}
			}
			return len;
		}
		
		/**
		 * 获得特定长度的字符串， 双字节字符算两个长度
		 * @param targetLent: 目标长度， 中文算2长度， 字母数字算1长度
		 */
		public static function getSubStr(source:String, targetLen:int):String
		{
			var len:int = source.length;
			var curLen:int = 0;
			for(var i:int = 0; i < len; i++){
				if(source.charCodeAt(i) >= 255)
				{
					curLen += 2;
				}else {
					curLen++;
				}
				if(curLen == targetLen){
					i++;
					break;
				}else if(curLen > targetLen){
					break;
				}
			}
			return source.substring(0, i);
		}

		public static function setPasswordTextField(textField:TextField, displayAsPassword:Boolean = true):void
		{
			textField.displayAsPassword = displayAsPassword;
			textField.addEventListener(TextEvent.TEXT_INPUT, checkCharacter);
			textField.addEventListener(FocusEvent.FOCUS_IN, stopIME);
			textField.addEventListener(FocusEvent.FOCUS_OUT, openIME);
		}
		
		public static function removePassworTextField(textField:TextField):void
		{
			textField.removeEventListener(TextEvent.TEXT_INPUT, checkCharacter);
			textField.removeEventListener(FocusEvent.FOCUS_IN, stopIME);
			textField.removeEventListener(FocusEvent.FOCUS_OUT, openIME);
		}	
		
		private static function checkCharacter(evt:TextEvent):void
		{
			//取消输入双字节符
			if (getLength(evt.text) > 1)
			{
				evt.preventDefault();
			}
		}
		
		private static function stopIME(evt:FocusEvent):void
		{
			if (Capabilities.hasIME)
			{
				IME.enabled = false;
			}
		}
		
		private static function openIME(evt:FocusEvent):void
		{
			if (Capabilities.hasIME)
			{
				IME.enabled = true;
			}
		}
	
		//设置文本框字体为红色。需要先设文字，再设颜色，否则无效
		public static function setTextRedColor(tf:TextField):void
		{
			var t:TextFormat = tf.getTextFormat();
			t.color = 0xCC0000;
			tf.setTextFormat(t);
		}
		
		public static function setTextDefaultColor(tf:TextField):void{
			var t:TextFormat = tf.getTextFormat();
			t.color = 0x000000;
			tf.setTextFormat(t);			
		}
	}
}