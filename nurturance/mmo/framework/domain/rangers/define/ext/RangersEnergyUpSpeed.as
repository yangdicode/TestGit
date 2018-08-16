package mmo.framework.domain.rangers.define.ext
{
	public class RangersEnergyUpSpeed extends RangersExtLvDefineBase
	{
		private var _multiple:Number;
		
		/**
		* 额外的用户升级-能量上升速度
		*/	
		public function RangersEnergyUpSpeed(lv:int, multiple:Number, needlv:int, demand:XML){
			super(lv, needlv, demand);
			_multiple = multiple;
		}
		
		/**
		 * 提升倍率
		 */
		public function get multiple():Number
		{
			return _multiple;
		}

	}
}