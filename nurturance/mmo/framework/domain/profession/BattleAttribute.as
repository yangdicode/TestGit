package mmo.framework.domain.profession
{
	public class BattleAttribute
	{
		public static const AttackPowerStr:String = "物攻";
		public static const AttackArmorStr:String = "物防";
		public static const MagicPowerStr:String = "魔攻";
		public static const MagicArmorStr:String = "魔防";
		public static const HpStr:String = "生命";
		public static const SpeedStr:String = "速度";
		
		private var _attackPower:int;
		private var _attackArmor:int;
		private var _magicPower:int;
		private var _magicArmor:int;
		private var _hp:int;
		private var _speed:int;
		
		private var _critiPersent:Number;
		private var _hitPersent:Number;
		private var _dodgePersent:Number;
		private var _extraDamage:int;
		
		public function BattleAttribute(attPow:int, attArm:int, magPow:int, magArm:int, hp:int, speed:int, 
			critPer:int = 0, hitPer:int = 0, dodPer:int = 0, extDam:int = 0){
			_attackArmor = attArm;
			_attackPower = attPow;
			_magicArmor = magArm;
			_magicPower = magPow;
			_hp = hp;
			_speed = speed;
			_critiPersent = Number(critPer / 100);
			_hitPersent = Number(hitPer / 100);
			_dodgePersent = Number(dodPer / 100);
			_extraDamage = extDam;
		}
		
		public static const EMPTY_ATT:BattleAttribute = new BattleAttribute(0, 0, 0, 0, 0, 0);

		/**
		 * 物理攻击
		 */		
		public function get attackPower():int{
			return _attackPower;
		}

		/**
		 * 物理防御
		 */		
		public function get attackArmor():int{
			return _attackArmor;
		}

		/**
		 * 魔法攻击
		 */		
		public function get magicPower():int
		{
			return _magicPower;
		}

		/**
		 * 魔法防御
		 */		
		public function get magicArmor():int{
			return _magicArmor;
		}

		/**
		 * 生命值
		 */		
		public function get hp():int{
			return _hp;
		}

		/**
		 * 速度
		 */		
		public function get speed():int{
			return _speed;
		}

		/**
		 * 暴击率
		 */
		public function get critiPersent():Number
		{
			return _critiPersent;
		}

		/**
		 * 命中率
		 */
		public function get hitPersent():Number
		{
			return _hitPersent;
		}

		/**
		 * 闪避率
		 */
		public function get dodgePersent():Number
		{
			return _dodgePersent;
		}

		/**
		 * 固定伤害
		 */
		public function get extraDamage():int
		{
			return _extraDamage;
		}

		
	}
}