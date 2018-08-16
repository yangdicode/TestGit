package mmo.framework.domain.fairy
{
	import mmo.framework.domain.profession.BattleAttribute;

	public class FairyEquipCard extends BattleAttribute
	{
		private var _id:int;
		private var _magicResistancePersent:int;
		
		public function FairyEquipCard(id:int, attackPower:int, magicPower:int, attackArmor:int, magicArmor:int, 
									   hp:int, speed:int, magicResistancePersent:int, critPersent:int, dodgePersent:int)
		{
			super(attackPower, attackArmor, magicPower, magicArmor, hp, speed, critPersent, 0, dodgePersent);
			this._id = id;
			this._magicResistancePersent = magicResistancePersent;
		}
		
		public function get id():int
		{
			return this._id;
		}
		
		public function get magicResistancePersent():int
		{
			return this._magicResistancePersent;
		}
		/** <del>废弃接口，不要再用了。</del>
		 * </br>请用 critiPersent 
		**/
		public function get critPersent():int
		{
			return critiPersent;
		}
		
	}
}