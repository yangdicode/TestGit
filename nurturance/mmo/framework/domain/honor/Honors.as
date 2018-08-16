package mmo.framework.domain.honor
{
	import com.adobe.utils.StringUtil;
	
	import flash.system.ApplicationDomain;

	public class Honors
	{
		private static var data:Object = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.EffortData")["data"];
		
		public function Honors()
		{
		}
		
		public static function getEffortData():Object{
			return data;
		}
		
		public static function getHonorType(type:String, subType:String = ""):Array{
			var arr:Array = [];
			for each(var effort:Effort in data){
				if(effort.type == type && (StringUtil.isEmpty(subType) || effort.subType == subType)){
					arr.push(effort);
				}
			}
			return arr;
		}
		
	}
}