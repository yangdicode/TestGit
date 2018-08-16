package mmo.framework.domain.chanel
{
	import mmo.common.DateUtil;
	import mmo.framework.model.changeable.ChangeableObject;

	public class UserChanelInfo extends ChangeableObject
	{
		
		public var isChanelMember:Boolean;
		
		private static const Level:String = "level";
		private static const BeDate:String = "beData";
		private static const Diamond1:String = "diamond1";
		private static const Diamond2:String = "diamond2";
		
		public function get level():int{
			return int(getValue(Level));
		}
		
		public function set level(lv:int):void{
			isChanelMember = lv > 0;
			setValue(Level, lv);
		}
		
		/**
		 * 8周内收集的钻石
		 */		
		public function get diamond1():int{
			return int(getValue(Diamond1));
		}
		
		public function set diamond1(value:int):void{
			setValue(Diamond1, value);
		}
		/**
		 * 12周内收集的钻石
		 */		
		public function get diamond2():int{
			return int(getValue(Diamond2));
		}
		
		public function set diamond2(value:int):void{
			setValue(Diamond2, value);
		}
		
		public function get beDate():Number{
			return Number(getValue(BeDate));
		}
		
		public function set beDate(value:Number):void{
			var bd:Date = new Date(value);
			if(DateUtil.addDay(bd, 56).time < DateUtil.getServerTime().time){
				value = DateUtil.addDay(DateUtil.getServerTime(), -56).time;
			}
			setValue(BeDate, value);
		}
		
	}
}