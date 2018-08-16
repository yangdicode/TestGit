package mmo.framework.domain.dreamcard
{
	public class DreamCardType
	{
		/**
		 * 银卡
		 */		
		public static const Silver:DreamCardType = build(1, "银卡");
		/**
		 * 金卡
		 */		
		public static const Gold:DreamCardType = build(2, "金卡");
		/**
		 * 闪卡
		 */		
		public static const Twinkle:DreamCardType = build(3, "闪卡");
		
		public static function get allType():Array{
			return [Silver, Gold, Twinkle];
		}
		
		private var _type:int;
		private var _name:String;
		
		private static function build(type:int, name:String):DreamCardType{
			return new DreamCardType(type, name);
		}
		
		public function DreamCardType(type:int, name:String){
			_type = type;
			_name = name;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function get name():String
		{
			return _name;
		}
		
	}
}