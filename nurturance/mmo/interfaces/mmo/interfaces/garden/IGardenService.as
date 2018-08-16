package mmo.interfaces.garden
{
	import mmo.framework.domain.plant.GardenInfo;
	import mmo.interfaces.IService;
	
	public interface IGardenService extends IService
	{
		/**
		 * 进入花园
		 * @param ownerName：为空则进入自己的花园
		 */		
		function enterGarden(ownerName:String = null):void;
		function get gardenInfo():GardenInfo;
		function get isMyGarden():Boolean;
		//function set gardenData(value:IGardenDataService):void;
		function get gardenData():IGardenDataService;
		function set interacts(value:Array):void;
		function get interacts():Array;
		function interactsInitData():void;
		function interactsOnSceneInit():void;
		function interactsOnSceneDispose():void;
	}
}