package mmo.framework.domain.rangers.define
{
	import mmo.framework.domain.rangers.formula.FormulaParams;
	import mmo.framework.domain.rangers.formula.FormulaParamsAnalyzer;

	public class RangersDefine
	{
		public static const EnergyFormulaParams:String = "EnergyFormulaParams";
		public static const NeedExpFormulaParams:String = "NeedExpFormulaParams";
		public static const FeedExpFormulaParams:String = "FeedExpFormulaParams";
		public static const SaleFormulaParams:String = "SaleFormulaParams";
		public static const AttackFormulaPraams:String = "AttackFormulaPraams";
		public static const HpFormulaParams:String = "HpFormulaParams";
		
		private var _id:int;
		private var _name:String;
		private var _desc:String;
		private var _isSeries:Boolean;
		private var _star:int;
		private var _type:String;
		private var _attackSpeed:int;
		private var _attackDistance:int;
		private var _attackRange:int;
		private var _moveSpeed:int;
		private var _initLv:int;
		private var _maxLv:int;
		private var _cd:Number;
		private var _initEnergy:int;
		private var _formulaParamsAnalyzer:FormulaParamsAnalyzer = new FormulaParamsAnalyzer();
		
		public function RangersDefine(id:int, name:String, isSeries:int, desc:String, star:int, type:String, 
			  attackRange:int, attackDistance:int, attackSpeed:int, moveSpeed:int, 
			  initLv:int, maxLv:int, cd:int, initEnergy:int, 
			  energyFormula:String, needExpFormula:String, feedExpFormula:String, 
			  saleFormula:String, attackFormula:String, hpFormula:String){
			_id = id;
			_name = name;
			_desc = desc;
			_isSeries = isSeries == 1;
			_star = star;
			_type = type;
			_attackSpeed = attackSpeed;
			_attackDistance = attackDistance;
			_attackRange = attackRange;
			_moveSpeed = moveSpeed;
			_initLv = initLv;
			_maxLv = maxLv;
			_cd = cd;
			_initEnergy = initEnergy;
			
			_formulaParamsAnalyzer.addFormulaParams(EnergyFormulaParams, energyFormula);
			_formulaParamsAnalyzer.addFormulaParams(NeedExpFormulaParams, needExpFormula);
			_formulaParamsAnalyzer.addFormulaParams(FeedExpFormulaParams, feedExpFormula);
			_formulaParamsAnalyzer.addFormulaParams(SaleFormulaParams, saleFormula);
			_formulaParamsAnalyzer.addFormulaParams(AttackFormulaPraams, attackFormula);
			_formulaParamsAnalyzer.addFormulaParams(HpFormulaParams, hpFormula);
		}

		public function get id():int
		{
			return _id;
		}

		public function get name():String
		{
			return _name;
		}

		/**
		 * 星级
		 */
		public function get star():int
		{
			return _star;
		}

		/**
		 * 类型
		 */
		public function get type():String
		{
			return _type;
		}

		/**
		 * 攻击速度
		 */
		public function get attackSpeed():int
		{
			return _attackSpeed;
		}

		/**
		 * 攻击距离
		 */
		public function get attackDistance():int
		{
			return _attackDistance;
		}
		
		/**
		 * 攻击范围
		 */
		public function get attackRange():int
		{
			return _attackRange;
		}

		/**
		 * 初始最高等级
		 */
		public function get initLv():int
		{
			return _initLv;
		}

		/**
		 * 最终最高等级
		 */
		public function get maxLv():int
		{
			return _maxLv;
		}

		/**
		 * 生产cd
		 */
		public function get cd():Number
		{
			return _cd;
		}

		public function getFormulaParamsByKey(key:String):FormulaParams{
			return _formulaParamsAnalyzer.getFormulaParamsByKey(key);
		}

		/**
		 * 移动速度
		 */
		public function get moveSpeed():int
		{
			return _moveSpeed;
		}

		/**
		 * 是否系列
		 */
		public function get isSeries():Boolean
		{
			return _isSeries;
		}

		/**
		 * 初始消耗能量
		 */
		public function get initEnergy():int
		{
			return _initEnergy;
		}

		/**
		 * 30为一秒移动一屏幕宽度；前端区间：(0,2]为非常慢、(2,4]为慢、(4,6]为一般、(6,7]为快、(7,9]为非常快
		 */			
		public function get moveSpeedDesc():String{
			if(_moveSpeed <= 2){
				return "超慢";
			}else if(_moveSpeed <= 4){
				return "慢";
			}else if(_moveSpeed <= 6){
				return "正常";
			}else if(_moveSpeed <= 7){
				return "快";
			}
			return "超快";
		}
		/**
		 * 60为一秒一次攻击频率；前端区间：(0,20]为非常慢、(20,40]为慢、(40-60]为一般、(60,70]为快、(70-90]为非常快
		 */	
		public function get attackSpeedDesc():String{
			if(_moveSpeed <= 20){
				return "超慢";
			}else if(_moveSpeed <= 40){
				return "慢";
			}else if(_moveSpeed <= 60){
				return "正常";
			}else if(_moveSpeed <= 70){
				return "快";
			}
			return "超快";
		}

		/**
		 * 描述
		 */
		public function get desc():String
		{
			return _desc;
		}


	}
}