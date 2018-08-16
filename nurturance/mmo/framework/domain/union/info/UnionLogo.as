package mmo.framework.domain.union.info
{
	import com.adobe.utils.StringUtil;

	/**
	 * 联盟徽章
	 * @author wangrentong
	 */	
	public class UnionLogo
	{
		private static const Separate:String = "|";
		private var _text:String;
		private var _style:int;
		private var _color:uint;
		
		public function UnionLogo(info:String){
			if(StringUtil.isEmpty(info)){
				return;
			}
			var strArr:Array = info.split(Separate);
			_text = strArr[0];
			_style = int(strArr[1]);
			_color = int(strArr[2]);
		}
		
		public static function build(word:String, style:int, color:int):UnionLogo{
			var arr:Array = [word, String(style), String(color)];
			return new UnionLogo(arr.join(Separate));
		}
		
		public function toString():String{
			var arr:Array = [_text, String(_style), String(_color)];
			return arr.join(Separate);
		}
		
		public function get hasDesign():Boolean{
			return !StringUtil.isEmpty(_text);
		}

		/** 文字 */
		public function get text():String{
			return _text;
		}

		/** 样式 */
		public function get style():int{
			return _style;
		}

		/** 颜色 */
		public function get color():uint{
			return _color;
		}


	}
}