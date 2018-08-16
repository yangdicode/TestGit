package mmo.framework.domain.rangers.define.ext
{
	public class RangersMissile extends RangersExtLvDefineBase
	{
		private var _power:int;
		
		/**
		 * 额外的用户升级-导弹攻击力
		 */	
		public function RangersMissile(lv:int, power:int, needlv:int, demand:XML)
		{
			super(lv, needlv, demand);
			_power = power;
		}
		
		/**
		 * 攻击力
		 */		
		public function get power():int
		{
			return _power;
		}

	}
}