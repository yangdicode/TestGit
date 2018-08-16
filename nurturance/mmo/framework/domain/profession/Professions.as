package mmo.framework.domain.profession
{
	import flash.system.ApplicationDomain;

	public class Professions
	{
		private static const proData:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ProfessionData") as Class;
			
		private static var data:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ProfessionData")["data"];
		private static var protentData:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.ProfessionPotentialLvData")["data"];
		public function Professions()
		{
		}
		
		public static function getAllProfession():Object
		{
			return data;
		}
		
		public static function getAllProArray():Array
		{
			var proArray:Array = new Array();
			for each(var pro:Profession in data)
			{
				proArray.push(pro);
			}
			proArray.sortOn(["id"],Array.NUMERIC);
			return proArray;
		}
		
		/** 职业选择面板专用 **/
		public static function getSelectProPanelOrderConfig():Object{
			return proData["orderConfig"];
		}
		
		public static function getProfession(proId:int):Profession
		{
			return data[proId];
		}	
		
		public static function getPotentByLv(proId:int, proLv:int):ProfessionPotentialLvDefine{
			var key:String = proId + "_" + proLv;
			if(!protentData.hasOwnProperty(key)){
				return ProfessionPotentialLvDefine.getZeroProtent(proId);
			}
			return protentData[key];
		}
		
		public static function get maxPotentLv():int{
			return 10;
		}
		
		private function compile():void{
			ProfessionPotentialLvDefine;
		}
	}
}