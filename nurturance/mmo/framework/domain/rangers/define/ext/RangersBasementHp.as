package mmo.framework.domain.rangers.define.ext
{
	public class RangersBasementHp extends RangersExtLvDefineBase
	{
		private var _increase:int;
		
		/**
		 * 额外的用户升级-堡垒血量
		 */		
		public function RangersBasementHp(lv:int, increase:int, needlv:int, demand:XML){
			_increase = increase;
			super(lv, needlv, demand);
		}

		/**
		 * 增加生命上限
		 */
		public function get increase():int
		{
			return _increase;
		}

	}
}