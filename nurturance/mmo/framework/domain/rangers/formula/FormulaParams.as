package mmo.framework.domain.rangers.formula
{
	public class FormulaParams
	{
		private var _formulaId:int;
		private var _params:Object = {};
		
		public function FormulaParams(params:String){
			var arr1:Array = params.split("|");
			_formulaId = int(arr1[0]);
			if(arr1[1] == null){
				return;
			}
			var eStrs:Array = String(arr1[1]).split(",");
			var eParamArr:Array;
			for each(var eParamStr:String in eStrs){
				eParamArr = eParamStr.split("=");
				_params[eParamArr[0]] = Number(eParamArr[1]);
			}
		}

		public function get formulaId():int
		{
			return _formulaId;
		}

		public function get params():Object{
			return _params;
		}


	}
}