package mmo.framework.domain.rangers.define
{
	public class RangersUserLvDefine
	{
		private var _lv:int;
		private var _exp:int;
		private var _maxEnergy:int;
		private var _energyUpSpeed:int;
		private var _basementHp:int;
		
		public function RangersUserLvDefine(lv:int, exp:int, maxEnergy:int, upSpeed:int, hp:int){
			_lv = lv;
			_exp = exp;
			_maxEnergy = maxEnergy;
			_energyUpSpeed = upSpeed;
			_basementHp = hp;
		}

		public function get lv():int
		{
			return _lv;
		}

		/**
		 * 升级需要经验
		 */
		public function get exp():int
		{
			return _exp;
		}

		/**
		 * 星灵能量上升速度
		 */
		public function get energyUpSpeed():int
		{
			return _energyUpSpeed;
		}

		/**
		 * 鲜花堡垒血量
		 */
		public function get basementHp():int
		{
			return _basementHp;
		}

		/**
		 * 星灵能量上限
		 */
		public function get maxEnergy():int
		{
			return _maxEnergy;
		}


	}
}