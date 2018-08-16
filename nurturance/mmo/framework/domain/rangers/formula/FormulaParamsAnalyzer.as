package mmo.framework.domain.rangers.formula
{
	public class FormulaParamsAnalyzer
	{
		private var _formulaInfo:Object = {};
		
		public function FormulaParamsAnalyzer(){
		}
		
		public function addFormulaParams(key:String, params:String):void{
			var fp:FormulaParams = new FormulaParams(params);
			_formulaInfo[key] = fp;
		}
		
		public function getFormulaParamsByKey(key:String):FormulaParams{
			if(!_formulaInfo.hasOwnProperty(key)){
				throw new Error("没有找到该公式参数。");
			}
			return _formulaInfo[key];
		}
		
	}
}