package mmo.framework.domain.weapon
{
	import mmo.framework.domain.profession.BattleAttribute;

	public class WeaponEquipLv extends BattleAttribute
	{
		public static const EMPTY_WEAPON:WeaponEquipLv = new WeaponEquipLv(0, 0, "", 0, 0, 0, 0, 0, 0, 0, 0);
		private var _id:int;
		private var _lv:int;
		private var _name:String;
		private var _lvUpNeedScore:int;
		
		public function WeaponEquipLv(id:int, lv:int, name:String, phyAtt:int, magAtt:int, phyDef:int, magDef:int, life:int, speed:int, lvUpNeedScore:int, extDamage:int)
		{
			super(phyAtt, phyDef, magAtt, magDef, life, speed, 0, 0, 0, extDamage);
			_id = id;
			_lv = lv;
			_name = name;
			_lvUpNeedScore = lvUpNeedScore;
		}

		public function get id():int{
			return _id;
		}

		public function get lv():int{
			return _lv;
		}

		public function get name():String{
			return _name;
		}

		/** <del>废弃接口，不要再用了。</del>
		 * </br> 请用attackPower 
		 **/		
		public function get phyAtt():int{
			return attackPower;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br> 请用attackArmor 
		 **/	
		public function get phyDef():int{
			return attackArmor;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用magicPower 
		 **/	
		public function get magAtt():int
		{
			return magicPower;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br> 请用magicArmor 
		 **/	
		public function get magDef():int{
			return magicArmor;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br> 请用hp
		 **/	
		public function get life():int{
			return hp;
		}
		
		public function get lvUpNeedScore():int{
			return _lvUpNeedScore;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br> 请用 extraDamage 
		 **/	
		public function get extDamage():int{
			return extraDamage;
		}


	}
}