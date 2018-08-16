package mmo.framework.domain.profession
{
	public class ProfessionPotentialLvDefine extends BattleAttribute
	{
		protected var _professionId:int;
		protected var _potentLv:int;
		protected var _lvUpCost:int;
		protected var _description:String;
		
		public function ProfessionPotentialLvDefine(pro:int, lv:int, cost:int, desc:String, attPow:int, magPow:int, 
			attArm:int, magArm:int, hp:int, speed:int){
			super(attPow, attArm, magPow, magArm, hp, speed);
			this._professionId = pro;
			this._potentLv = lv;
			this._lvUpCost = cost;
			this._description = desc;
		}
		
		public static function getZeroProtent(proId:int):ProfessionPotentialLvDefine{
			return new ProfessionPotentialLvDefine(proId, 0, 0, "", 0, 0, 0, 0, 0, 0);
		}

		public function get professionId():int
		{
			return _professionId;
		}

		public function get potentLv():int
		{
			return _potentLv;
		}

		public function get lvUpCost():int
		{
			return _lvUpCost;
		}

		public function get description():String
		{
			return _description;
		}
		
		public function get lvUpNeedItemId():int{
			return 2282;
		}

	}
}