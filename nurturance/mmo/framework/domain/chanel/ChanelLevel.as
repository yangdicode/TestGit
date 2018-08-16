package mmo.framework.domain.chanel
{
	public class ChanelLevel
	{
		public static const EmptyLevel:ChanelLevel = new ChanelLevel(0, 0, 1);
		private var _level:int;
		private var _needDiamond:int;
		private var _discount:Number;
		
		public function ChanelLevel(level:int, needDiamond:int, discount:Number){
			_level = level;
			_needDiamond = needDiamond;
			_discount = discount;
		}

		public function get discount():Number{
			return _discount;
		}

		public function get needDiamond():int{
			return _needDiamond;
		}

		public function get level():int{
			return _level;
		}
		
		public function get desc():String{
			var desc:String = "非贵族";
			switch(_level){
				case 1:desc = "白晶级";
					break;
				case 2:desc = "粉晶级";
					break;
				case 3:desc = "紫晶级";
					break;
				case 4:desc = "黄晶级";
					break;
			}
			return desc;
		}

	}
}