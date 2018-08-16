package mmo.framework.domain.npcbattle
{
	import mmo.framework.domain.profession.ProfessionLvBase;
	
	public class NpcBattleLvDefine extends ProfessionLvBase
	{
		private var _fp:int;
		private var _commonSkills:Array;
		private var _bestSkills:Array;
		
		public function NpcBattleLvDefine(id:int, lv:int, needLG:int, phyAtt:int, magAtt:int, life:int, phyDef:int, magDef:int, speed:int, dodge:int, fp:int, commonSkill:String, bestSkill:String)
		{
			super(id, lv, needLG, dodge, phyAtt, magAtt, life, phyDef, magDef, speed);
			_fp = fp;
			_commonSkills = parseSkills(commonSkill);
			_bestSkills = parseSkills(bestSkill);
		}
		
		private function parseSkills(skills:String):Array{
			var arr:Array;
			if(skills == "" || skills == null){
				arr = [];
			}else{
				arr = skills.split(",");
			}
			return arr;
		}

		public function get fp():int
		{
			return _fp;
		}

		public function get commonSkills():Array
		{
			return _commonSkills;
		}

		public function get bestSkills():Array
		{
			return _bestSkills;
		}


	}
}