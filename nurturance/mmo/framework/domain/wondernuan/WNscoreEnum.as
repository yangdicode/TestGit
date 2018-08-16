package mmo.framework.domain.wondernuan
{
	public class WNscoreEnum
	{
		public static const S:WNscoreEnum = build("S", 7);
		public static const A:WNscoreEnum = build("A", 6);
		public static const B:WNscoreEnum = build("B", 5);
		public static const C:WNscoreEnum = build("C", 1);
		public static const F:WNscoreEnum = build("F", 0);
		/**
		 * 该任务未玩过
		 */		
		public static const HasntFinish:WNscoreEnum = build("Fail", -1);
		
		private static var _descMap:Object;
		private static var _codeMap:Object;
		
		private static function build(desc:String, code:int):WNscoreEnum{
			_descMap ||= {};
			_codeMap ||= {};
			var score:WNscoreEnum = new WNscoreEnum(desc, code);
			_descMap[score.desc] = score;
			_codeMap[score.code] = score;
			return score;
		}
		
		public function isGreaterThan(s:WNscoreEnum):Boolean
		{
			return code > s.code;
		}
		
		public static function getScoreByGrade(desc:String):WNscoreEnum{
			if(_descMap.hasOwnProperty(desc)){
				return _descMap[desc];
			}else{
				return HasntFinish;
			}
		}
		
		public static function getScoreByCode(code:int):WNscoreEnum{
			if(_codeMap.hasOwnProperty(code)){
				return _codeMap[code];
			}else{
				return HasntFinish;
			}
		}
		
		private var _desc:String;
		private var _code:int;
		
		public function WNscoreEnum(desc:String, code:int)
		{
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