package mmo.framework.domain.rangers.define.ext
{
	public class RangersMaxEnergy extends RangersExtLvDefineBase
	{
		private var _increase:int;
		/**
		 * 额外的用户升级-最大能量加成
		 */		
		public function RangersMaxEnergy(lv:int, increase:int, needlv:int, demand:XML){
			super(lv, needlv, demand);
			_increase = increase;
		}

		/**
		 * 加成
		 */
		public function get increase():int
		{
			return _increase;
		}

	}
}