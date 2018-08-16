package mmo.framework.domain.npcbattle
{
	import mmo.framework.domain.profession.ProfessionPotentialLvDefine;

	public class NpcFavorDefine extends ProfessionPotentialLvDefine
	{
		var _fp:int;
		var _awakeningAffectedFavor:int;
		var _awakeningState:int;
		
		public function NpcFavorDefine(npcId:int,favor:int,cost:int,desc:String,attackPower:int,magicPower:int,
				attackArmor:int,magicArmor:int,hp:int,speed:int,fp:int,
				awakeningAffectedFavor:int,awakeningState:int){
			super(npcId, favor, cost, desc, attackPower, magicPower, attackArmor, magicArmor, hp, speed);
			_fp = fp;
			_awakeningAffectedFavor = awakeningAffectedFavor;
			_awakeningState = awakeningState;
		}
		
		public function get npcId():int{
			return _professionId;
		}
		
		public function get favor():int{
			return potentLv;
		}
		
		public function get desc():String{
			return description;
		}
		
		public function get fp():int	{
			return _fp;
		}
		
		public function get awakeningAffectedFavor():Boolean{
			return Boolean(_awakeningAffectedFavor);
		}
		
		public function get awakeningState():int{
			return _awakeningState;
		}
		
		override public function get lvUpNeedItemId():int{
			return 2283;
		}

	}
}