package mmo.framework.domain.rangers
{
	import mmo.framework.domain.rangers.define.RangersDefine;
	import mmo.framework.domain.rangers.define.RangersEvoDefine;
	import mmo.framework.domain.rangers.define.RangersGoods;
	import mmo.framework.domain.rangers.define.RangersMissionDefine;
	import mmo.framework.domain.rangers.define.RangersSeries;
	import mmo.framework.domain.rangers.define.RangersTaskDefine;
	import mmo.framework.domain.rangers.define.RangersUserLvDefine;
	import mmo.framework.domain.rangers.define.ext.RangersBasementHp;
	import mmo.framework.domain.rangers.define.ext.RangersEnergyUpSpeed;
	import mmo.framework.domain.rangers.define.ext.RangersMaxEnergy;
	import mmo.framework.domain.rangers.define.ext.RangersMissile;
	import mmo.framework.domain.rangers.formula.FormulaParams;
	import mmo.framework.domain.rangers.formula.FormulaParamsAnalyzer;

	public class CompileRangersDefine
	{
		public function CompileRangersDefine()
		{
		}
		
		private function compile():void{
			RangersUserLvDefine;
			RangersDefine;
			RangersMissionDefine;
			RangersEvoDefine;
			
			RangersBasementHp;
			RangersEnergyUpSpeed;
			RangersMaxEnergy;
			RangersMissile;
			
			FormulaParams;
			FormulaParamsAnalyzer;
			
			RangersGoods;
			RangersSeries;
			RangersTaskDefine;
		}
	}
}