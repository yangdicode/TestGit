package mmo.framework.domain.profession
{
	public class ProfessionLvBase extends BattleAttribute
	{
		private var _professionId:int;
		private var _level:int;
		private var _needLightGold:int;
		
		public function ProfessionLvBase(id:int, lv:int, needLG:int, dodge:int, phyAtt:int, magAtt:int, life:int, phyDef:int, magDef:int, speed:int)
		{
			super(phyAtt, phyDef, magAtt, magDef, life, speed, 0, 0, dodge);
			_professionId = id;
			_level = lv;
			_needLightGold = needLG;
		}

		public function get professionId():int
		{
			return _professionId;
		}

		public function get level():int
		{
			return _level;
		}

		public function get needLightGold():int
		{
			return _needLightGold;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用 dodgePersent 
		**/
		public function get dodgeRate():Number
		{
			return dodgePersent;
		}

		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用 attackPower
		**/
		public function get phyAtatck():int
		{
			return attackPower;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用 magicPower
		**/
		public function get magAttack():int
		{
			return magicPower;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用hp
		**/
		public function get life():int
		{
			return hp;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用attackArmor 
		**/
		public function get phyDefense():int
		{
			return attackArmor;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用magicArmor 
		**/
		public function get magDefense():int
		{
			return magicArmor;
		}

	}
}