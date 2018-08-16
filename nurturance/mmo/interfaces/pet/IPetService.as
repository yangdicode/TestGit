package mmo.interfaces.pet
{
	import mmo.interfaces.IService;

	public interface IPetService extends IService
	{
		function showHandBook():void;
		function showDetailPanel(petId:int, level:int=1):void;
		function showManagePanel():void;
		function showQinLinBroodPanel():void;
		function showNPCBroodPanel():void;
		function setPetUnRide():void;
	}
}