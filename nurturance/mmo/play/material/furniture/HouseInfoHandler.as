package mmo.play.material.furniture
{
	import mmo.framework.domain.MainModelLocator;
	import mmo.framework.domain.house.HouseInfo;
	import mmo.framework.domain.house.HouseInfoEvent;
	import mmo.framework.domain.material.furniture.UserFurniture;
	
	public class HouseInfoHandler
	{
		public function HouseInfoHandler()
		{
			var houseInfo:HouseInfo = MainModelLocator.instance.retrieveModel(HouseInfo) as HouseInfo;
			houseInfo.addEventListener(HouseInfoEvent.HOUSERESET, onHouseReset);
		}
		
		private function onHouseReset(evt:HouseInfoEvent):void
		{
			var houseInfo:HouseInfo = MainModelLocator.instance.retrieveModel(HouseInfo) as HouseInfo;
			var furnitures:Array = houseInfo.getFurnitures();
			for each(var userFur:UserFurniture in FurnitureFacade.instance.getUserFurnitures())
			{
				userFur.usedUp = 0;
			}
			for each(var showedFur:UserFurniture in houseInfo.getFurnitures())
			{
				var myFur:UserFurniture = FurnitureFacade.instance.getMyFurnitureById(showedFur.materialId);
				myFur.usedUp += showedFur.usedUp;
			}
		}	
	}
}