package mmo.framework.domain.card
{
	import com.adobe.utils.StringUtil;
	
	import mmo.framework.domain.material.Material;
	import mmo.framework.domain.material.MaterialTypes;
	import mmo.framework.domain.profession.BattleAttribute;

	public class EquipCard extends Material
	{
		private var _equipType:String;
		private var _extDesc:String;
		
		private var _battleAttr:BattleAttribute;
		
		private var _resistancePercent:int;
		
		private var _limitPros:Array;
		private var _limitProLv:int;
		private var _recommandPro:String;
		
		private var _eId:int;
		private var _eLv:int;
		
		public function EquipCard(id:int,
								  	name:String,
									equipType:String, 
									limitPro:String, 
									limitProLv:int,
									extDesc:String,
									
									attPow:int,
									magPow:int, 
								  	attArm:int,
									magArm:int,
									hp:int,
									speed:int,
									
									resistancePercent:int,
									dodgePercent:int,
									criticalPercent:int,
									hitPercent:int, 
									recommandPro:String, 
									eIdLv:String){
			super(id, MaterialTypes.EQUIPCARDITEM, name, 300, 0, 0, 0, 0, "", 0, {});
			_equipType = equipType;
			_extDesc = extDesc;
			_battleAttr = new BattleAttribute(attPow, attArm, magPow, magArm, hp, speed, criticalPercent, hitPercent, dodgePercent);
			_resistancePercent = resistancePercent;
			if(StringUtil.isEmpty(limitPro)){
				_limitPros = [];
			}else{
				_limitPros = limitPro.split(",");
			}
			_limitProLv = limitProLv;
			_recommandPro = recommandPro;
			
			var eIdLvs:Array = eIdLv.split("-");
			_eId = int(eIdLvs[0]);
			_eLv = int(eIdLvs[1]);
		}
		
		
		public function get hitPercent():int{
			return _battleAttr.hitPersent;
		}
		
		public function get equipType():String{
			return _equipType;
		}
		
		public function get criticalPercent():int{
			return _battleAttr.critiPersent;
		}

		public function get dodgePercent():int{
			return _battleAttr.dodgePersent;
		}

		public function get resistancePercent():int{
			return _resistancePercent;
		}
		
		public function get battleAttr():BattleAttribute{
			return _battleAttr;
		}

		public function get extDesc():String{
			return _extDesc;
		}

		public function get limitPros():Array
		{
			return _limitPros;
		}

		public function get limitProLv():int
		{
			return _limitProLv;
		}

		public function get recommandPro():String
		{
			return _recommandPro;
		}

		public function get eId():int
		{
			return _eId;
		}

		public function get eLv():int
		{
			return _eLv;
		}


	}
}