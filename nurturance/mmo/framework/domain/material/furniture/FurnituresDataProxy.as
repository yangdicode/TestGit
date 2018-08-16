package mmo.framework.domain.material.furniture
{
	import flash.system.ApplicationDomain;

	public class FurnituresDataProxy
	{
		public function FurnituresDataProxy()
		{
		}
		
		public static function getFurnitureDefine(furnitureId:int):Furniture
		{
			var funitureData:Class = ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.FurnitureData") as Class;
			var data:Object = funitureData["data"];
			return data[furnitureId] as Furniture;
		}	
		
	
		
		public static function getHouseMaterialTypeById(furnitureId:int):int
		{

			
			var furnitureTypeData:Object = (ApplicationDomain.currentDomain.getDefinition("mmo.materialdata.HouseMaterialDisplayData") as Class)["data"];
			return new int(furnitureTypeData["3" + "_" + furnitureId.toString()]["hmt"]);
		}	
	}
}