package mmo.framework.domain.nuannuan
{
	public class NuanScoreEnum
	{
		public static const S:NuanScoreEnum = build("S", 7);
		public static const A:NuanScoreEnum = build("A", 6);
		public static const B:NuanScoreEnum = build("B", 5);
		public static const C:NuanScoreEnum = build("C", 1);
		public static const F:NuanScoreEnum = build("F", 0);
		/**
		 * 该任务未玩过
		 */		
		public static const HasntFinish:NuanScoreEnum = build("Fail", -1);
		
		private static var _descMap:Object;
		private static var _codeMap:Object;
		
		private var _desc:String;
		private var _code:int;
		
		private static function build(desc:String, code:int):NuanScoreEnum{
			_descMap ||= {};
			_codeMap ||= {};
			var score:NuanScoreEnum = new NuanScoreEnum(desc, code);
			_descMap[score.desc] = score;
			_codeMap[score.code] = score;
			return score;
		}
		
		public static function getScoreByGrade(desc:String):NuanScoreEnum{
			if(_descMap.hasOwnProperty(desc)){
				return _descMap[desc];
			}else{
				return HasntFinish;
			}
		}
		
		public static function getScoreByCode(code:int):NuanScoreEnum{
			if(_codeMap.hasOwnProperty(code)){
				return _codeMap[code];
			}else{
				return HasntFinish;
			}
		}
		
		public function NuanScoreEnum(desc:String, code:int){
			_desc = desc;
			_code = code;
		}
		
		public function get desc():String{
			return _desc;
		}
		
		public function get code():int{
			return _code;
		}
	}
}