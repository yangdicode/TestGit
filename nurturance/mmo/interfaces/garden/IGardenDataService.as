package mmo.interfaces.garden
{
	import mmo.framework.domain.plant.GBarMainInfo;
	import mmo.framework.domain.plant.UserPlant;
	import mmo.interfaces.IService;
	
	public interface IGardenDataService extends IService
	{
		function updateGardenExp(exp:int):void;
		function updateGardenStarExp(exp:int):void;
		function getUserGardenInfo(owner:String):void;
		function addUserPlant(userPlant:UserPlant):void;
		function removeUserPlant(userPlant:UserPlant):void;
		function openNewFlowerpot(locationId:int):void;
		function getUsablePotCount():int;
		function refreshAllCrop():void;
		function get gBarMainInfo():GBarMainInfo;
		
		function get currBgId():int;
		function get userPlants():Array;
		function get userFlowerPots():Array;
		function saveGardenBackground(bgId:int):void;
	}
}